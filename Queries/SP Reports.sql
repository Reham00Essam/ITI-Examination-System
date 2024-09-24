Use Final_Project

--Report1 that returns the students information according to Department **name
create OR ALTER proc Sp_getstudentFromDep
@deptNO int
as
begin 
select
	s.Student_Id,s.Student_BrithDate,s.Student_City,
	s.Student_Email,s.Student_Password,
	s.Student_Fname,s.Student_Lname,s.Student_Gender,d.Department_Name
from Student as s
join Track as t
	on s.Track_Id= t.Track_Id

join Intake as i 
	on i.Intake_Id = t.Intake_Id 

join Department as d
	on d.Department_Id = i.Department_ID

where d.Department_Id = @deptNO 

end
go

--Report2 that takes the student ID and returns the grades of the student in all courses
CREATE or alter PROCEDURE [dbo].[sp_ReportStudentGrades] (@Student_Id INT)
AS
BEGIN
    SELECT top 1
        c.Course_Name, 
        CAST((sc.Student_Grade / c.Course_MaxGrade) * 100 AS DECIMAL(5, 2)) AS Grade_Percentage -- Assuming Grade and Max_Grade are in the Student_Course table
    FROM 
        Course c
    JOIN 
        Student_Course sc ON c.Course_Id = sc.Course_Id
    WHERE 
        sc.Student_Id = @Student_Id;
END;
GO

---Report3 that takes the instructor ID and returns the name of the courses that he teaches and the number of student per course.
Create or ALTER proc [dbo].[sp_instructor_course_NoOF_students]
@instructor_id int	
as 
begin
select c.Course_Name, COUNT(s.Student_ID) as number_of_students
	from Instructor_Course as IC
	 join Student_Course as s
	on s.Course_Id = IC.Course_Id 
	 join Course c
	 on c.Course_Id =s.Course_Id
	where IC.Instructor_Id =@instructor_id
	group by IC.Instructor_Id,c.Course_Name

end;

--Report4 that takes course ID and returns its topics  
create or alter proc Sp_get_course_topics
@course_ID int
as
begin
	select c.Course_Id,c.Course_Name,t.Topic_Name
	from course c inner join Topic t
	on c.Course_Id = t.Course_Id
	where c.Course_Id=@course_ID

END;
go


--Report5 that takes exam number and returns the Questions in it and chocies 
create proc SP_getExamQuestion
@exam_ID int
as
begin 
	select q.Question_Header ,q.Question_Type
	from Exam_Question as e
	join Question as q 
	on e.Question_Id = q.Question_Id
	where e.Exam_Id = @exam_ID
end

go

----Report6 that takes exam number and the student ID then returns the Questions in this exam with the student answers.
create or alter proc SP_Get_examQuestion_Student_answer
@exam_ID int,
@Student_ID int
as
begin
	select q.Question_Header , a.Student_Answer
	from Exam_Question as e
	join Question as q 
	on q.Question_Id = e.Question_Id
	left join Answer as a
	on e.Exam_Id = a.Exam_Id
	where @exam_ID = e.Exam_Id and a.Student_Id = @Student_ID
end;

go



