const { PrismaClient } = require("@prisma/client");
const fs = require("fs").promises;
const path = require("path");
const { batchCreate, batchUpdateRelations } = require("./batchUtils");

const prisma = new PrismaClient({
  datasources: {
    db: {
      url: process.env.DB_URL,
    },
  },
});

async function main() {
  const [artistData, labelData, recordData] = await Promise.all([
    fs
      .readFile(path.join(__dirname, "../json/filtered_artists.json"), "utf8")
      .then(JSON.parse),
    fs
      .readFile(path.join(__dirname, "../json/filtered_labels.json"), "utf8")
      .then(JSON.parse),
    fs
      .readFile(path.join(__dirname, "../json/filtered_records.json"), "utf8")
      .then(JSON.parse),
  ]);

  const uniqueGenres = new Set();
  const uniqueStyles = new Set();
  const uniqueCountries = new Set();
  const uniqueYears = new Set();

  // console.log("Step 1: Create Artists and Labels without relations");
  // await batchCreate(
  //   prisma.artist,
  //   Object.values(artistData).map((item) => ({
  //     id: item.artist_id,
  //     profile: item.artist_profile,
  //     name: item.artist_name,
  //     sites: item.artist_sites || [],
  //     realName: item.artist_real_name,
  //   }))
  // );

  // await batchCreate(
  //   prisma.label,
  //   Object.values(labelData).map((item) => ({
  //     id: item.label_id,
  //     name: item.label_name,
  //     sites: item.label_sites || [],
  //     profile: item.label_profile,
  //   }))
  // );

  console.log("Step 2: Collecting unique Genres, Styles, Countries, and Years");
  Object.values(recordData).forEach((item) => {
    (item.record_genres || []).forEach((genre) => uniqueGenres.add(genre));
    (item.record_styles || []).forEach((style) => uniqueStyles.add(style));
    (item.countries || []).forEach((country) => uniqueCountries.add(country));
    if (item.record_year) uniqueYears.add(item.record_year);
  });

  // console.log("Step 3: Create Genres, Styles, Countries, and Years");
  // await batchCreate(
  //   prisma.genre,
  //   Array.from(uniqueGenres).map((id) => ({ id }))
  // );
  // await batchCreate(
  //   prisma.style,
  //   Array.from(uniqueStyles).map((id) => ({ id }))
  // );
  // await batchCreate(
  //   prisma.country,
  //   Array.from(uniqueCountries).map((id) => ({ id }))
  // );
  // await batchCreate(
  //   prisma.year,
  //   Array.from(uniqueYears).map((id) => ({ id: parseInt(id, 10) })) // Convert string to integer
  // );

  // console.log("Step 4: Create Records without relations");
  // await batchCreate(
  //   prisma.record,
  //   Object.values(recordData).map((item) => ({
  //     id: item.record_id,
  //     rating: item.record_rating,
  //     name: item.record_name,
  //     youtubeIds: item.record_youtube_ids || [],
  //   }))
  // );

  // Create a new object with records from index 140350 onwards
  // let slicedRecordDataObject = Object.keys(recordData)
  //   .slice(400000)
  //   .reduce((obj, key) => {
  //     obj[key] = recordData[key];
  //     return obj;
  //   }, {});

  // console.log("Step 5: Update Records with relations");
  // await batchUpdateRelations(
  //   prisma.record,
  //   Object.values(recordData).map((item) => ({
  //     id: parseInt(item.record_id, 10),
  //     data: {
  //       genres: { connect: (item.record_genres || []).map((id) => ({ id })) },
  //       styles: { connect: (item.record_styles || []).map((id) => ({ id })) },
  //       countries: { connect: (item.countries || []).map((id) => ({ id })) },
  //       artists: { connect: item.record_artists.map((id) => ({ id })) },
  //       labels: { connect: item.record_labels.map((id) => ({ id })) },
  //       year: item.record_year
  //         ? { connect: { id: parseInt(item.record_year, 10) } }
  //         : undefined,
  //     },
  //   })),
  //   "id"
  // );

  console.log(
    "Step 6: Find years, countries, genres, and styles for artists and labels"
  );

  // Maps to keep track of the countries, years, genres, and styles associated with each artist and label
  const artistCountriesYearsGenresStylesMap = {};
  const labelCountriesYearsGenresStylesMap = {};

  // Iterate over the records to collect countries, years, genres, and styles for artists and labels
  Object.values(recordData).forEach((record) => {
    // Artists
    record.record_artists.forEach((artistId) => {
      if (!artistCountriesYearsGenresStylesMap[artistId]) {
        artistCountriesYearsGenresStylesMap[artistId] = {
          countries: new Set(),
          years: new Set(),
          genres: new Set(),
          styles: new Set(),
        };
      }
      record.countries.forEach((countryId) =>
        artistCountriesYearsGenresStylesMap[artistId].countries.add(countryId)
      );
      if (record.record_year) {
        artistCountriesYearsGenresStylesMap[artistId].years.add(
          record.record_year
        );
      }
      record.record_genres.forEach((genreId) =>
        artistCountriesYearsGenresStylesMap[artistId].genres.add(genreId)
      );
      record.record_styles.forEach((styleId) =>
        artistCountriesYearsGenresStylesMap[artistId].styles.add(styleId)
      );
    });

    // Labels
    record.record_labels.forEach((labelId) => {
      if (!labelCountriesYearsGenresStylesMap[labelId]) {
        labelCountriesYearsGenresStylesMap[labelId] = {
          countries: new Set(),
          years: new Set(),
          genres: new Set(),
          styles: new Set(),
        };
      }
      record.countries.forEach((countryId) =>
        labelCountriesYearsGenresStylesMap[labelId].countries.add(countryId)
      );
      if (record.record_year) {
        labelCountriesYearsGenresStylesMap[labelId].years.add(
          record.record_year
        );
      }
      record.record_genres.forEach((genreId) =>
        labelCountriesYearsGenresStylesMap[labelId].genres.add(genreId)
      );
      record.record_styles.forEach((styleId) =>
        labelCountriesYearsGenresStylesMap[labelId].styles.add(styleId)
      );
    });
  });

  // Now we have a map of artists and labels to their associated countries and years
  // Next, we use this map to update our artists and labels

  console.log("Step 7: Update Artists and Labels with relations");

  await batchUpdateRelations(
    prisma.artist,
    Object.values(artistData).map((item) => {
      // Retrieve the combined relations for the artist
      const artistRelations = artistCountriesYearsGenresStylesMap[
        item.artist_id
      ] || {
        countries: new Set(),
        years: new Set(),
        genres: new Set(),
        styles: new Set(),
      };

      return {
        id: item.artist_id,
        data: {
          // groups: { connect: (item.artist_groups || []).map((id) => ({ id })) },
          // members: {
          //   connect: (item.artist_members || []).map((id) => ({ id })),
          // },
          // aliases: {
          //   connectOrCreate: (item.artist_aliases || []).map((alias) => ({
          //     where: { id: alias },
          //     create: { id: alias },
          //   })),
          // },
          countries: {
            connect: Array.from(artistRelations.countries).map((id) => ({
              id,
            })),
          },
          year: {
            connect: Array.from(artistRelations.years).map((year) => ({
              id: parseInt(year, 10),
            })),
          },
          genres: {
            connect: Array.from(artistRelations.genres).map((id) => ({ id })),
          },
          styles: {
            connect: Array.from(artistRelations.styles).map((id) => ({ id })),
          },
        },
      };
    }),
    "id"
  );

  await batchUpdateRelations(
    prisma.label,
    Object.values(labelData).map((item) => {
      // Retrieve the combined relations for the label
      const labelRelations = labelCountriesYearsGenresStylesMap[
        item.label_id
      ] || {
        countries: new Set(),
        years: new Set(),
        genres: new Set(),
        styles: new Set(),
      };

      return {
        id: item.label_id,
        data: {
          // parentLabels: {
          //   connect: (item.label_parent_labels || []).map((id) => ({ id })),
          // },
          // subLabels: {
          //   connect: (item.label_sub_labels || []).map((id) => ({ id })),
          // },
          countries: {
            connect: Array.from(labelRelations.countries).map((id) => ({ id })),
          },
          year: {
            connect: Array.from(labelRelations.years).map((year) => ({
              id: parseInt(year, 10),
            })),
          },
          genres: {
            connect: Array.from(labelRelations.genres).map((id) => ({ id })),
          },
          styles: {
            connect: Array.from(labelRelations.styles).map((id) => ({ id })),
          },
        },
      };
    }),
    "id"
  );

  console.log("Data import complete.");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
