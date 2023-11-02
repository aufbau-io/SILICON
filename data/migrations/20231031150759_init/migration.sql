/*
  Warnings:

  - You are about to drop the column `artist_aliases` on the `Artist` table. All the data in the column will be lost.
  - You are about to drop the column `artist_groups` on the `Artist` table. All the data in the column will be lost.
  - You are about to drop the column `artist_members` on the `Artist` table. All the data in the column will be lost.
  - You are about to drop the column `label_parent_label` on the `Label` table. All the data in the column will be lost.
  - You are about to drop the column `label_sub_labels` on the `Label` table. All the data in the column will be lost.
  - You are about to drop the column `countries` on the `Record` table. All the data in the column will be lost.
  - You are about to drop the column `record_genres` on the `Record` table. All the data in the column will be lost.
  - You are about to drop the column `record_year` on the `Record` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Artist" DROP COLUMN "artist_aliases",
DROP COLUMN "artist_groups",
DROP COLUMN "artist_members",
ADD COLUMN     "artistId" TEXT;

-- AlterTable
ALTER TABLE "Label" DROP COLUMN "label_parent_label",
DROP COLUMN "label_sub_labels",
ADD COLUMN     "parent_label_id" TEXT;

-- AlterTable
ALTER TABLE "Record" DROP COLUMN "countries",
DROP COLUMN "record_genres",
DROP COLUMN "record_year";

-- CreateTable
CREATE TABLE "Genre" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Year" (
    "id" INTEGER NOT NULL,

    CONSTRAINT "Year_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_GroupMembers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Alias" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtistToYear" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtistToGenre" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtistToStyle" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtistToCountry" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_LabelToYear" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LabelToStyle" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_RecordToYear" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GenreToRecord" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GenreToLabel" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CountryToRecord" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CountryToLabel" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_GroupMembers_AB_unique" ON "_GroupMembers"("A", "B");

-- CreateIndex
CREATE INDEX "_GroupMembers_B_index" ON "_GroupMembers"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Alias_AB_unique" ON "_Alias"("A", "B");

-- CreateIndex
CREATE INDEX "_Alias_B_index" ON "_Alias"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistToYear_AB_unique" ON "_ArtistToYear"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistToYear_B_index" ON "_ArtistToYear"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistToGenre_AB_unique" ON "_ArtistToGenre"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistToGenre_B_index" ON "_ArtistToGenre"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistToStyle_AB_unique" ON "_ArtistToStyle"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistToStyle_B_index" ON "_ArtistToStyle"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistToCountry_AB_unique" ON "_ArtistToCountry"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistToCountry_B_index" ON "_ArtistToCountry"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LabelToYear_AB_unique" ON "_LabelToYear"("A", "B");

-- CreateIndex
CREATE INDEX "_LabelToYear_B_index" ON "_LabelToYear"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LabelToStyle_AB_unique" ON "_LabelToStyle"("A", "B");

-- CreateIndex
CREATE INDEX "_LabelToStyle_B_index" ON "_LabelToStyle"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_RecordToYear_AB_unique" ON "_RecordToYear"("A", "B");

-- CreateIndex
CREATE INDEX "_RecordToYear_B_index" ON "_RecordToYear"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GenreToRecord_AB_unique" ON "_GenreToRecord"("A", "B");

-- CreateIndex
CREATE INDEX "_GenreToRecord_B_index" ON "_GenreToRecord"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GenreToLabel_AB_unique" ON "_GenreToLabel"("A", "B");

-- CreateIndex
CREATE INDEX "_GenreToLabel_B_index" ON "_GenreToLabel"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CountryToRecord_AB_unique" ON "_CountryToRecord"("A", "B");

-- CreateIndex
CREATE INDEX "_CountryToRecord_B_index" ON "_CountryToRecord"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CountryToLabel_AB_unique" ON "_CountryToLabel"("A", "B");

-- CreateIndex
CREATE INDEX "_CountryToLabel_B_index" ON "_CountryToLabel"("B");

-- AddForeignKey
ALTER TABLE "Label" ADD CONSTRAINT "Label_parent_label_id_fkey" FOREIGN KEY ("parent_label_id") REFERENCES "Label"("label_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupMembers" ADD CONSTRAINT "_GroupMembers_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GroupMembers" ADD CONSTRAINT "_GroupMembers_B_fkey" FOREIGN KEY ("B") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Alias" ADD CONSTRAINT "_Alias_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Alias" ADD CONSTRAINT "_Alias_B_fkey" FOREIGN KEY ("B") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToYear" ADD CONSTRAINT "_ArtistToYear_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToYear" ADD CONSTRAINT "_ArtistToYear_B_fkey" FOREIGN KEY ("B") REFERENCES "Year"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToGenre" ADD CONSTRAINT "_ArtistToGenre_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToGenre" ADD CONSTRAINT "_ArtistToGenre_B_fkey" FOREIGN KEY ("B") REFERENCES "Genre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToStyle" ADD CONSTRAINT "_ArtistToStyle_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToStyle" ADD CONSTRAINT "_ArtistToStyle_B_fkey" FOREIGN KEY ("B") REFERENCES "Style"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToCountry" ADD CONSTRAINT "_ArtistToCountry_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToCountry" ADD CONSTRAINT "_ArtistToCountry_B_fkey" FOREIGN KEY ("B") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LabelToYear" ADD CONSTRAINT "_LabelToYear_A_fkey" FOREIGN KEY ("A") REFERENCES "Label"("label_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LabelToYear" ADD CONSTRAINT "_LabelToYear_B_fkey" FOREIGN KEY ("B") REFERENCES "Year"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LabelToStyle" ADD CONSTRAINT "_LabelToStyle_A_fkey" FOREIGN KEY ("A") REFERENCES "Label"("label_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LabelToStyle" ADD CONSTRAINT "_LabelToStyle_B_fkey" FOREIGN KEY ("B") REFERENCES "Style"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RecordToYear" ADD CONSTRAINT "_RecordToYear_A_fkey" FOREIGN KEY ("A") REFERENCES "Record"("record_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RecordToYear" ADD CONSTRAINT "_RecordToYear_B_fkey" FOREIGN KEY ("B") REFERENCES "Year"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenreToRecord" ADD CONSTRAINT "_GenreToRecord_A_fkey" FOREIGN KEY ("A") REFERENCES "Genre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenreToRecord" ADD CONSTRAINT "_GenreToRecord_B_fkey" FOREIGN KEY ("B") REFERENCES "Record"("record_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenreToLabel" ADD CONSTRAINT "_GenreToLabel_A_fkey" FOREIGN KEY ("A") REFERENCES "Genre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GenreToLabel" ADD CONSTRAINT "_GenreToLabel_B_fkey" FOREIGN KEY ("B") REFERENCES "Label"("label_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToRecord" ADD CONSTRAINT "_CountryToRecord_A_fkey" FOREIGN KEY ("A") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToRecord" ADD CONSTRAINT "_CountryToRecord_B_fkey" FOREIGN KEY ("B") REFERENCES "Record"("record_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToLabel" ADD CONSTRAINT "_CountryToLabel_A_fkey" FOREIGN KEY ("A") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToLabel" ADD CONSTRAINT "_CountryToLabel_B_fkey" FOREIGN KEY ("B") REFERENCES "Label"("label_id") ON DELETE CASCADE ON UPDATE CASCADE;
