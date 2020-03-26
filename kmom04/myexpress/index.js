"use strict";

const port = process.env.DBWEBB_PORT || 1337;
const express = require("express");
const app = express();
const indexRoutes = require("./routes/index.js");
const path = require("path");

app.set("view engine", "ejs");

app.use(express.static(path.join(__dirname, "public")));

app.use((req, res, next) => {
    console.info(`Request: ${req.path} (${req.method})`);
    next();
});

app.use("/", indexRoutes);

app.listen(port, () => {
    console.log("Server listening on: " + port);

    // Show which routes are supported
    console.info("Available routes are:");
    app._router.stack.forEach((r) => {
        if (r.route && r.route.path) {
            console.info(r.route.path);
        }
    });
});
