
@echo off
echo ----------------------------------------------------
echo 使用 mysqldump 备份 MySQL 数据库
echo ----------------------------------------------------
 
rem 设置格式为yyyymmdd（date命令得到的日期格式默认为yyyy-mm-dd）
set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%"
 
echo 正在备份，请稍后...
 

mysqldump --opt -u root --password=liubing managesystem > e:/production/ManageSystem/static/DB/backup_%Ymd%.sql
 
echo 备份完毕...
@echo on