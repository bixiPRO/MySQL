#!/bin/bash

# Directori de origen i del destí
ORIGEN="/var/lib/mysql"
DESTI="/home/usuari/segur_inc_mysql"

# Data
DATA=$(date +"%Y%m%d")

# Copia incremental amb rsync mode verbose activat
sudo rsync -av --link-dest=$DESTI/$DATA --exclude='lost+found' $ORIGEN $DESTI/$DATA

