CREATE TABLE user_1 ( 
user_id int(6),
nick_user varchar(15)not null,
country text(3),
woj text(15),
city text(20),
rate float,
sex text(1) not null,
dyst float(2)#dodane
);

select * from user_1;

describe user_1;
#drop table user_1;



create table event_1( 
orgenaze_u int(6), 
ev_place varchar(50) not null, 
ev_start datetime not null,
ev_end datetime not null,
no_of_members int,
difficulty_lvl varchar(10)
);

select *from event_1;

#drop table event_1;


create table place (
name varchar(50)not null, 
wsp_1 int,
wsp_2 int
);


#create table diff (
#beginer int(1),
#normal int(1),
#pro int(1)
#);

#create table activ(
#);