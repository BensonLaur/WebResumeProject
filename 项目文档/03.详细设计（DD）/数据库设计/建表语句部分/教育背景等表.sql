--create table t_resume(
--    r_id char(14) primary key,
--    nu_id char(14) REFERENCES t_n_user(nu_id),
--    r_jobCategory number(1) CHECK (r_jobCategory in(1,2,3)),
--    r_trades varchar2(50),
--    r_profess varchar2(50),
--    r_salary varchar2(30),
--    r_state varchar2(50),
--    r_selfIntro varchar2(200),
--    r_highestEdu varchar2(30)
--);

create table t_education (
    e_id char(14) primary key,
    e_startTime date not null,
    e_endTime date not null,
    e_place varchar2(30) not null
--    r_id char(14) REFERENCES t_resume(r_id)
);

create table t_workExp(
    we_id char(14) primary key,
    we_starTime date not null,
    we_endTime date,
    we_place varchar2(50) not null,
    we_position varchar2(50) not null,
    we_scale varchar2(30),
    we_salary number(10,2),
    we_info varchar2(200)
--    r_id char(14) REFERENCES t_resume(r_id)
);