const styleRoutes = (app, fs) => {
  // variables
  const dataPath = "./data/styles.json";

  // READ
  app.get("/styles", (req, res) => {
    fs.readFile(dataPath, "utf8", (err, data) => {
      if (err) {
        throw err;
      }

      res.send(JSON.parse(data));
    });
  });
};

module.exports = styleRoutes;
