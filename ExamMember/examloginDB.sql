use examloginDB;

create table puppy (
	id int auto_increment primary key,
    title varchar(200) not null,
    image varchar(1024) NOT NULL
)ENGINE=InnoDB default character set=utf8;

select * from puppy;

insert into puppy (title,image) values("화난강아지","img/dog01.jpg"); 
insert into puppy (title,image) values("밥안먹는 강아지","img/dog02.jpg");
insert into puppy (title,image) values("잘안움직이는 강아지","img/dog03.jpg");
insert into puppy (title,image) values("주인닮은 강아지","img/dog04.jpg");
insert into puppy (title,image) values("샤워후 습진온 강아지","img/dog05.jpg");


create table StoreName (
	id int auto_increment primary key,
    map varchar(200) not null,
    store varchar(200) not null,
    addr  varchar(1000) not null,
    tel  varchar(200) not null
)ENGINE=InnoDB default character set=utf8;

select * from StoreName;


insert into StoreName (map,store,addr,tel) values("충청북도","청주지웰시티점","충청북도 청주시 흥덕구 대농로 39(청주 솔밭초등학교 앞)","043-238-4002");
insert into StoreName (map,store,addr,tel) values("경상남도","경남창녕점","경상남도 창녕군 창녕읍 군청길 23 (술정리), 1층","055-532-8090");
insert into StoreName (map,store,addr,tel) values("서울특별시","강변역점","서울특별시 광진구 강변역로4길 10, 1층","02-447-0423");
insert into StoreName (map,store,addr,tel) values("부산광역시","부산재송점","부산광역시 해운대구 재반로 86","051-782-4654");
insert into StoreName (map,store,addr,tel) values("충청북도","서원대점","충청북도 청주시 서원구 서원남로 50-5 (서원대 후문)","043-903-1199");
insert into StoreName (map,store,addr,tel) values("전라남도","순천오천점","전라남도 순천시 오천6길 16, 104호","061-741-5987");
insert into StoreName (map,store,addr,tel) values("경기도","망월사역점","경기도 의정부시 호원동 459, 신일엘리시움 1층 108호","031-871-0410");
insert into StoreName (map,store,addr,tel) values("경기도","다산중앙점","경기도 남양주시 다산중앙로123번길 9, 로데오프라자 102호","031-554-5545");


create table members (
    id  varchar(45) not null primary key,
    pw  varchar(45) not null,    
    mbname varchar(45) not null,
    email varchar(45) null,    
    email_dns varchar(45) null,  
    addr varchar(45) null,    
    tel varchar(45) null
)ENGINE=InnoDB default character set=utf8;

drop table members;
select * from members;


insert into members 
values("skinlove","qwer1234","조혜영", "skinlove83","gmail.com","서울특별시 여의대방로","01087461768","컴퓨터/인터넷","수신","창업");

update members set addr='dasfasfdsd', tel='01066666666' where id='여섯';

