/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showDogs: showDogs
};

const mysql = require("promise-mysql");
const config = require("../config/db/exam.json");
let db;


/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

async function showDogs() {
    let sql = `CALL the_dogs();`;
    let res;

    res = await db.query(sql);

    console.info (`SQL: ${sql} got ${res[0].length} rows`);

    return res;
}
