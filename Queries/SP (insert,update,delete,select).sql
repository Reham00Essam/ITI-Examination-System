------------------------------------ sp SELECT, INSERT, UPDATE, DELETE ------------------------------------------------

-------------------------------------------------------------------------------------------------------
------------------------------------------ SP SELECT --------------------------------------------------
-------------------------------------------------------------------------------------------------------

-- SP for select data from Instructor Table
CREATE PROCEDURE SelectTableInstructor
AS
BEGIN
    SELECT *
	FROM Instructor
END
go

-- SP for select data from Department Table
CREATE PROCEDURE SelectTableDepartment
AS
BEGIN
    SELECT *
	FROM Department
END
go

-- SP for select data from Course Table
CREATE PROCEDURE SelectTableCourse
AS
BEGIN
    SELECT *
	FROM Course
END
go

-- SP for select data from Topic Table
CREATE PROCEDURE SelectTableTopic
AS
BEGIN
    SELECT *
	FROM Topic
END
go

-- SP for select data from Question Table
CREATE PROCEDURE SelectTableQuestion
AS
BEGIN
    SELECT *
	FROM Question
END
go

-- SP for select data from Intake Table
CREATE PROCEDURE SelectTableIntake
AS
BEGIN
    SELECT *
	FROM Intake
END
go

-- SP for select data from Track Table
CREATE PROCEDURE SelectTableTrack
AS
BEGIN
    SELECT *
	FROM Track
END
go

-- SP for select data from Student Table
CREATE PROCEDURE SelectTableStudent
AS
BEGIN
    SELECT *
	FROM Student
END
go


-- SP for select data from Exam Table
CREATE PROCEDURE SelectTableExam
AS
BEGIN
    SELECT *
	FROM Exam
END
go

-- SP for select data from Exam_Qusetion Table
CREATE PROCEDURE SelectTableExam_Qusetion
AS
BEGIN
    SELECT *
	FROM Exam_Question
END
go

-- SP for select data from Instructor_Course Table
CREATE PROCEDURE SelectTableInstructor_Course
AS
BEGIN
    SELECT *
	FROM Instructor_Course
END
go

-- SP for select data from Answer Table
CREATE PROCEDURE SelectTableAnswer
AS
BEGIN
    SELECT *
	FROM Answer
END
go


CREATE PROCEDURE SelectTableStudent_Course
AS
BEGIN
    SELECT *
	FROM Student_Course
END
go
-------------------------------------------------------------------------------------------------------
------------------------------------------ SP INSERT --------------------------------------------------
-------------------------------------------------------------------------------------------------------

-- SP for insertion into Instructor Table
create or alter proc InsertTableInstructor
	@InstructorId int,
	@InstructorFname varchar(220),
	@InstructorLname varchar(220),
    @InstructorBirthDate date,
	@InstructorCity varchar(220),
	@InstructorEmail varchar(220),
    @InstructorPassword varchar(220),
	@InstructorSalary decimal(10,2),
	@InstructorDegree varchar(220),
    @InstructorGender varchar(80),
	@TrainingManagerId int   
as
	begin try
		insert into Instructor (Instructor_Id,Instructor_Fname, Instructor_Lname, Instructor_BrithDate, Instructor_City, Instructor_Email, Instructor_Password, Instructor_Salary, Instructor_Degree, Instructor_Gender, Training_Manager_Id)
		values(@InstructorId,@InstructorFname, @InstructorLname, @InstructorBirthDate, @InstructorCity, @InstructorEmail, @InstructorPassword, @InstructorSalary, @InstructorDegree, @InstructorGender, @TrainingManagerId)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Department Table
create or alter proc InsertTableDepartment 
	@DepartmentName varchar(80),
	@TrainingManagerId int
as
	begin try
		insert into Department (Department_Name, Training_Manager_Id)
		values(@DepartmentName, @TrainingManagerId)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Course Table
create or alter proc InsertTableCourse 
	@CourseId int,
	@CourseName varchar(220),
	@CourseDescription varchar(300),
    @CourseMaxGrade float,
	@CourseMinGrade float
as
	begin try
		insert into Course(Course_Id,Course_Name, Course_Description, Course_MaxGrade, Course_MinGrade)
		values (@CourseId,@CourseName, @CourseDescription, @CourseMaxGrade, @CourseMinGrade)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Topic Table
create or alter proc InsertTableTopic 
	@TopicId INT,
	@TopicName VARCHAR(100),
	@CourseId INT
as
	begin try
		insert into Topic(Topic_Id,Topic_Name,Course_Id)
		values (@TopicId, @TopicName, @CourseId)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Question Table
create proc InsertTableQuestion
	@QuestionId int,
	@QuestionHeader varchar(500),
	@QuestionType varchar(120),
    @QuestionCorrectAnswer varchar(220),
	@QuestionGrade int
as
	begin try
		insert into Question (Question_Id,Question_Header, Question_Type, Question_CorrectAnswer, Question_Grade)
		values (@QuestionId,@QuestionHeader, @QuestionType, @QuestionCorrectAnswer, @QuestionGrade) 
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Intake Table
create proc InsertTableIntake 
	@IntakeId int,
	@IntakeName varchar(80),
	@IntakeStartDate date,
	@IntakeEndDate date,
	@DepartmentID INT    
as
	begin try
		insert into Intake (Intake_Id,Intake_Name,Intake_StartDate, Intake_EndDate, Department_ID)
		values(@IntakeId,@IntakeName, @IntakeStartDate, @IntakeEndDate,@DepartmentID)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Track Table
create proc InsertTableTrack 
	@TrackId int,
	@TrackName varchar(80),
	@IntakeId int
as
	begin try
		insert into Track (Track_Id,Track_Name,Intake_Id)
		values(@TrackId,@TrackName, @IntakeId)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Student Table
create proc InsertTableStudent 
	@StudentId INT,
	@StudentFname varchar(220),
	@StudentLname varchar(220),
	@StudentBirthDate date,
    @StudentCity varchar(220),
	@StudentEmail varchar(220),
	@StudentPassword varchar(220),
    @StudentGender varchar(80), 
	@TrackId int
as
	begin try
		insert into Student (Student_Id,Student_Fname, Student_Lname, Student_BrithDate, Student_City, Student_Email, Student_Password, Student_Gender, Track_Id)
		values(@StudentId,@StudentFname, @StudentLname, @StudentBirthDate, @StudentCity, @StudentEmail, @StudentPassword, @StudentGender, @TrackId)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Exam Table
create proc InsertTableExam 
	@ExamType varchar(80), 
	@ExamDate date, 
	@ExamStartTime time,
    @ExamEndTime time,
	@ExamTotalHours int,
	@ExamYear int,
	@ExamTotalGrades int,
	@InstructorId int
as
	begin try
		insert into Exam (Exam_Type, Exam_Date, Exam_StartTime, Exam_EndTime, Exam_TotalHours, Exam_Year, Exam_TotalGrades, Instructor_Id)
		values(@ExamType, @ExamDate, @ExamStartTime, @ExamEndTime, @ExamTotalHours, @ExamYear, @ExamTotalGrades, @InstructorId) 
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Exam_Question Table
create proc InsertTableExam_Question
	@ExamQuestionId int,
	@ExamId int,
	@QuestionId int
as
	begin try
		insert into Exam_Question (Exam_Question_Id, Exam_Id, Question_Id)
		values(@ExamQuestionId,@ExamId, @QuestionId)
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go

-- SP for insertion into Instructor_Course Table
create or alter proc InsertTableInstructor_Course
	@InsCrsId int,
	@InstructorId int,
	@CourseId int   
as
	begin try
		insert into Instructor_Course (Ins_Crs_Id, Instructor_Id, Course_Id)
		values (@InsCrsId, @InstructorId, @CourseId) 
		end try
		begin catch
			select 'Error: Duplicated Value'
		end catch
go

-- SP for insertion into Answer Table
create or alter proc InsertTableAnswer 
	@AnswerId int,
	@ExamId int,
	@StudentId int,
	@CourseId int,
	@Student_Answer nvarchar(50),
	@Question_Grade float
as
	begin try
		insert into Answer(Answer_Id,Exam_Id,Student_Id, Course_Id,Student_Answer,Question_Grade)
		values (@AnswerId, @ExamId,@StudentId, @CourseId,@Student_Answer,@Question_Grade) 
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go



-- SP for insertion into Student_Course Table
create or Alter proc InsertStudent_Course 
	@student_course_Id int,
	@Student_Id int,
	@Course_Id int   
as
	begin try
		insert into Student_Course(student_course_Id,Student_Id, Course_Id)
		values (@student_course_Id, @Student_Id, @Course_Id) 
	end try
    begin catch
		select 'Error: Duplicated Value'
    end catch
go


-------------------------------------------------------------------------------------------------------
------------------------------------------ SP UPDATE --------------------------------------------------
-------------------------------------------------------------------------------------------------------

-- SP for update some data [instructor fname,lname,birthdate,city,salary,degree] in Instructor Table
create or alter proc UpdateTableInstructor @InstructorId int,@InstructorFname varchar(220), 
	@InstructorLname varchar(220),@InstructorBirthDate date,@InstructorCity varchar(220),
    @InstructorSalary decimal(10,2),@InstructorDegree varchar(220)
as
   begin try
	update Instructor
	set Instructor_Fname = @InstructorFname, Instructor_Lname = @InstructorLname, Instructor_BrithDate = @InstructorBirthDate, 
	Instructor_City = @InstructorCity, Instructor_Salary = @InstructorSalary, Instructor_Degree = @InstructorDegree
	where Instructor_Id = @InstructorId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go


-- SP for update data in Department Table
create proc UpdateTableDepartment @DepartmentId int,@DepartmentName varchar(80),@TrainingManagerId int
as
   begin try
	update Department
	set Department_Name = @DepartmentName, Training_Manager_Id = @TrainingManagerId
	where Department_Id = @DepartmentId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating data in Course Table
create proc UpdateTableCourse @Course_Id int , @Course_Name varchar(220), @Course_Description varchar(300), 
@Course_MaxGrade float, @Course_MinGrade float
as
	begin try
		update Course
		set Course_Name = @Course_Name, Course_Description = @Course_Description, Course_MaxGrade = @Course_MaxGrade,
		Course_MinGrade = @Course_MinGrade 
		where Course_Id = @Course_Id
	end try
	begin catch
	  select 'Error: Not Existed Value'
    end catch
go

-- SP for updating data in Topic Table
create proc UpdateTableTopic @Topic_Id int , @Topic_Name varchar(100), @Course_Id int
as
	begin try
		update Topic
		set Topic_Name = @Topic_Name, Course_Id = @Course_Id
		where Course_Id = @Course_Id
	end try
	begin catch
	  select 'Error: Not Existed Value'
    end catch
go

-- SP for updating data in Question Table
create proc UpdateTableQuestion  @QuestionId int,@QuestionHeader varchar(500), @QuestionType varchar(120),
    @QuestionCorrectAnswer varchar(220),@QuestionGrade int
as
   begin try
	update Question
	set Question_Header = @QuestionHeader, Question_Type = @QuestionType, Question_CorrectAnswer = @QuestionCorrectAnswer, 
	Question_Grade = @QuestionGrade
	where Question_Id = @QuestionId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating data in Intake Table
create proc UpdateTableIntake @IntakeId int, @IntakeName varchar(80),@IntakeStartDate date,@IntakeEndDate date,@DepartmentId int
as
   begin try
	update Intake
	set Intake_Name = @IntakeName, Intake_StartDate = @IntakeStartDate, Intake_EndDate = @IntakeEndDate, Department_ID = @DepartmentId
	where Intake_Id = @IntakeId 
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating data in Track Table
create proc UpdateTableTrack @TrackId int,@TrackName varchar(80),@IntakeId int 
as
   begin try
	update Track
	set Track_Name = @TrackName, Intake_Id = @IntakeId
	where Track_Id = @TrackId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating Some data [student fname,lname,birthdate,city,trackid] in Student Table
create proc UpdateTableStudent @StudentId int,@StudentFname varchar(220),@StudentLname varchar(220),
	@StudentBirthDate date,@StudentCity varchar(220), @TrackId int
as
   begin try
	update Student
	set Student_Fname = @StudentFname, Student_Lname = @StudentLname, Student_BrithDate = @StudentBirthDate, Student_City = @StudentCity, Track_Id = @TrackId
	where Student_Id = @StudentId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating some data in Exam Table
create proc UpdateTableExam  @ExamId int,@ExamType varchar(80),@ExamDate date,@ExamStartTime time,
    @ExamEndTime time,@ExamTotalHours int,@ExamTotalGrades int,@InstructorId int
as
   begin try
	update Exam
	set Exam_Type = @ExamType, Exam_Date = @ExamDate, Exam_StartTime = @ExamStartTime, Exam_EndTime = @ExamEndTime, 
	Exam_TotalHours = @ExamTotalHours,Exam_TotalGrades = @ExamTotalGrades, Instructor_Id = @InstructorId
	where Exam_Id = @ExamId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating data in Exam_Question Table
create proc UpdateTableExam_Question @ExamQuestionId int, @ExamId int, @QuestionId int
as
   begin try
	update Exam_Question
	set Exam_Id = @ExamId, Question_Id = @QuestionId
	where Exam_Question_Id = @ExamQuestionId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating data in Instructor_Course Table
create proc UpdateTableInstructor_Course @InstructorCourseId int,@InstructorId int,@CourseId int 
as
   begin try
	update Instructor_Course
	set Instructor_Id = @InstructorId, Course_Id = @CourseId
	where Ins_Crs_Id = @InstructorCourseId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-- SP for updating data in Answer Table
create or alter proc UpdateTableAnswer @AnswerId int,@ExamId int,@StudentId int,@CourseId int ,@Student_Answer nvarchar(50), @Question_Grade float
as
   begin trys
	update Answer
	set Exam_Id = @ExamId, Student_Id = @StudentId, Course_Id = @CourseId ,Student_Answer = @Student_Answer , Question_Grade = @Question_Grade
	where Answer_Id = @AnswerId
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go



-- SP for updating data in Student_Course Table
create proc UpdateStudent_Course @student_course_Id int, @StudentId int,@CourseId int 
as
   begin try
	update Student_Course
	set  Student_Id = @StudentId, Course_Id = @CourseId
	where student_course_Id = @student_course_Id
   end try
   begin catch
	  select 'Error: Not Existed Value'
   end catch
go

-------------------------------------------------------------------------------------------------------
------------------------------------------ SP DELETE --------------------------------------------------
-------------------------------------------------------------------------------------------------------


-- SP for delete from Instructor Table
create proc DeleteFromTableInstructor @InstructorId int
as
	begin try
		delete from Instructor
		where Instructor_Id = @InstructorId
	end try
    begin catch
	    select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Department Table
create proc DeleteFromTableDepartment @DepartmentId int
as
	begin try
		delete from Department
		where Department_Id = @DepartmentId
	end try
    begin catch
	    select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Course Table
create proc DeleteFromTableCourse @CourseId int
as
	begin try
		delete from Course
		where Course_Id = @CourseId
	end try
    begin catch
	    select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Topic Table
create proc DeleteFromTableTopic @TopicId int
as
	begin try
		delete from Topic
		where Topic_Id = @TopicId
	end try
    begin catch
	    select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Question Table
create proc DeleteFromTableQuestion @QuestionId int
as
	begin try
		delete from Question
		where Question_Id = @QuestionId
	end try
    begin catch
	    select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Intake Table
create proc DeleteFromTableIntake @IntakeId int
as
	begin try
		delete from Intake
		where Intake_Id = @IntakeId
	end try
    begin catch
	    select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Track Table
create proc DeleteFromTableTrack @TrackId int
as
	begin try
		delete from Track
		where Track_Id = @TrackId
	end try
    begin catch
		select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Student Table
create proc DeleteFromTableStudent @StudentId int
as
	begin try
		delete from Student
		where Student_Id = @StudentId
	end try
    begin catch
	    select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Exam Table
create proc DeleteFromTableExam @ExamId int
as
	begin try
		delete from Exam
		where Exam_Id = @ExamId+
		-+
		+3333333333333333


	end try
    begin catch
		select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Exam_Question Table
create proc DeleteFromTableExam_Question @ExamQuestionId int
as
	begin try
		delete from Exam_Question
		where Exam_Question_Id = @ExamQuestionId
	end try
    begin catch
	  select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Instructor_Course Table
create proc DeleteFromTableInstructor_Course @InstructorCourseId int
as
	begin try
		delete from Instructor_Course
		where Ins_Crs_Id = @InstructorCourseId
	end try
    begin catch
	  select 'Error:  Not Existed Value'
    end catch
go

-- SP for delete from Answer Table
create proc DeleteFromTableAnswer @AnswerId int
as
	begin try
		delete from Answer
		where Answer_Id = @AnswerId
	end try
    begin catch
	  select 'Error:  Not Existed Value'
    end catch
go



-- SP for delete from student_course Table
create proc DeleteStudent_Course @student_course_Id int
as
	begin try
		delete from Student_Course
		where student_course_Id = @student_course_Id
	end try
    begin catch
	  select 'Error:  Not Existed Value'
    end catch
go


