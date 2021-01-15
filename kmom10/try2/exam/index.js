/**
 * General routes.
 */
"use strict";

const express = require("express");
const router  = express.Router();

// Add a route for the path /
router.get("/", (req, res) => {
    let data = {
        title: "Välkommen | Vapenregistret"
    };

    res.render("vapen/index", data);
});

module.exports = router;
