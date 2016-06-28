create database jiaowuMG character set utf8 collate utf8_general_ci;
use jiaowumg;
create table Admin
(
   id                   varchar(20) not null,
   password             varchar(20),
   state                tinyint,
   primary key (id)
);

create table major
(
   id int auto_increment,
   name varchar(20) not null unique,
   primary key(id)
);

create table Student
(
   id                   varchar(20) not null,
   name                 varchar(20) not null,
   male                 bool not null,  
   birthday             date,
   phone                varchar(20),
   mid                  int,
   idcard               varchar(20) not null,
   password             varchar(20) not null,
   submit               bool not null,
   primary key (id)
);
alter table Student add constraint FK_Student_mid foreign key(mid)
      references major(id) on delete Set Null on update cascade;


create table Student_moreInfo
(
   id                   varchar(20) not null,
   department           varchar(20),
   years                tinyint,
   clazz                varchar(20),
   married              bool,
   politics             varchar(20),
   origin               varchar(20),
   nation               varchar(20),
   layer                varchar(20),
   postcode             varchar(20),
   homephone            varchar(20),
   contact              varchar(20),
   daytoschool          varchar(20),
   ruxuekaohao          varchar(20),

   primary key (id)
);
alter table Student_moreInfo add constraint FK_Student_moreInfo foreign key (id)
      references Student(id) on delete cascade on update cascade;

create table Tea_position
(
   id                   int auto_increment,  
   name                 varchar(20) not null unique,
   primary key (id)
);
create table Teacher
(
   id                   varchar(20) not null,
   name                 varchar(20) not null,
   male                 bool not null,
   posid                int,
   password             varchar(20) not null,
   primary key (id)
);
alter table Teacher add constraint FK_Teacherposition foreign key (posid)
      references Tea_position(id) on delete restrict on update restrict;

create table semester
(
   id                   int auto_increment,
   name                 varchar(20) not null unique,
   primary key(id)
);

create table Course
(
   id                   varchar(20) not null,
   name                 varchar(20) not null unique,
   semid                int,
   weeks                tinyint not null,
   primary key (id)
);
alter table Course add constraint Course_semid foreign key (semid)
      references semester(id) on delete set null on update cascade;

create table Student_Teacher
(
   sid                  varchar(20) not null,
   tid                  varchar(20) not null,
   primary key (sid, tid)
);
alter table Student_Teacher add constraint FK_Student_Teacher1 foreign key (sid) references Student (id) on delete restrict on update restrict;

alter table Student_Teacher add constraint FK_Student_Teacher2 foreign key (tid)
      references Teacher (id) on delete restrict on update restrict;

# save students' grades
create table Student_Course   
(
   sid                  varchar(20) not null,
   tid                  varchar(20) not null,
   grades               float(4,1),
   primary key (sid, tid)
);
alter table Student_Course add constraint FK_Student_Course1 foreign key (tid)
      references Course (id) on delete restrict on update restrict;
alter table Student_Course add constraint FK_Student_Course2 foreign key (sid)
      references Student (id) on delete restrict on update restrict;

#record teacher's courses
create table Teacher_Course
(
   tid                  varchar(20) not null,
   cid                  varchar(20) not null,
   submit               bool not null,
   people               int,
   primary key (tid, cid)
);
alter table Teacher_Course add constraint FK_Teacher_Course1 foreign key (cid)
      references Course (id) on delete restrict on update cascade;
alter table Teacher_Course add constraint FK_Teacher_Course2 foreign key (tid)
      references Teacher (id) on delete restrict on update cascade;


#record teacher, student, course 's realations and teacher log on grades...
create table Tea_Stu_Cour_Save
(
   sid                  varchar(20),
   tid                  varchar(20),
   cid                  varchar(20),
   grades               float not null,
   primary key (sid, tid, cid)
);
alter table Tea_Stu_Cour_Save comment 'temporily save students'' grades';
alter table Tea_Stu_Cour_Save add constraint FK_Course foreign key (cid)
      references Course (id) on delete cascade on update cascade;

alter table Tea_Stu_Cour_Save add constraint FK_Student foreign key (sid)
      references Student (id) on delete cascade on update cascade;

alter table Tea_Stu_Cour_Save add constraint FK_Teacher foreign key (tid)
      references Teacher (id) on delete cascade on update cascade;

create table power
(
   id                   int auto_increment,
   xk                   bool not null,  #xuan ke
   df                   bool not null,  #da fen
   primary key(id)
);
#ini: insert into power(xk,df) values(false,false);

create table broadcast
(
   id                   int auto_increment,
   content              varchar(50),
   time 				date,
   primary key(id)
);

delimiter //
create procedure paddmajor(in m varchar(20))
begin
	insert into major(name) values(m);
end;//
delimiter ;


delimiter //
create procedure paddSemester(in m varchar(20))
begin
	insert into semester(name) values(m);
end;//
delimiter ;

delimiter //
create procedure pfindAdmin(in pid varchar(20), in pwd varchar(20))
begin
	select * from admin where id=pid and password=pwd;
end;//
delimiter ;


delimiter //
create procedure pgetAllCourses()
begin
	select c.*,s.name as semester from course c join semester s on c.semid=s.id;
end;//
delimiter ;


delimiter //
create procedure pcheckCourse(out flag bool,in pcid varchar(20), in psid varchar(20))
begin
	if exists(select tid from Tea_Stu_Cour_Save where cid=pcid and sid=psid) then
		set flag=true;
	else
		set flag=false;	
	end if;
end;//
delimiter ;

/*call pcheckCourse(@a,'91f3a6db-dfd8-455f-a', '2013221104210001');
select @a;
call pcheckCourse(@a,'91f3a6db-dfd8-455f-b', '2013221104210001');
select @a;*/ 


delimiter //
create procedure pcheckSubmit(out flag bool,in ptid varchar(20), in pcid varchar(20))
begin
	select submit into flag from teacher_course where tid=ptid and cid=pcid;
end;//
delimiter ;

/*call pcheckSubmit(@a,'1234562', 'd2b9b249-47e2-489e-b');
select @a;
call pcheckSubmit(@a,'1234562', 'faa29bc7-c7e9-4e16-a');
select @a;*/

delimiter //
create trigger teaPwdCheck
before insert on teacher
for each row
begin
	select length(new.password) into @a;
	if @a<6 then
	set new.password='123456';
	end if;
end// 
delimiter ;
/*insert into teacher(id,name,male,posid,password) values('9999','gg',true,2,'225555555');*/

delimiter //
create trigger stuPwdCheck
before insert on student
for each row
begin
	select length(new.password) into @a;
	if (@a<6 or @a>15) then
	set new.password='123456';
	end if;
end// 
delimiter ;
/*insert into student(id,name,male,birthday,phone,mid,idcard,password,submit)  values("9999", "Ñ§Éú¼×", true, "19950720", "130261",1,'445','22222211888',false);
*/

delimiter //
create trigger broadcastCheck
before insert on broadcast
for each row
begin
	select length(new.content) into @a;
	if @a<=5 then
	set new.content=concat(new.content,'     ');
	end if;
end// 
delimiter ;
/*insert into broadcast(content) values('a');*/

delimiter //
create trigger saveCoureses
after insert on Tea_Stu_Cour_Save
for each row
begin
update Teacher_Course set people=people+1 where tid=new.tid and cid=new.cid;
end// 
delimiter ;

delimiter //
create trigger quitCouresesCheck
before delete on Tea_Stu_Cour_Save
for each row
begin
	select people into @a from Teacher_Course where tid=old.tid and cid=old.cid;
	if @a<=0 then
	update Teacher_Course set people=1 where tid=old.tid and cid=old.cid;
	end if;
end// 
delimiter ;

delimiter //
create trigger quitCoureses
after delete on Tea_Stu_Cour_Save
for each row
begin
update Teacher_Course set people=people-1 where tid=old.tid and cid=old.cid;
end// 
delimiter ;

#deprecated...
create table Stu_Tea_Cour_Save
(
   sid                  varchar(20),
   tid                  varchar(20),
   cid                  varchar(20)
);
alter table Stu_Tea_Cour_Save comment 'temporily save students'' selected courses';
alter table Stu_Tea_Cour_Save add constraint FK_Course1 foreign key (cid)
      references Course (id) on delete restrict on update restrict;

alter table Stu_Tea_Cour_Save add constraint FK_Student1 foreign key (sid)
      references Student (id) on delete restrict on update restrict;

alter table Stu_Tea_Cour_Save add constraint FK_Teacher1 foreign key (tid)
      references Teacher (id) on delete restrict on update restrict;      