/**
 * Output resultset as formatted table based on query result.
 *
 * @author "Olov Wimark"
 *
 * @param {Array} res Resultset with details on from database query.
 *
 * @returns {string} Formatted table to print out.
 */

"use strict";

module.exports = {
    "table":printTable
};

function printTable(res) {

    //console.info(res);
    let str = "";

    str += "-----------------------------------------------------------\n";
    str += "Akronym  Namn                Avd     Lön   Komp  Född \n";
    str += "-----------------------------------------------------------\n";

        // Loop through each row the resultset
    for (const row of res) {
        // console.info(row);

        str += row.akronym.padEnd(9);
        str += row.namn.padEnd(20);
        str += row.avdelning.padEnd(5);
        str += row.lon.toString().padStart(8);
        str += row.kompetens.toString().padStart(5);
        str += row.fodd.toString().padStart(12);
        str += "\n";
    }

    str += "-----------------------------------------------------------\n";

    return str;
}
