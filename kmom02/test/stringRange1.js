/*
 * A collection of useful functions
 *
 * @author Olov Wimark
 *
 */

"use strict"

module.exports = {
    "stringRange": stringRange
};

function stringRange(a, b, sep = ", ") {
    let res = "";
    let i = a;

    while (i < b) {
        res += i + sep;
        i++;
    }

    res = res.substring(0, res.length - sep.length);
    return res;
}
