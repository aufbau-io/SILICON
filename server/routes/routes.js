// load up our shiny new route for records
const recordRoutes = require("./records");
const artistRoutes = require("./artists");
const labelRoutes = require("./labels");
const styleRoutes = require("./styles");

const appRouter = (app, fs) => {
  // we've added in a default route here that handles empty routes
  // at the base API url
  app.get("/", (req, res) => {
    res.send("welcome to the development api-server");
  });

  // run our route modules here to complete the wire up
  recordRoutes(app, fs);
  artistRoutes(app, fs);
  labelRoutes(app, fs);
  styleRoutes(app, fs);
};

// this line is unchanged
module.exports = appRouter;
