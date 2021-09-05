/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    categories: getCategories,
    product: getOneProduct,
    products: getProducts,
    newProduct: createProduct,
    updateProduct: updateProduct,
    deleteProduct: deleteProduct,
    showLog: showLog,
    showShelves: showShelves,
    showInventory: showInventory,
    addInventory: addInventory,
    delInventory: delInventory
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

    // console.info (`SQL: ${sql} got ${res[0].length} rows`);
    // console.info (res);

    return res[0];
}


async function getOneProduct(vid) {
    let sql = `CALL get_product(?);`;
    let res;

    res = await db.query(sql, [vid]);

    console.info (`SQL: ${sql} got ${res[0].length} rows`);
    console.info (res[0]);

    return res[0];
}


async function createProduct(namn, beskrivning, pris, antal) {
    let sql = `CALL create_product(?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [namn, beskrivning, pris, antal]);
    console.log(res);
    // console.info(`SQL: ${sql} got ${res.length} rows.`);
    return res;
}

async function updateProduct(id, namn, beskrivning, pris, antal) {
    let sql = `CALL update_product(?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, namn, beskrivning, pris, antal]);
    return res;
}

async function deleteProduct(id) {
    let sql = `CALL delete_product(?);`;
    let res = await db.query(sql, [id]);

    return res;
}

async function showLog(rows) {
    // Check data type for rows (== integer)
    let sql = `CALL show_log(?)`;
    let res = await db.query(sql, [rows]);

    return res;
}

async function showShelves() {
    let sql = `CALL show_shelves()`;
    let res = await db.query(sql);

    return res;
}

async function showInventory(s_term) {
    s_term = s_term || false;

    let sql;
    let res;

    if (s_term) {
        sql = `CALL inventory_search(?)`;
        res = await db.query(sql, [s_term]);
    } else {
        sql = `CALL inventory()`;
        res = await db.query(sql);
    }

    return res;
}

async function addInventory(prod, shelf, num) {
    let sql = `CALL add_inventory(?,?,?)`;
    let res = await db.query(sql, [prod, shelf, num]);

    return res;
}

async function delInventory(prod, shelf, num) {
    let sql = `CALL del_inventory(?,?,?)`;
    let res = await db.query(sql, [prod, shelf, num]);

    return res;
}
