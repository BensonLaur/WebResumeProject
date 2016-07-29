create table t_resume (
  r_id char(14) primary key,
  nu_id char(14),
  r_jobCategory number(1) check(r_jobCategory in (1,2,3)),
  r_trades varchar2(50),
  r_profess varchar2(50),
  r_salary varchar2(30),
  r_state varchar2(50),
  r_selfIntro varchar2(200),
  r_highestEdu varchar2(30),
    constraint fk_rnu_id foreign key(nu_id) references t_n_user(nu_id)
);


create table t_position(
  p_id char(14) primary key£¬
  p_property varchar2(30),
  p_name varchar2(30),
  p_type varchar2(30),
  p_requestNum number(6),
  p_lowestEdu varchar2(30),
  p_ExpRequest number(1) check(p_ExpRequest in (1,2)),
  p_salary number(10,2),
  p_description varchar2(200),
  p_publishPlace varchar2(50),
  p_workPlace varchar2(50),
  p_publishDate date,
  p_deadline date,
  p_feedfack varchar2(200),
  p_autoReply number(1) check(p_autoReply in (1,2)),
  p_publishState number(1) check(p_publishState in (1,2,3,4)),
  p_viewCount number(10) default 0,
  eu_id char(14),
  constraint fk_peu_id foreign key(eu_id) references t_e_user(eu_id)
);

create table t_ResumeRecord(
  p_id char(14),
  r_id char(14),  
  rr_date date,
  rr_state number(1) check(rr_state in(1,2,3)),
  constraint pk_rrid primary key(p_id,r_id),
  constraint fk_rrp_id foreign key(p_id) references t_position(p_id),
  constraint fk_rrr_id foreign key(r_id) references t_resume(r_id)
);
