"use strict";

const port = 1337
const express = require("express");
const app = express();
const indexRoutes = require("./routes/index.js");
const path = require("path");

app.use(express.static(path.join(__dirname, "public")));

app.use((req, res, next) => {
    console.info(`Request: ${req.path} (${req.method})`);
    next();
});

app.use("/", indexRoutes);

app.listen(port, () => {
    console.log("Server listening on: " + port);
});
