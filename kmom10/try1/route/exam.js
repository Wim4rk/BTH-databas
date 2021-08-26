/**
 * Routes for kennel.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const exam       = require("../src/exam.js");
const sitename   = "| Kennelklubben";

module.exports = router;

router.get("/", (req, res) => {
    console.log("Inside /index route")
    let data = {
        title: `Welcome ${sitename}`
    };

    res.render("exam/index", data);
});


router.get("/visa", async (req, res) => {
    let data = {
        title: `Våra hundar ${sitename}`,
    };

    data.dogs = await exam.showDogs();

    res.render("exam/visa", data);
});
