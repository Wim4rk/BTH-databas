/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showBalance: showBalance,
    makeTransaction: makeTransaction,
    reset: resetKmom04
};

const mysql  = require("promise-mysql");
const config = require("../config/db/bank.json");
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



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showBalance() {
    return findAllInTable("account");
}



/**
 * Show all entries in the selected table.
 *
 * @async
 * @param {string} table A valid table name.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function findAllInTable(table) {
    let sql = `SELECT * FROM ??;`;
    let res;

    res = await db.query(sql, [table]);
    console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

    return res;
}



/**
 * Show all entries in the selected table.
 *
 * @async
 * @param {string} amount A float
 * @param {string} from Sender account
 * @param {string} to Recieving account
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function makeTransaction(amount = 1.5, from = "2222", to = "1111") {
// async function makeTransaction(amount, from, to) {
    db = await mysql.createConnection(config);
    let res;

    let sql = `
    START TRANSACTION;

    UPDATE account
    SET
        balance = balance - ?
    WHERE
        id = ?;

    UPDATE account
    SET
        balance = balance + ?
    WHERE
        id = ?;

    COMMIT;`;

    res = await db.query(sql, [amount, from, amount, to]);
    // res = await db.query(sql, [2, "adam", 2, "eva"]);
    // console.info(`SQL: ${sql} \n(${amount}, ${from}, ${to}) got ${res.length} rows.`);
    console.info (`Moved ${amount} from ${from} to ${to}`);

    return res;
}


/**
 * Resets accounts.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function resetKmom04() {
    db = await mysql.createConnection(config);

    let sql = `UPDATE account
        SET balance = 7.0 WHERE id = "2222";`;

    await db.query(sql);

    sql = `UPDATE account
        SET balance = 10.0 WHERE id = "1111";`;

    await db.query(sql);
}
