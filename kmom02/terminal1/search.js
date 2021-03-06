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
(async function() {
    const db = await mysql.createConnection(config);
    let res;

    // Ask question and handle answer in async arrow funciton
    console.info("You can't search birthdates.");
    rl.question("Search: ", async (search) => {
        // Run query:
        res = await searchTeachers(db, search);

        //Print result
        let str = pt.table(res);

        console.info(str);

        //Clean up
        rl.close();
        db.end();
    });
})();

/**
 * Get a report with teacher details, formatted as a table
 *
 * @async
 * @param {connection} db Database connection.
 * @returns {string} Formatted table to print out.
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
async function searchTeachers(db, search) {
    let sql;
    let res;
    let like = `%${search}%`;

    console.info(`Searching for: ${search}`);

    sql = `
        SELECT
            akronym,
            CONCAT(fornamn, " ", efternamn) AS namn,
            avdelning,
            lon,
            kompetens,
            DATE_FORMAT(fodd, "%Y-%m-%d") AS fodd
        FROM larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR lon = ?
        ORDER BY akronym;
    `;
    res = await db.query(sql, [like, like, like, like, search]);

    return res;
}
