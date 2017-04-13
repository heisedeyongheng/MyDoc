1.安装 spawn
yum install spawn
2.修改定时任务
vi /etc/crontab 
crontab -e 编辑 crontab -l查看
00 04 * * * /bin/bash /home/prodatabase/dbcp.sh
service crontab  restart
service crond  restart