import { PrismaClient } from "@prisma/client";
import fs from "fs";
import path from "path";

const prisma = new PrismaClient();

async function main() {

const artistData = JSON.parse(fs.readFileSync(path.join(__dirname, "json/filtered_artists.json"), "utf-8"));
  for (const key in artistData) {
    const item = artistData[key];
    await prisma.artist.create({
      data: {
        id: item.artist_id,
        groups: (item.artist_groups == null) ? [] : item.artist_id,
        profile: item.artist_profile,
        members: (item.artist_members == null) ? [] : item.artist_members,
        name: item.artist_name,
        sites: (item.artist_sites == null) ? [] : item.artist_sites,
        realName: item.artist_real_name,
        aliases: (item.artist_aliases == null) ? [] : item.artist_aliases,
      },
    });
  }

const labelData = JSON.parse(fs.readFileSync(path.join(__dirname, "json/filtered_labels.json"), "utf-8"));
  for (const key in labelData) {
    const item = labelData[key];
    await prisma.label.create({
      data: {
        id: item.label_id,
        name: item.label_name,
        parentLabel: (item.label_parent_label == null) ? [] : item.label_parent_label,
        subLabels: (item.label_sub_labels == null) ? [] : item.label_sub_labels,
        sites: (item.label_sites == null) ? [] : item.label_sites,
        profile: item.label_profile
      },
    });
  }

	const styles = JSON.parse(fs.readFileSync(path.join(__dirname, "json/filtered_styles.json"), "utf-8"));
	for (const style of styles) {
		await prisma.style.create({
			data: { id: style },
		});
	}


  const recordData = JSON.parse(fs.readFileSync(path.join(__dirname, "json/filtered_records.json"), "utf-8"));
  for (const key in recordData) {
    const item = recordData[key];
    // In this case you need to manually connect existing Artists, Labels, and Styles to each record
    // Note: This assumes that corresponding Artists, Labels, and Styles already exist in the database
    await prisma.record.create({
      data: {
        id: item.record_id,
        rating: item.record_rating,
        name: item.record_name,
        year: item.record_year,
        youtubeIds: (item.record_youtube_ids == null) ? [] : item.record_youtube_ids,
        countries: (item.countries == null) ? [] : item.countries,
        genres: (item.record_genres == null) ? [] : item.record_genres,
        artists: {
          connect: item.record_artists.map((artistId: string) => ({ id: artistId }))
        },
        labels: {
          connect: item.record_labels.map((labelId: string) => ({ id: labelId }))
        },
        styles: {
          connect: item.record_styles.map((styleId: string) => ({ id: styleId }))
        }
      },
    });
  }
}


main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
