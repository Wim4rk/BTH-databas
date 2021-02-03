/**
 * Main method for searching teachers.
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

// Read from commandline
const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

/**
 * Main function.
 * @async
 * @returns void
 */
(async function () {
    const db = await mysql.createConnection(config);
    let res;

    // Ask question and handle answer in async arrow funciton
    console.info("Search range.");
    rl.question("Search, min: ", async(min) => {
        rl.question("Search, max: ", async(max) => {
            // Run query:
            res = await searchBetween(db, min, max);

            //Print result
            let str = pt.table(res);

            console.info(str);

            //Clean up
            rl.close();
            db.end();
        });
    });
})();

/**
 * Get a report with teacher details, formatted as a table
 *
 * @async
 * @param {connection} db Database connection.
 * @param {int} min Search criteria
 * @param {int} max Search criteria
 * @returns {array} SQL result
 */

/**
 * Output resultset as formatted table with details on a teacher.
 *
 * @async
 * @param {connection} db     Database connection.
 * @param {string}     search String to search for.
 *
 * @returns {array} SQL result.
 */
async function searchBetween(db, min, max)
{
    let sql;
    let res;

    console.info(`Searching between: ${min} - ${max}.`);

    sql = `
        SELECT
            akronym,
            CONCAT(fornamn, " ", efternamn) AS namn,
            avdelning,
            lon,
            kompetens,
            DATE_FORMAT(fodd, "%Y-%m-%d") AS fodd
        FROM larare
        WHERE lon BETWEEN ${min} AND ${max}
        OR kompetens BETWEEN ${min} AND ${max}
        ORDER BY lon;
    `;
    res = await db.query(sql);

    return res;
}
