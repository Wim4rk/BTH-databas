"use strict"

/**
 * Show teachers and their departments.
 */
"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let sql;
    let res;
    let data;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);

    data = JSON.stringify(res, null, 4);

    // let a = "Theese words are of different lengths";
    // let b = a.split(' ');

    var lengths = res.map(function(word){
     return word.length
    })

    console.info(lengths);

    // Output as formatted text in table
let str;

str  = "+-----------+---------------------+-----------+----------+\n";
str += "| Akronym   | Namn                | Avdelning |   Lön    |\n";
str += "|-----------|---------------------|-----------|----------|\n";

    // Loop through each row the resultset
for (const row of res) {
    // console.info(row);

    str += "| ";
    str += row.akronym.padEnd(10);
    str += "| ";
    str += (row.fornamn + " " + row.efternamn).padEnd(20);
    str += "| ";
    str += row.avdelning.padEnd(10);
    str += "| ";
    str += row.lon.toString().padStart(8);
    str += " |\n";
}

str  += "+-----------+---------------------+-----------+----------+\n";

    // console.info(data);
    console.info(str);

    db.end();
})();
