/*
 * A collection of useful functions
 *
 * @author Olov Wimark
 *
 */

"use strict"

let utils = require("./stringRange1.js");
let res;

res = utils.stringRange(1, 10);
console.info(res);

res = utils.stringRange(1, 10, "-");
console.info(res);

console.log("\nWhat does the imported 'utils' consist of?");
console.log(utils);
