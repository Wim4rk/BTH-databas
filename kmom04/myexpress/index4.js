"use strict";

const port = process.env.DBWEBB_PORT || 1337;
const express = require("express");
const app = express();
const indexRoutes = require("./routes/index.js");
const path = require("path");
const middleware = require("./middleware/index.js");
const routeToday = require("./routes/today.js");

app.set("view engine", "ejs");

app.use(middleware.incoming);

app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRoutes);

app.use("/today", routeToday);

app.listen(port, startupStats);


/**
 * Log app details to console when starting up.
 *
 * @return {void}
 */
function startupStats() {
    let routes = [];

    // Find what routes are supported
    app._router.stack.forEach((middleware) => {
        if (middleware.route) {
            // Routes registered directly on the app
            routes.push(middleware.route);
        } else if (middleware.name === "router") {
            // Routes added as router middleware
            middleware.handle.stack.forEach((handler) => {
                let route;

                route = handler.route;
                route && routes.push(route);
            });
        }
    });

    console.info(`Listening at port ${port}.`);
    console.info("Available routes:");
    console.info(routes);
}
