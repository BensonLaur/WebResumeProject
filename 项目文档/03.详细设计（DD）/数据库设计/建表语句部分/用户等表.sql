

普通用户表：t_n_user
create table t_n_user(
 nu_id	char(14) primary key,
 Nu_name	VARCHAR2(30) not null,
 Nu_sex	char(1) check (Nu_sex in ('F','M')),	
 Nu_birthday	 date,	
 Nu_nativePlace varchar2(50),
 Nu_province	varchar2(30),
 Nu_city	 varchar2(30),
 Nu_county	 varchar2(30),
 Nu_mphone	 varchar2(12),
 Nu_email	 varchar2(50),
 Nu_photoName	 varchar2(30),
 Nu_password	 varchar2(20) Not null);
 
 
 消息表：t_message
 create table t_message(
m_id char(14) primary key,
m_date date Not null,
M_type	number(1) check (M_type in (1,2,3)),
M_content varchar2(200),
M_state	number(1) check (M_state in (1,2)),
nu_id char(14),
foreign key(nu_id) references t_n_user(nu_id)
);

广告表：t_advertisement
create table t_advertisement(
Ad_id CHAR(14) primary key,
Ad_client VARCHAR2(30),	
Ad_publishDate	DATE,		
Ad_deadline	DATE,		
Ad_photoname VARCHAR2(30),	
Ad_link	VARCHAR2(20)		
);