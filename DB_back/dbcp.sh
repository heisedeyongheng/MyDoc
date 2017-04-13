#!/bin/bash

SQL_BACK_DIR="/home/data/backup/mysql/"
SQL_LOCAL_DIR="/home/prodatabase/data/"
BACK_DATE=$(date +%Y%m%d)
BACK_TIME="03:00"
localfile=""
remotefile=""
pwd="TbAiY@)!^1008XL*XC"
DB_LIST=('aiya' 'aiyacas' 'aiyacloud' 'aiyahui_trade' 'aiyalog' 'aiyashop' 'aiyatopic' 'openfire')
#DB_LIST=('aiya' 'aiyacas' 'aiyahui_trade' 'aiyatopic' 'aiyalog')


for DBname in ${DB_LIST[@]};do
  remotefile=${SQL_BACK_DIR}${DBname}_${BACK_DATE}_${BACK_TIME}.sql.gz
  localfile=${SQL_LOCAL_DIR}${DBname}_${BACK_DATE}_${BACK_TIME}.sql.gz
# echo $remotefile--$localfile
  /home/prodatabase/rcp.sh $remotefile 'root' '192.168.12.2' $localfile $pwd
done