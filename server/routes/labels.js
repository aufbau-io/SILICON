const labelRoutes = (app, fs) => {
  // variables
  const dataPath = "./data/filtered_labels.json";

  // READ
  app.get("/labels", (req, res) => {
    fs.readFile(dataPath, "utf8", (err, data) => {
      if (err) {
        throw err;
      }

      res.send(JSON.parse(data));
    });
  });
};

module.exports = labelRoutes;
