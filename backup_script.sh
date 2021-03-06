
mkdir /home/user/save_BD
vim backup_script.sh

#!/bin/bash
# On liste nos bases de données
LISTEBDD=$( echo 'show databases' | mysql -u backup --password=< mot de passe >)
for BDD in $LISTEBDD do
# Exclusion des BDD information_schema , mysql et Database
if [[ $BDD != "information_schema" ]] && [[ $BDD != "mysql" ]] && [[ $BDD != "Database" ]]; then
# Emplacement du dossier ou nous allons stocker les bases de données, un dossier par base de données
  CHEMIN=/home/user/save_BD/$BDD
# On backup notre base de donnees
  mysqldump -u backup --single-transaction --password= $BDD > "$CHEMIN/$BDD.sql"
  echo "|Sauvegarde de la base de donnees $BDD.sql ";
fi
done
