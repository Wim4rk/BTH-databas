/**
 * Route for bank.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const bank    = require("../src/bank.js");

router.get("/", (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("bank/index", data);
});

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("bank/index", data);
});

router.get("/balance", async (req, res) => {
    let data = {
        title: "Balance | The Bank"
    };

    data.res = await bank.showBalance();

    res.render("bank/balance", data);
});

router.get("/move-to-adam", async (req, res) => {
    let data = {
        title: "Transactions | The Bank",
        amount: 1.5,
        from: "Eva",
        to: "Adam",
    };

    data.res = await bank.makeTransaction(1.5, "2222", "1111");

    res.render("bank/move", data);
});

router.get("/test", (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("index", data);
});

module.exports = router;
