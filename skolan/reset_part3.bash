echo ">>> Reset skolan to after part 3"

# shellcheck disable=SC2162
read -r -sp ">>> Root password: " passvar

mysql -uroot -p"$passvar" skolan < setup.sql > /dev/null

file="setup.sql"
printf "\n>>> Create database, set user (%s)\n" $file
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="ddl_all.sql"
printf "\n>>> Create tables (%s)\n" $file
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="insert.sql"
printf "\n>>> Insert data (%s)\n" $file
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="dml_update_lonerevision.sql"
printf "\n>>> Perform salary revision (%s)\n" $file
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="dml_insert_csv.sql"
printf "\n>>> Get data from CSV (%s)\n" $file
mysql -uroot -p"$passvar" skolan < $file > /dev/null

file="dml_join2.sql"
printf "\n>>> Create planning view (%s)\n" $file
mysql -uroot -p"$passvar" skolan < $file > /dev/null
