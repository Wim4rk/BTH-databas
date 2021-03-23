/* index.js */
"use strict";

const port = process.env.DBWEBB_PORT || 1338;
const path = require("path");
const express = require("express");
const app = express();

const middleware = require("./middleware/index.js");

app.set("view engine", "ejs");

app.use(function logIncomingToConsole(req, res, next) {
    console.info(`Got request on ${req.path} (${req.method}).`);
    next();
});

app.use(express.static(path.join(__dirname, "public")));
app.get("/", function (req, res) {
    res.render("index");
});

app.listen(port);
