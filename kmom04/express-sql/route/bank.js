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

    console.log("So far...");
    res.render("index", data);
});

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("index", data);
});

router.get("/balance", async (req, res) => {
    // http://localhost:1337/bank/balance
    // Should be localhost:1337/balance - wich works.
    let data = {
        title: "Balance | The Bank"
    };

    data.res = await bank.showBalance();

    res.render("balance", data);
});

router.get("/move-to-adam", async (req, res) => {
    let data = {
        title: "Transactions | The Bank",
        amount: 1.5,
        from: "Eva",
        to: "Adam",
    };

    data.res = await bank.makeTransaction(1.5, "2222", "1111");

    res.render("move", data);
});

module.exports = router;
