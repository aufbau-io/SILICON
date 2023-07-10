-- CreateTable
CREATE TABLE "Artist" (
    "artist_id" TEXT NOT NULL,
    "artist_groups" TEXT[],
    "artist_profile" TEXT,
    "artist_members" TEXT[],
    "artist_name" TEXT,
    "artist_sites" TEXT[],
    "artist_real_name" TEXT,
    "artist_aliases" TEXT[],

    CONSTRAINT "Artist_pkey" PRIMARY KEY ("artist_id")
);

-- CreateTable
CREATE TABLE "Label" (
    "label_id" TEXT NOT NULL,
    "label_name" TEXT,
    "label_parent_label" TEXT[],
    "label_sub_labels" TEXT[],
    "label_sites" TEXT[],
    "label_profile" TEXT,

    CONSTRAINT "Label_pkey" PRIMARY KEY ("label_id")
);

-- CreateTable
CREATE TABLE "Record" (
    "record_id" INTEGER NOT NULL,
    "record_rating" DOUBLE PRECISION,
    "record_name" TEXT,
    "record_year" TEXT,
    "record_youtube_ids" TEXT[],
    "countries" TEXT[],
    "record_genres" TEXT[],

    CONSTRAINT "Record_pkey" PRIMARY KEY ("record_id")
);

-- CreateTable
CREATE TABLE "Style" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Style_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ArtistToRecord" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LabelToRecord" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_RecordToStyle" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistToRecord_AB_unique" ON "_ArtistToRecord"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistToRecord_B_index" ON "_ArtistToRecord"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LabelToRecord_AB_unique" ON "_LabelToRecord"("A", "B");

-- CreateIndex
CREATE INDEX "_LabelToRecord_B_index" ON "_LabelToRecord"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_RecordToStyle_AB_unique" ON "_RecordToStyle"("A", "B");

-- CreateIndex
CREATE INDEX "_RecordToStyle_B_index" ON "_RecordToStyle"("B");

-- AddForeignKey
ALTER TABLE "_ArtistToRecord" ADD CONSTRAINT "_ArtistToRecord_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistToRecord" ADD CONSTRAINT "_ArtistToRecord_B_fkey" FOREIGN KEY ("B") REFERENCES "Record"("record_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LabelToRecord" ADD CONSTRAINT "_LabelToRecord_A_fkey" FOREIGN KEY ("A") REFERENCES "Label"("label_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LabelToRecord" ADD CONSTRAINT "_LabelToRecord_B_fkey" FOREIGN KEY ("B") REFERENCES "Record"("record_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RecordToStyle" ADD CONSTRAINT "_RecordToStyle_A_fkey" FOREIGN KEY ("A") REFERENCES "Record"("record_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RecordToStyle" ADD CONSTRAINT "_RecordToStyle_B_fkey" FOREIGN KEY ("B") REFERENCES "Style"("id") ON DELETE CASCADE ON UPDATE CASCADE;
