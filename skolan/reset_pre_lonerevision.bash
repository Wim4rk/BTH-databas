#!/usr/bin/env bash
#
# Recreate and reset the database to be as after part I.
#
echo ">>> Reset skolan to after part 1"
echo ">>> Recreate the database (as root)"

# shellcheck disable=SC2162
read -r -sp ">>> Root password: " passvar

mysql -uroot -p"$passvar" skolan < setup.sql > /dev/null

file="ddl.sql"
printf "\n>>> Create tables (%s)\n" $file
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="dml_insert.sql"
echo ">>> Insert into larare ($file)"
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="ddl_migrate.sql"
echo ">>> Alter table larare ($file)"
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="dml_update.sql"
echo ">>> Förbered lönerevision, grundlön larare ($file)"
mysql -uroot -p"$passvar" skolan < $file > /dev/null

echo ">>> Database reset to before salary revision."
