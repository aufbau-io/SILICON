/*
  Warnings:

  - You are about to drop the column `parent_label_id` on the `Label` table. All the data in the column will be lost.
  - You are about to drop the `_Alias` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Label" DROP CONSTRAINT "Label_parent_label_id_fkey";

-- DropForeignKey
ALTER TABLE "_Alias" DROP CONSTRAINT "_Alias_A_fkey";

-- DropForeignKey
ALTER TABLE "_Alias" DROP CONSTRAINT "_Alias_B_fkey";

-- AlterTable
ALTER TABLE "Label" DROP COLUMN "parent_label_id";

-- DropTable
DROP TABLE "_Alias";

-- CreateTable
CREATE TABLE "_Aliases" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_SubLabels" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Aliases_AB_unique" ON "_Aliases"("A", "B");

-- CreateIndex
CREATE INDEX "_Aliases_B_index" ON "_Aliases"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_SubLabels_AB_unique" ON "_SubLabels"("A", "B");

-- CreateIndex
CREATE INDEX "_SubLabels_B_index" ON "_SubLabels"("B");

-- AddForeignKey
ALTER TABLE "_Aliases" ADD CONSTRAINT "_Aliases_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Aliases" ADD CONSTRAINT "_Aliases_B_fkey" FOREIGN KEY ("B") REFERENCES "Artist"("artist_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubLabels" ADD CONSTRAINT "_SubLabels_A_fkey" FOREIGN KEY ("A") REFERENCES "Label"("label_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubLabels" ADD CONSTRAINT "_SubLabels_B_fkey" FOREIGN KEY ("B") REFERENCES "Label"("label_id") ON DELETE CASCADE ON UPDATE CASCADE;
