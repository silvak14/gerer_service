CHEMIN_FICHIER="/home/fichier_user"
FICHIER_FICHIER="fichier.xls"
CHEMIN_SH="/usr/bin/verifie.sh"


#Ne pas modifier
sudo printf "%s\n" "[Unit]" "Description=Inscription automatique des utilisateurs" "[Service]" "ExecStart=${CHEMIN_SH} ${CHEMIN_FICHIER}/${FICHIER_FICHIER}" "Restart=on-failure" "[Install]" "WantedBy=multi-user.target" > /etc/systemd/system/verifie_silva.service

cp check_user.sh ${CHEMIN_SH} 

sudo chmod +x ${CHEMIN_SH}

#mise en place de la base de données xls
mkdir -p ${CHEMIN_FICHIER}

cp ${FICHIER_FICHIER} ${CHEMIN_FICHIER}



#Lancement du daemon
systemctl start verifie_silva.service
