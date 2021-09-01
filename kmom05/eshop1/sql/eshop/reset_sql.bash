echo ">>> Reset webshop"

# shellcheck disable=SC2162
read -r -sp ">>> Root password: " passvar

mysql -uroot -p"$passvar" webshop < setup.sql > /dev/null

file="setup.sql"
printf "\n>>> Create database, set user (%s)\n" $file
mysql -uroot -p"$passvar" webshop < $file > /dev/null

file="ddl.sql"
printf "\n>>> Setup tables (%s)\n" $file
mysql -uroot -p"$passvar" webshop < $file > /dev/null

file="procedures.sql"
printf "\n>>> Set up procedures (%s)\n" $file
mysql -uroot -p"$passvar" webshop < $file > /dev/null

file="triggers.sql"
printf "\n>>> Create triggers (%s)\n" $file
mysql -uroot -p"$passvar" webshop < $file > /dev/null

file="insert.sql"
printf "\n>>> Insert data from CSV (%s)\n" $file
mysql -uroot -p"$passvar" webshop < $file > /dev/null
