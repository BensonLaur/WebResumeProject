--������ռ�͹���Ա�û�

create tablespace webResumeTP datafile 'd:/webResumeTP01.dbf' size 100m 
autoextend on next 100m maxsize 1G;

create user teamleader identified by teamleader default tablespace webResumeTP;
grant dba to teamleader;

--��¼����Ա�˻���������Ա�û������������Ӻ�resourceȨ��
conn teamleader/teamleader;

create user team04 identified by team04 default tablespace webResumeTP;
grant connect,resource to team04;



--Զ�̵�¼��Ա�û�(ȷ����Listener����)
conn team04/team04@10.25.166.208:1521/BensonOracle;

