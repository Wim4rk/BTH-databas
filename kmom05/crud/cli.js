"use strict";


// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const bank = require("./src/bank.js");

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
                exitProgram(0);
                break;
            case "reset":
                await bank.reset(0);
                console.info("Accounts were reset");
                break;
            case "3":
            case "move":
                //This is going to need some checking...
                if (lineArray[2] != null) {
                    // All values are set
                    await bank.makeTransaction(lineArray[1], lineArray[2], lineArray[3]);
                } else if (lineArray[1] != null) {
                    // Just amount was set
                    await bank.makeTransaction(lineArray[1], "2222", "1111");
                } else {
                    await bank.makeTransaction(1.5, "1111", "2222");
                }
                break;
            case "2":
            case "balance":
                console.table(await bank.showBalance());
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
1 Home, help, menu:             This menu
2 Balance:                      Show account balances
3 Move <amount> <from> <to>:    Make transaction
reset:                          Reset account balances
exit, quit:                     Avsluta programmet
=====================================================`);
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
