--Section 1: Intermediate SQL Queries

-- 1.List all users who are enrolled in more than three courses.
select u.user_id,u.user_name,COUNT(e.course_id) as total_courses
from users u join enrollments e 
on u.user_id = e.user_id
group by u.user_id, u.user_name
having count(e.course_id) >3;

--2. Find courses that currently have no enrollments.
select c.course_id,c.course_name
from cources c left join enrollments e
on course_id = e.course_id
where e.course_id is null;

--3.Display each course along with the total number of enrolled users.
select c.course_id,c.course_name,count(e.user_id) as
total_enrollments
from cources c 
left join enrollments e
on c.course_id = e.course_id
group by c.course_id,c.course_name;

--4. Identify users who enrolled in a course but never accessed any lesson.

select distinct u.user_id,u.user_name
from users u
join enrollments e
on u.user_id = e.user_id
left join user_activity ua
on u.user_id = ua.user_id 
where ua.user_id is null;

-- 5.Fetch lessons that have never been accessed by any user.

select l.lesson_id,l.lesson_name
from lessons l
left join user_activity ua
on l.lesson_id = ua.lesson_id
where ua.lesson_id is null;

--6.Show the last activity timestamp for each user

selct u.user_id,u.user_name,max(a.submission_date) as last_activity
from users u
left join assessment_submissions a
on u.user_id = a.user_id
group by u.user_id, u.user_name;

--7.List users who submitted an assessment but scored less than 50 percent of the maximum score.

select u.user_name,s.score,a.max_score
from users u
join assessment_submissions s
on u.user_id = s.user_id
join assessments a 
on s.assessment_id = a.assessment_id
where s.score < 0.5 * a.max_score;

--8.Find assessments that have not received any submissions.

select a.assessment_id
from assessments a 
left join assessment_submissions s
on a.assessment_id = s.assessment_id
where s.assessmeent_id is null;

--9.Display the highest score achieved for each assessment.

select assessment_id, max(score) as highest_score 
from assessment_submissions
group by assessment_id;

--10.Identify users who are enrolled in a course but have an inactive enrollment status.

select u.user_id,u.user_name,e.course_id,e.enrollment_status
from users u
join enrollments e
on u.user_id = e.user_id
where e.enrollment_status = 'inactive';



--section 2: Advance SQL Queries

select * from users;
select * from courses;
select * from lessons;
select * from enrollments;
select * from user_activity;
select * from assessments;
select * from assessment_submissions;

--For each course, calculate:Total number of enrolled users,Total number of lessons
select 
c.course_id,
c.course_title,
count(distinct e.user_id) as total_enrolled_users,
count(distinct l.lesson_id) as total_lessons
from courses c left join enrollments e on c.course_id=e.course_id
left join lessons l on c.course_id=l.course_id
group by c.course_id,c.course_title;

--Identify the top three most active users based on total activity count.
select u.user_id , u.user_name , count(ua.activity_id) as total_activity_count
from users u left join user_activity ua
on u.user_id=ua.user_id
group by u.user_id,u.user_name
order by total_activity_count DESC
limit 3;

--List courses where lessons are frequently accessed but assessments are never attempted.
select c.course_id,c.course_title 
from courses c join lessons l on c.course_id=l.course_id
join user_activity ua on l.lesson_id =ua.lesson_id
left join assessments a on c.course_id=a.course_id
left join assessment_submissions sub on a.assessment_id=sub.assessment_id
group by c.course_id,c.course_title
having count(sub.submission_id)=0;

