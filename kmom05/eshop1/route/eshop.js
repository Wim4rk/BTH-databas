/**
 * Routes for kennel.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const eshop       = require("../src/eshop.js");
const sitename   = "| Endgame keyboard";

module.exports = router;

router.get("/", (req, res) => {
    let data = {
        title: `Välkommen ${sitename}`
    };

    res.render("eshop/index", data);
});


router.get("/kategorier", async (req, res) => {
    let data = {
        title: `Kategorier ${sitename}`
    };

    data.kategorier = await eshop.categories();

    res.render("eshop/kategorier", data);
});
