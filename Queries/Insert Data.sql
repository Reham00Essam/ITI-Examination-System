---------------------------------------------------------------------------
----------------------insert data into tables------------------------------
---------------------------------------------------------------------------

-------insert into student---------------

BULK INSERT Student
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Students.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-------insert into Instructor---------------
BULK INSERT Instructor
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Instructors.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


--------------insert into Departments--------------
INSERT INTO Department (Department_Name, Training_Manager_Id)
VALUES
('Information Systems', 1),
('Infrastructure Network And Security Services', 5),
('Software Engineering And Development', 9),
('Content Developments', 15),
('open source', 11),
(' data management', 10),
('network and cloud', 14),
('software development', 2),
('blockchain technology', 3),
(' digital arts', 4),
(' marketing', 6),
(' hardware', 30);


------------insert into Intake----------------------
BULK INSERT Intake
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Intake.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

----------insert into Track------------------------
BULK INSERT Track
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Tracks.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-----------insert into Questions---------------
BULK INSERT Question
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\All_Questions.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	FORMAT = 'CSV'
);

select * from question

-----------insert into Course---------------
BULK INSERT Course
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Courses.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	FORMAT = 'CSV'
);

------------insert into Topic--------------
BULK INSERT Topic
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Topic.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


------------insert into Course_Track---------------------------------
BULK INSERT Course_Track
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Course_Track.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

------------insert into Instructor_Course---------------------------------
BULK INSERT Instructor_Course
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Instructor_Course.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

------insert into Graduated_Student
BULK INSERT Graduated_Student
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Graduated.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);



------insert into student course-----------
BULK INSERT Student_Course
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Student_Course.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

--------------------------------------
BULK INSERT Exam
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Exam.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Question
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\All_Questions.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT [dbo].[Exam_Question]
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Exam_Question.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Answer
FROM 'D:\ITI\Grad Project\Final Project\Queries\Insertion\Answer.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


select * from Instructor
select * from Student
select * from Department
select * from Track
select * from Intake
select * from Course
select * from Topic
select * from Question
select * from Instructor_Course
select * from Course_Track
select * from Exam_Question
select * from Exam
Select * from Answer
select * from Graduated_Student
select * from Student_Course



