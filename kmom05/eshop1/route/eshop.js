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

router.get("/update/:id", async (req, res) => {
    console.log(JSON.stringify(req.body, null, 4));
    let vid = req.params.id;
    let data = {
        title: "Redigera"
    };

    data.produkt = await eshop.product(vid);
    console.log("Data - produkt ", data.produkt);

    res.render("eshop/product-edit", data);
});


router.post("/update", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    let vid = req.body.f_id;

    await eshop.updateProduct(
        vid,
        req.body.namn,
        req.body.beskrivning,
        req.body.pris,
        req.body.stock
    );
    res.redirect(`/product`);
});


router.get("/delete/:id", async (req, res) => {
    console.log(JSON.stringify(req.body, null, 4));
    let vid = req.params.id;
    let data = {
        title: "Radera"
    };

    data.produkt = await eshop.product(vid);

    res.render("eshop/product-delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    let vId = req.body.f_id;

    console.log(req.body);
    await eshop.deleteProduct(vId);

    res.redirect('/product');
});
