create table t_Company(
	c_id char(14) primary key,
	c_name varchar2(30) not null,
	C_province varchar2(30) not null,
	c_city varchar2(30) not null,
	c_county varchar2(30),
	C_address varchar2(100) not null,
	C_contact varchar2(30),
	C_contactSex char(1) check(c_contactsex in('m','f')),
	C_areaCode char(4) not null,
	c_tele varchar2(10) not null,
	C_extensionNum varchar2(6),
	C_mphone varchar2(12) not null,
	C_mainIndustry varchar2(30) not null,
	C_minorIndustry varchar2(30),
	C_comProperty varchar2(30) not null,
	C_comScale varchar2(30) not null
);
create table t_e_user(
	Eu_id char(14) primary key,
	Eu_name varchar2(30) not null,
	Eu_email varchar2(50),
	Eu_password varchar2(20),
	C_id char(14),
  foreign key(C_id) references t_Company(C_id)
);
create table t_welfare(
	w_id char(14) primary key,
	w_name varchar2(30),
	p_id char(14),
	foreign key(p_id) references t_position£¨p_id£©
);