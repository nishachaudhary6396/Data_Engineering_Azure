CREATE TABLE students (
	student_id INT,
	name char(50),
	age INT,
	grade CHAR(1)
);

INSERT INTO students(name,age,grade)
values('Nisha','22','A'),
	  ('Meet','21','A'),
	  ('xyz','23','B');
select * from students;
	  
SELECT name from students where age = 22;

UPDATE students set age = 21 where name = 'Nisha';
select * from students;

DELETE from students where name = 'xyz';
select * from students;
