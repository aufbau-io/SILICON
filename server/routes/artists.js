const artistRoutes = (app, fs) => {
  // variables
  const dataPath = "./data/artists.json";

  // READ
  app.get("/artists", (req, res) => {
    fs.readFile(dataPath, "utf8", (err, data) => {
      if (err) {
        throw err;
      }

      res.send(JSON.parse(data));
    });
  });
};

module.exports = artistRoutes;
