Create table random(
ID serial Primary key,
name varchar(100) not null,
email varchar(100) unique not null,
created_at date default now(),
age int check (age>=18)

);


insert into random(name,email,age)
values('Mradul','mradul145@gmail.com',23);


Select * from random;