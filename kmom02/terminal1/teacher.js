/**
 * Main method for displaying teachers.
 *
 * @author "Olov Wimark"
 *
 * To be run separately (main).
 *
 */

"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");
const pt = require("./print_table.js");

/**
 * Main function.
 * @async
 * @returns void
 */
(async function () {
    const db = await mysql.createConnection(config);
    let sql;
    let res;

    sql = `
        SELECT
            akronym,
            CONCAT(fornamn, " ", efternamn) AS namn,
            avdelning,
            lon,
            kompetens,
            DATE_FORMAT(fodd, "%Y-%m-%d") AS fodd
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);

    // data = JSON.stringify(res, null, 4);
    console.info(pt);

    let str = pt.table(res);

    // console.info(data);
    console.info(str);

    db.end();
})();
