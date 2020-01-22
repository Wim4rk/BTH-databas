# Conventions

Let's save MySQL code in files following these conventions.

Whenever you're working against a database, save commands to a file with the
ending __.sql__. That makes it easier to repeat commands and to quickly
recreate structure and contents of the database.

__setup.sql__ contains commands that create the structure of the database,
creates users and the database itself.

__ddl.sql__ DDL means Data Definition Language. Mostly `CREATE`, `ALTER` and
`DROP`. Handles the tables.

__dml.sql__ DML is Data Manipulation Language and is used to fill the database
structure with content, search the databse and create reports. Common examples:
`SELECT`, `INSERT`, `UPDATE` and `DELETE`.

Comment often. Comments start with two dashes: `--`.
