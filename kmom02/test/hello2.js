/**
 * A sample of main function stating the famous "Hello World'
 *
 * @author Olov Wimark
 *
 * @returns void
 */

"use strict";

function main() {
    let a = 1;
    let b;
    let range = "";

    var date = new Date();

    console.log(date);
    
    b = a + 1;

    for (let i = 0; i < 9; i++) {
        range += i + ", ";
    }

    console.info("Hello World");
    console.info(range.substring(0, range.length - 2));
    console.info(a, b);
}

main();
