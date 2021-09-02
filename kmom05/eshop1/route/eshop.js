/**
 * Routes for kennel.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const eshop       = require("../src/eshop.js");
const sitename    = "| Endgame keyboard";

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
    console.log("Lambs amongst the lions");
    let data = {
        title: `Produkter ${sitename}`
    };

    data.produkter = await eshop.products();

    console.log(data);

    res.render("eshop/product", data);
});


router.get("/product/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Prod ${id} ${sitename}`,
    };

    data.produkter = await eshop.product(id);

    res.render("eshop/product", data);
});


router.get("/create", (req, res) => {
    let data = {
        title: `Ny produkt ${sitename}`
    };

    res.render("eshop/product-create", data);
});

router.post("/create", urlencodedParser, async (req, res) => {
    console.log(JSON.stringify(req.body, null, 4));
    await eshop.newProduct(
        req.body.namn,
        req.body.beskrivning,
        req.body.pris,
        req.body.stock
    );
    res.redirect(`/product`);
});
