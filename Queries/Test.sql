Use final_project

------------------------------------------------------------------
--------------------------SP MAIN---------------------------------
------------------------------------------------------------------

--test Generate Exam procedure 
EXEC CreateExam 
    @ExamType = 'final',
    @ExamStartTime = '9:00',
    @ExamEndTime = '12:00',
    @ExamTotalGrades = 20,
	@Num_ARTICEL_Questions = 0,
	@Num_TF_Questions = 5,
	@Num_MCQ_Questions = 5,
    @InstructorId = 2;



select * from Exam
select * from Exam_Question 
select * from Student_Course

--test Exam Answer Procedure
EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 130  ,
    @StudentAnswer = 'True',
    @QuestionGrade = 1.0;



EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 210  ,
    @StudentAnswer = 'TRUE',
    @QuestionGrade = 1.0;


EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 7  ,
    @StudentAnswer = 'False',
    @QuestionGrade = 1.0;

EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 56  ,
    @StudentAnswer = 'False',
    @QuestionGrade = 1.0;

EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 133  ,
    @StudentAnswer = 'TRUE',
    @QuestionGrade = 1.0;

EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 1171 ,
    @StudentAnswer = 'A',
    @QuestionGrade = 1.0;

EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 760  ,
    @StudentAnswer = 'A',
    @QuestionGrade = 1.0;

EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 470  ,
    @StudentAnswer = 'A',
    @QuestionGrade = 1.0;

EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 1132  ,
    @StudentAnswer = 'A',
    @QuestionGrade = 1.0;

EXEC InsertAnswer 
    @StudentId = 1,
    @CourseId = 1,
    @ExamId = 395,
    @QuestionId = 343  ,
    @StudentAnswer = 'A',
    @QuestionGrade = 1.0;

SELECT * FROM Answer


EXEC CorrectAnswer @AnswerId = 53252;
EXEC CorrectAnswer @AnswerId = 53253;
EXEC CorrectAnswer @AnswerId = 53254;
EXEC CorrectAnswer @AnswerId = 53255;
EXEC CorrectAnswer @AnswerId = 53256;
EXEC CorrectAnswer @AnswerId = 53257;
EXEC CorrectAnswer @AnswerId = 53258;
EXEC CorrectAnswer @AnswerId = 53259;
EXEC CorrectAnswer @AnswerId = 53260;




DECLARE @Grade VARCHAR(100);

EXEC StudentGrade @StudentID = 1, @CourseID = 1, @Grade = @Grade OUTPUT;

PRINT 'Grade:' + CAST(@Grade AS VARCHAR);

SELECT * FROM Answer


SELECT * FROM [dbo].[Student_Course]




------------------------------------------------------------------------
-------------------Report Testing---------------------------------------
------------------------------------------------------------------------

--test SP Report1 Sp_getstudentFromDep
EXEC Sp_getstudentFromDep @deptNO = 5; 


--test SP Report2 sp_ReportStudentGrades
EXEC sp_ReportStudentGrades @Student_Id =1;  


--test SP Report3 sp_instructor_course_NoOF_students
EXEC sp_instructor_course_NoOF_students @instructor_id =5;  


--test SP Report4 Sp_get_course_topics
EXEC Sp_get_course_topics @course_ID = 2; 


--test SP Report5 SP_getExamQuestion
EXEC SP_getExamQuestion @exam_ID = 4;  


--test SP Report6 SP_Get_examQuestion_Student_answer
EXEC SP_Get_examQuestion_Student_answer @exam_ID = 194, @Student_ID = 1; 





----------------------------------------------------------------------------


Select * from Exam
Select * from Student







