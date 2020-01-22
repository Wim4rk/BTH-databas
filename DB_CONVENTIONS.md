# Conventions

Let's save MySQL code in files following these conventions.

First of all: when establishing a database, commands must run in a certain
order. Tables need to be in place before you can link them, and so fort.
Therefore: __number the files__ according to the order in wich they should
be run.

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

IF-statements can be used to diferentiate between MySQL and MariaDB, because
some commands differ.
