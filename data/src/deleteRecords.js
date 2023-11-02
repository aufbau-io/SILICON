const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function deleteAllRecords() {
  try {
    await prisma.record.deleteMany({});
    console.log("All records have been deleted.");
  } catch (error) {
    console.error("Error deleting records:", error);
  } finally {
    await prisma.$disconnect();
  }
}

deleteAllRecords();
