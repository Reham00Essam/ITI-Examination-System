Use final_project

--Generate Exam Procedure
Create PROCEDURE CreateExam
    @ExamType VARCHAR(80),
    @ExamStartTime TIME(7),
    @ExamEndTime TIME(7),
    @ExamTotalGrades FLOAT,
	@Num_TF_Questions INT,
    @Num_MCQ_Questions INT,
	@Num_ARTICEL_Questions INT,
	@InstructorId INT
AS
BEGIN
    
    DECLARE @TotalHours INT;
	DECLARE @CurrExamID INT;
    SET @TotalHours = DATEDIFF(HOUR, @ExamStartTime, @ExamEndTime);

    -- Insert new record into Exam table
    INSERT INTO Exam (Exam_Type, Exam_Date, Exam_StartTime, Exam_EndTime, Exam_TotalHours, Exam_Year, Exam_TotalGrades, Instructor_Id)
    VALUES (@ExamType, GETDATE(), @ExamStartTime, @ExamEndTime, @TotalHours, year(GETDATE()), @ExamTotalGrades, @InstructorId);

	Select @CurrExamID = E.Exam_Id from Exam E

	INSERT INTO Exam_Question (Exam_Id, Question_Id)
    SELECT TOP (@Num_TF_Questions) @CurrExamID, Q.Question_Id
    FROM Question Q
    WHERE Q.Question_Type = 'True Or False'
    ORDER BY NEWID();

	INSERT INTO Exam_Question (Exam_Id, Question_Id)
    SELECT TOP (@Num_ARTICEL_Questions) @CurrExamID, Q.Question_Id
    FROM Question Q
    WHERE Q.Question_Type = 'Article'
    ORDER BY NEWID();

	INSERT INTO Exam_Question (Exam_Id, Question_Id)
    SELECT TOP (@Num_MCQ_Questions) @CurrExamID, Q.Question_Id
    FROM Question Q
    WHERE Q.Question_Type = 'MCQ'
    ORDER BY NEWID();

	END;

        

------------------------------------------------------------------------------
Create or alter PRocedure Exam_Model
AS

	SELECT  e.Exam_Id,e.Exam_Type, e.Exam_Date, e.Exam_TotalHours, 
	q.Question_Type , q.Question_Header, q.Question_Grade
	FROM Exam e inner join Exam_Question eq on e.Exam_Id = eq.Exam_Id 
	inner join Question q on eq.Question_Id = q.Question_Id

EXECUTE Exam_Model



Select * from Student_Course 
----------------------------------------------

--exam answers Procedure

CREATE or Alter PROCEDURE GradesSum  @id int AS

 update Exam
 set Exam_TotalGrades = [dbo].[GetTotalQuestionsByExamId](@id)
 where Exam.Exam_Id = @id

 go;

 drop function GetTotalQuestionsByExamId
CREATE FUNCTION GetTotalQuestionsByExamId (@ExamId INT)
RETURNS float
AS
BEGIN
    DECLARE @TotalQuestions float ;
    SELECT @TotalQuestions = sum(e.Question_Grade)
    FROM Question e join Exam_Question 
    on e.Question_Id = Exam_Question.Question_Id 
	AND Exam_Question.Exam_Id = @ExamId;
    RETURN @TotalQuestions;
END;



select * from Exam
-----------------------------------------------
--exams correction Procedure
CREATE PROCEDURE InsertAnswer
    @StudentId INT,
    @CourseId INT,
    @ExamId INT,
	@QuestionId INT,
    @StudentAnswer NVARCHAR(MAX),
    @QuestionGrade FLOAT
AS
BEGIN
    -- Validate that the course and student exist in the StudentCourse table
    IF EXISTS (
        SELECT 1
        FROM Student_Course SC
        WHERE SC.Course_Id = @CourseId
        AND SC.Student_Id = @StudentId
    )
    BEGIN
        -- Validate that the exam and question exist in the Exam_Question table
        IF EXISTS (
            SELECT 1
            FROM Exam_Question EQ
            WHERE EQ.Exam_Id = @ExamId AND EQ.Question_Id = @QuestionId
			)
        BEGIN
            -- Insert the record into the Answer table
            INSERT INTO Answer (Exam_Id, Student_Id, Course_Id, Student_Answer, Question_Grade)
            VALUES (@ExamId, @StudentId, @CourseId, @StudentAnswer, @QuestionGrade);
        END
        ELSE
        BEGIN
            -- Raise an error if the exam or question is not found
            RAISERROR('Exam ID or Question ID does not exist in the Exam_Question table.', 16, 1);
        END
    END
    ELSE
    BEGIN
        -- Raise an error if the student or course is not found
        RAISERROR('Course ID or Student ID does not exist in the StudentCourse table.', 16, 1);
    END
END;

---------------------------------------
CREATE PROCEDURE CorrectAnswer
    @AnswerId INT
AS
BEGIN
    DECLARE @StudentAnswer NVARCHAR(MAX);
    DECLARE @QuestionId INT;
    DECLARE @CorrectAnswer NVARCHAR(MAX);
    DECLARE @MaxQuestionGrade FLOAT;

    -- Get the student's answer and the corresponding question ID from the Answer table
    SELECT 
        @StudentAnswer = A.Student_Answer,
        @QuestionId = Q.Question_Id
    FROM 
        Answer A
    INNER JOIN
        Exam_Question EQ ON A.Exam_Id = EQ.Exam_Id
    INNER JOIN
        Question Q ON EQ.Question_Id = Q.Question_Id
    WHERE 
        A.Answer_Id = @AnswerId;

    -- Get the correct answer and the maximum grade for the question from the Question table
    SELECT 
        @CorrectAnswer = Q.Question_CorrectAnswer, 
        @MaxQuestionGrade = Q.Question_Grade
    FROM 
        Question Q
    WHERE 
        Q.Question_Id = @QuestionId;

    -- Compare the student's answer with the correct answer
    IF @StudentAnswer = @CorrectAnswer
    BEGIN
        -- If the answer is correct, update the Question_Grade in the Answer table
        UPDATE Answer
        SET Question_Grade = @MaxQuestionGrade
        WHERE Answer_Id = @AnswerId;
    END
    ELSE
    BEGIN
        -- If the answer is incorrect, set the Question_Grade to 0
        UPDATE Answer
        SET Question_Grade = 0
        WHERE Answer_Id = @AnswerId;
    END
END;


EXEC CorrectAnswer @AnswerId = 0;
select * from Answer
-----------------------Student Final Grade----------------------------------

CREATE or alter PROCEDURE StudentGrade(
    @StudentID INT,
    @CourseID INT,
    @Grade INT OUTPUT
)
AS
BEGIN
    DECLARE @CorrectAnswersCount INT;

    SELECT @CorrectAnswersCount = COUNT(*)
    FROM Student_Course SC
    JOIN Answer a ON SC.Course_Id = a.Course_Id
    WHERE SC.Student_Id = @StudentID
      AND SC.Course_Id = @CourseID
      AND a.Student_Id = @StudentID
      AND a.Question_Grade = 1;  

    SET @Grade = @CorrectAnswersCount;

    UPDATE Student_Course
    SET Student_Grade = @Grade  
    WHERE Student_Id = @StudentID
      AND Course_Id = @CourseID;

    RETURN;
END;






