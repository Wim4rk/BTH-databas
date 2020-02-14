"use strict";

const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
    res.send("Hello");
});

router.get("/about", (req, res) => {
    res.send("Om-filen");
});

module.exports = router;
