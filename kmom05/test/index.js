/* index.js */
"use strict";

const port = process.env.DBWEBB_PORT || 1338;
const path = require("path");
const express = require("express");
const app = express();

const middleware = require("./middleware/index.js");

app.set("view engine", "ejs");

app.use(middleware.logIncomingToConsole);

app.use(express.static(path.join(__dirname, "public")));
app.get("/", function (req, res) {
    res.render("index");
});

app.listen(port);
