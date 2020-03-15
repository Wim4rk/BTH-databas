"use strict";

const config = require("./config.json");
const mysql = require("promise-mysql");


let teachers = {
    larare: async function() {
        const db = await mysql.createConnection(config);

        let sql = `
        SELECT
            akronym,
            CONCAT(fornamn, " ", efternamn) AS namn,
            avdelning,
            lon AS lön,
            kompetens,
            Ålder
        FROM v_larare;
        `;

        let res = await db.query(sql);

        console.info(teachersAsTable(res));

        db.end();
    },
    sok: async function searchTeachers(search) {
        const db = await mysql.createConnection(config);
        let sql;
        let res;
        let like = `%${search}%`;

        // console.info(`Searching for: ${search}`);

        sql = `
            SELECT
                akronym,
                CONCAT(fornamn, " ", efternamn) AS namn,
                avdelning,
                lon AS lön,
                kompetens,
                DATE_FORMAT(fodd, "%Y-%m-%d") AS född
            FROM larare
            WHERE
                akronym LIKE ?
                OR fornamn LIKE ?
                OR efternamn LIKE ?
                OR avdelning LIKE ?
                OR lon = ?
            ORDER BY akronym;
        `;
        res = await db.query(sql, [like, like, like, like, search]);

        console.info(teachersAsTable(res));

        db.end();
    },
    kompetens: async function teacherCompetense() {
        const db = await mysql.createConnection(config);

        let sql = `
        SELECT
            akronym,
            namn,
            prekomp AS tidigare,
            nukomp AS nuvarande,
            diffkomp AS differens
        FROM v_lonerevision;
        `;

        let res = await db.query(sql);

        console.info(teachersAsTable(res));

        db.end();
    },
    lon: async function teacherSalary() {
        const db = await mysql.createConnection(config);

        let sql = `
        SELECT
            akronym,
            namn,
            pre AS tidigare,
            nu AS nuvarande,
            diff AS differens,
            proc AS utveckling
        FROM v_lonerevision
        ORDER BY proc DESC;
        `;

        let res = await db.query(sql);

        console.info(teachersAsTable(res));

        db.end();
    },
    salary: async function newSalary(akronym, nylon) {
        const db = await mysql.createConnection(config);

        let sql = `
        UPDATE
            larare
        SET
            lon = ${nylon}
        WHERE akronym = '${akronym}';
        `;

        await db.query(sql);

        console.info(teachersAsTable(this.sok(akronym)));

        db.end();
    }


    // larare: async function() {
    //
    //     let res = await db.query(sql);
    //     console.info(teachersAsTable(res));
    //
    //     db.end();
    // },
    // sok: function(search) {
    //     // console.log(search);
    // }
};

function teachersAsTable(res) {
    return console.table(res);
}

module.exports = teachers;
