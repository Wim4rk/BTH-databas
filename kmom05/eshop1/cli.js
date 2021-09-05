"use strict";


// Read from commandline
let readline = require("readline");
let rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const eshop = require("./src/eshop.js");

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
                exitProgram(0);
                break;
            case "log":
                await showLog(lineArray[1]);
                break;
            case "3":
            case "shelf":
                await showShelves();
                break;
            case "4":
            case "5":
            case "inventory":
                await showInventory(lineArray[1]);
                break;
            case "6":
            case "invadd":
                await addInventory(lineArray[1], lineArray[2], lineArray[3]);
                break;
            case "7":
            case "invdel":
                await decreaseInventory(lineArray[1], lineArray[2], lineArray[3]);
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
1 help, menu:                       Denna meny
2 log <number>:                     Visa logg, ange antal rader
3 shelf                             Visa hyllor
4 inventory                         Visa lager
5 inventory <str>                   Sök <str> i lagret
6 invadd <prod.> <shelf> <number>   Lägg till produkt i lager
7 invdel <prod.> <shelf> <number>   Ta bort produkt ur lager
exit, quit:                         Avsluta
=====================================================`);
}

/**
 * Show desired lines from log.
 *
 * @param {number} rows Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
 async function showLog(rows) {
     rows = rows || 5;
     data = await eshop.showLog(rows);

     console.log("\n");
     console.table(data[0], ["tidpunkt", "handelse"]);
     // console.table(data[0]);

     return;
 }


/**
 * Show shelves in warehouse
 *
 * @returns {void}
 */
 async function showShelves() {
     data = await eshop.showShelves();

     console.log("\n");
     console.table(data[0], ["lokal", "hylla", "hyllplan"]);

     return;
 }


 async function showInventory(s_term) {
     s_term = s_term || false;
     let data;

     if (s_term) {
         data = await eshop.showInventory(s_term);
     } else {
         data = await eshop.showInventory();
     }

     console.log("\n");
     console.table(data[0], ["id", "namn", "hylla", "antal"]);

     return;
 }


 async function addInventory(prod, shelf, number) {
     // Sanitize data...
     let request = await eshop.addInventory(prod, shelf, number);

     return;
 }


  async function decreaseInventory(prod, shelf, number) {
      // Sanitize data...
      let request = await eshop.delInventory(prod, shelf, number);

      return;
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
