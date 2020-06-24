# 1.Query the existence of 1 course
select * from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select * from course where id = 1 
union 
select * from course where id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select s.id , s.name , avg(sc.score) `平均分`
from student s left join student_course sc on s.id = sc.studentId 
group by s.id having avg(sc.score) >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select studentId from student_course);

# 5.Query all SQL with grades
select * from student where id in (select studentId from student_course);

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * 
from student 
where id 
in (select sc1.studentId from student_course sc1 , student_course sc2 
where sc1.courseId = 1 and sc2.courseId = 2 and sc1.studentId = sc2.studentId);

# 7.Retrieve 1 student score with less than 60 scores in descending order
select * 
from student s , student_course sc 
where s.id = sc.studentId and sc.courseId = 1 and sc.score < 60 order by sc.score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId `科目` , avg(score) `平均分`
from student_course 
group by courseId 
order by avg(score) desc , courseId;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select s.name , sc.score from
student s , course c , student_course sc  
where s.id = sc.studentId and c.id = sc.courseId and c.name = 'Math' and sc.score < 60;
