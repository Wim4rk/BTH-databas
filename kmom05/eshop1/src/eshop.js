/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    categories: getCategories,
    product: getOneProduct,
    products: getProducts,
    newProduct: createProduct
};

const mysql = require("promise-mysql");
const config = require("../config/db/eshop.json");
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

async function getCategories() {
    let sql = `CALL get_categories();`;
    let res;

    res = await db.query(sql);

    // console.info (`SQL: ${sql} got ${res[0].length} rows`);
    // console.info (res);

    return res[0];
}


async function getProducts() {
    let sql = `CALL get_products();`;
    let res;

    res = await db.query(sql);

    console.info (`SQL: ${sql} got ${res[0].length} rows`);
    console.info (res);

    return res[0];
}


async function getOneProduct(a_id) {
    let sql = `CALL get_product(?);`;
    let res;

    res = await db.query(sql, [a_id]);

    console.info (`SQL: ${sql} got ${res[0].length} rows`);
    console.info (res);

    return res[0];
}


async function createProduct(namn, beskrivning, pris, antal) {
    let sql = `CALL create_product(?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [namn, beskrivning, pris, antal]);
    // console.log(res);
    // console.info(`SQL: ${sql} got ${res.length} rows.`);
}
