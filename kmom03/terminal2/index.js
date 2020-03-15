"use strict";


// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const teachers = require("./teachers.js");

(async function() {
    showMenu();

    rl.setPrompt("--> ");
    rl.prompt();

    rl.on("close", process.exit);
    rl.on("line", async (line) => {
        line = line.trim();
        let lineArray = line.split(" ");

        switch (lineArray[0]) {
            case "menu":
            case "help":
                showMenu();
                break;
            case "exit":
            case "quit":
                exitProgram(0);
                break;
            case "larare":
                await teachers.larare();
                break;
            case "sok":
                await teachers.sok(lineArray[1]);
                break;
            case "kompetens":
                await teachers.kompetens();
                break;
            case "lon":
                await teachers.lon();
                break;
            case "nylon":
                await teachers.salary(lineArray[1], lineArray[2]);
                break;
            default:
                showMenu();
                break;
        }

        rl.prompt();
    });
})();

function showMenu() {
    console.info(`
Menu:
=======================================
larare:                   Information om lärare
sok <string>:             Sök efter lärare
kompetens:                Visa lärarnas kompetensutveckling
lon:                      Se lärarnas löneutveckling
nylon <akronym> <lon>:    Ange ny lön för lärare med akronym
menu, help:               Visa den här menyn
exit, quit:               Avsluta programmet
=======================================`);
}


/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
