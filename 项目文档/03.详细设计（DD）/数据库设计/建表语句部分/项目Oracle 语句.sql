--创建表空间和管理员用户

create tablespace webResumeTP datafile 'd:/webResumeTP01.dbf' size 100m 
autoextend on next 100m maxsize 1G;

create user teamleader identified by teamleader default tablespace webResumeTP;
grant dba to teamleader;

--登录管理员账户，创建成员用户，并授予连接和resource权限
conn teamleader/teamleader;

create user team04 identified by team04 default tablespace webResumeTP;
grant connect,resource to team04;



--远程登录成员用户(确保打开Listener服务)
conn team04/team04@10.25.166.208:1521/BensonOracle;

