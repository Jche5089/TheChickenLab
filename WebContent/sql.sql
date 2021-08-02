drop table members;
drop table franchises;
drop table questions;
drop table article;
drop table order_article;

select * from order_article;
create table members(
mem_id varchar2(50),
mem_pw varchar2(50) not null,
mem_name varchar2(20) not null,
mem_dob number(20) not null,
mem_add varchar2(200) not null,
mem_tell varchar2(20) not null,
mem_gender varchar2(10) not null,
mem_grade varchar2(10) not null,
constraint member_id_pk primary key(mem_id),
constraint member_tell_uk unique(mem_tell),
constraint member_gender_ck check(mem_gender in('M','F')),
constraint member_grade_ck check(mem_grade in('A','B','C'))
);

insert into members values('aaa','aaa','aaa',960606,'aaa','0101','M','A');
insert into members values('admin','123','aaa',960606,'aaa','4017','M','A');
select * from members;



create table questions(
que_num number(10),
mem_id varchar2(50) not null,
que_adrress varchar2(20) not null,
que_arc number(20) not null,
que_que varchar2(1000) not null,
mem_tell varchar2(100) not null,
constraint questions_num_pk primary key(que_num),
constraint mem_id_fk foreign key(mem_id) references members(mem_id),
constraint mem_tell_fk foreign key(mem_tell) references members(mem_tell)
);

select * from questions;

create sequence que_num_sq increment by 1 start with 1;
drop sequence que_num_sq;
select * from questions;

create table franchises(
frc_num number(30) ,
mem_id varchar2(50) not null,
frc_add varchar2(200) not null,
mem_tell varchar2(20) not null,
constraint franchises_num_pk primary key(frc_num),
constraint members_id_fk foreign key(mem_id) references members(mem_id),
constraint members_tell_fk foreign key(mem_tell) references members(mem_tell)
);

select * from franchises;

create sequence frc_num_sq increment by 1 start with 1;
drop sequence frc_num_sq;

create table article(
frc_num number(30) ,
art_id number(30) not null,
art_name varchar2(100),
art_price number(30),
art_stock number(30)
);
select * from article;
insert into article values(,,,)


create table order_article(
frc_num number(30),
art_id number(30),
order_count number(10),
art_order_price number(30)
);

drop table order_article;

select * from order_article;


select * from QuarterSales ;
delete from members where mem_id='jj';
delete from members where mem_id='ooo';
delete from members where mem_id='zz';
delete from members where mem_id='aaa';
delete from members where mem_id='as';
delete from members where mem_id='jj';

update members set mem_add = '서울시 강남구 청담동' where mem_id='geona';
update members set mem_add = '서울시 강서구 등촌3동' where mem_id='kdhyun';
update members set mem_add = '서울시 종로구 삼청동' where mem_id='songhy';
update members set mem_add = '서울시 성북구 돈암동' where mem_id='simjeongchul';
update members set mem_add = '서울시 용산구 한강로동' where mem_id='senghuan';


update members set mem_add = '서울시 용산구 한강로동' where haengjeongdong ='방화2동';


