// const { PrismaClient } = require("@prisma/client");
// const prisma = new PrismaClient();

async function batchCreate(Model, data, batchSize = 100000) {
  for (let i = 0; i < data.length; i += batchSize) {
    const batch = data.slice(i, i + batchSize);
    const createManyData = batch.map((item) => ({ ...item }));
    await Model.createMany({ data: createManyData });
  }
}

// async function batchUpdateRelations(Model, records, updateKey, batchSize = 75) {
//   for (let i = 0; i < records.length; i += batchSize) {
//     const batch = records.slice(i, i + batchSize);
//     const updatePromises = batch.map(async (record) => {
//       if (!record.hasOwnProperty(updateKey)) {
//         throw new Error(
//           `Update key ${updateKey} not found in record: ${JSON.stringify(
//             record
//           )}`
//         );
//       }

//       await Model.update({
//         where: { [updateKey]: record[updateKey] },
//         data: record.data,
//       });
//     });

//     await Promise.all(updatePromises);
//   }
// }

async function batchUpdateRelations(Model, updates, updateKey, batchSize = 75) {
  for (let i = 0; i < updates.length; i += batchSize) {
    const batch = updates.slice(i, i + batchSize);
    const updatePromises = batch.map(async (update) => {
      if (!update.hasOwnProperty(updateKey)) {
        console.error(`Update key ${updateKey} not found in update:`, update);
        return;
      }

      try {
        await Model.update({
          where: { [updateKey]: update[updateKey] },
          data: update.data,
        });
      } catch (error) {
        console.error(
          `Error updating record with ${updateKey} ${update[updateKey]}:`,
          error
        );
      }
    });

    await Promise.all(updatePromises);
  }
}

module.exports = {
  batchCreate,
  batchUpdateRelations,
};
