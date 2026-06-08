create table students(
student_id serial Primary key,
name varchar(100),
age bigint
);

insert into students(name,age)
values('Nisha',22),
('Khushi',25),

Alter table students
ADD Column email varchar(100);

Alter table students
Drop Column email ;

Alter table students
ADD Column email varchar(100) Default 'not provided';

Alter table students
RENAME COLUMN name to full_name ;

Alter table students
Alter Column age type smallint;

Alter table students
alter Column age set Default 18;

Alter table students
Alter Column age  Drop Default;

alter table students
Rename to school_students;


select * from students;