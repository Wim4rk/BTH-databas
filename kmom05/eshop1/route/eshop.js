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


router.get("/category", async (req, res) => {
    let data = {
        title: `Kategorier ${sitename}`
    };

    data.kategorier = await eshop.categories();

    res.render("eshop/category", data);
});


router.get("/product", async (req, res) => {
    let data = {
        title: `Produkter ${sitename}`
    };

    data.produkter = await eshop.products();

    res.render("eshop/product", data);
});
