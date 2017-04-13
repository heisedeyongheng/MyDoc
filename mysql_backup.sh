#!/bin/bash
#mysql backup ...
#back file name  ex.  dbname_date.gz
SQL_BACK_DIR="/home/data/backup/mysql"
BACK_DATE=$(date +%Y%m%d)
BACK_TIME=$(date +%H:%M)
Sql_del_DATE=$(date -d -10days +%Y%m%d)
Sql_user="root"
Sql_pass="AyRoot@)!^1008DBp"
Sql_port="5612"
Sql_host="localhost"
DB_LIST=('aiya' 'aiyacas' 'aiyacloud' 'aiyahui_trade' 'aiyalog' 'aiyashop' 'aiyatopic' 'openfire')

BackupDB()
{
  mysqldump -u${Sql_user} -p${Sql_pass} -R -f -B ${DBname} | gzip > ${DBname}_${BACK_DATE}_${BACK_TIME}.sql.gz

}
Del_BackDB()
{
        rm -rf ${DBname}_${Sql_del_DATE}*.sql.gz
}
#main
for DBname in ${DB_LIST[@]};do

  if [[ -d ${SQL_BACK_DIR} ]];then
    cd ${SQL_BACK_DIR}
    BackupDB
    Del_BackDB
  else
    mkdir -p ${SQL_BACK_DIR}
    cd ${SQL_BACK_DIR}
    BackupDB
    Del_BackDB
  fi
done