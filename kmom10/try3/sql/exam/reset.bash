echo ">>> Reset KB - Underlättar återställning"

# shellcheck disable=SC2162
read -r -sp ">>> Root password: " passvar

mysql -uroot -p"$passvar" < setup.sql > /dev/null

file="setup.sql"
printf ">>> Create database, set user (%s)\\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null

file="ddl.sql"
printf ">>> Create tables and views (%s)\\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null

file="insert.sql"
printf ">>> Insert data (%s)\\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null
#
file="dml_view.sql"
printf ">>> Create view (%s)\\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null

file="dml_procedure.sql"
printf ">>> Create procedure (%s)\\n" $file
mysql -uroot -p"$passvar" exam < $file > /dev/null
