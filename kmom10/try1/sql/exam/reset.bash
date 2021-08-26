echo ">>> Reset kennelklubben"

# shellcheck disable=SC2162
read -r -sp ">>> Root password: " passvar

mysql -uroot -p"$passvar" < setup.sql > /dev/null

file="setup.sql"
printf "\n>>> Create database, set user (%s)\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null

file="ddl.sql"
printf "\n>>> Create tables (%s)\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null

file="dml_insert.sql"
printf "\n>>> Insert data (%s)\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null

file="dml_view.sql"
printf "\n>>> Create view (%s)\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null

file="dml_procedure.sql"
printf "\n>>> Create procedure (%s)\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null
