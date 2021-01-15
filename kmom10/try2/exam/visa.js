/**
 * General routes.
 */
"use strict";

const express = require("express");
const router  = express.Router();

// Add a route for the path /visa
router.get("/", (req, res) => {
    let data = {
        title: "Välkommen | Utdrag"
    };

    res.render("vapen/visa", data);
});

module.exports = router;
