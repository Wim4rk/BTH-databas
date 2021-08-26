"use strict";


// Read from commandline
let readline = require("readline");
let rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const exam = require("./src/exam.js");

let data;

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
            case "home":
            case "1":
                showMenu();
                break;
            case "exit":
            case "quit":
            case "3":
                exitProgram(0);
                break;

            case "show":
            case "2":
                data = await exam.showDogs();
                showOurDogs(data[0]);
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
=====================================================
1 home, help, menu:             This menu
2 show:                         Show dogs
exit, quit:                     Exit program
=====================================================`);
}


function showOurDogs(data) {
    console.table(data, ["husse", "hund", "ras", "godkand"]);
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
