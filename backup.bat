
@echo off
echo ----------------------------------------------------
echo ʹ�� mysqldump ���� MySQL ���ݿ�
echo ----------------------------------------------------
 
rem ���ø�ʽΪyyyymmdd��date����õ������ڸ�ʽĬ��Ϊyyyy-mm-dd��
set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%"
 
echo ���ڱ��ݣ����Ժ�...
 

mysqldump --opt -u root --password=liubing managesystem > e:/production/ManageSystem/static/DB/backup_%Ymd%.sql
 
echo �������...
@echo on