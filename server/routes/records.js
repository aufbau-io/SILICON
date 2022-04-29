const recordRoutes = (app, fs) => {
  // variables
  const dataPath = "./data/records.json";

  // READ
  app.get("/records", (req, res) => {
    fs.readFile(dataPath, "utf8", (err, data) => {
      if (err) {
        throw err;
      }

      res.send(JSON.parse(data));
    });
  });
};

module.exports = recordRoutes;
