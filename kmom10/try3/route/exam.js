/**
 * Routes for kennel.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const exam       = require("../src/exam.js");
const sitename   = "| KB";

module.exports = router;

router.get("/", (req, res) => {
    let data = {
        title: `Välkommen ${sitename}`
    };

    res.render("exam/index", data);
});


router.get("/visa", async (req, res) => {
    let data = {
        title: `Exemplar ${sitename}`
    };

    data.books = await exam.showBooks();

    res.render("exam/visa", data);
});
