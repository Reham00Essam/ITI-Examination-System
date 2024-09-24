--------------------------Create Tables----------------------


-- Create Department table
CREATE TABLE Department 
(
	Department_Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Department_Name VARCHAR (80) NOT NULL,
	Training_Manager_Id INT NOT NULL,

	CONSTRAINT FK_Department_Instructor FOREIGN KEY (Training_Manager_Id)
		REFERENCES Instructor (Instructor_Id)

		ON DELETE CASCADE
		ON UPDATE CASCADE
) ON [PRIMARY]

-- Create Instructor table
CREATE TABLE Instructor
(
	Instructor_Id INT PRIMARY KEY NOT NULL,
	Instructor_Fname VARCHAR (220)NOT NULL, 
	Instructor_Lname VARCHAR(220)NOT NULL,
	Instructor_BrithDate DATE NOT NULL , 
	Instructor_City VARCHAR(220) NOT NULL, --- 
	Instructor_Email VARCHAR(220)NOT NULL ,
	Instructor_Password VARCHAR(220)NOT NULL,
	Instructor_Salary DECIMAL (10,2) NOT NULL ,
	Instructor_Degree VARCHAR(220) NOT NULL,
	Instructor_Gender VARCHAR(80) NOT NULL,
	Training_Manager_Id INT  NULL,
	CONSTRAINT FK_Training_Manager FOREIGN KEY (Training_Manager_Id)
    REFERENCES Instructor (Instructor_Id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)ON [PRIMARY]


--Create Exam Table
CREATE TABLE Exam
(
	Exam_Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Exam_Type VARCHAR (80) NOT NULL,   ---Quiz , Lap, Final, Correction
	Exam_Date DATE NOT NULL,
	Exam_StartTime TIME NOT NULL,
	Exam_EndTime TIME NOT NULL,
	Exam_TotalHours INT NOT NULL,
	Exam_Year INT NOT NULL,
	Exam_TotalGrades Float NOT NULL,
	Instructor_Id INT NOT NULL, --fk

	CONSTRAINT FK_Exam_Instructor FOREIGN KEY (Instructor_Id)
        REFERENCES Instructor (Instructor_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
)ON [PRIMARY]



-- Create Questions table
CREATE TABLE Question
(
	Question_Id INT PRIMARY KEY NOT NULL,
	Question_Header VARCHAR(500)NOT NULL, --- text 
	Question_Type VARCHAR(120)NOT NULL,
	Question_CorrectAnswer VARCHAR(220)NOT NULL,
	Question_Grade Float NOT NULL
)ON [PRIMARY]

-- Create Intake table
CREATE  TABLE Intake (
    Intake_Id INT PRIMARY KEY,
    Intake_Name VARCHAR(100) NOT NULL,
	Intake_StartDate Date NOT NULL,
	Intake_EndDate Date NOT NULL,
    Department_ID INT,  
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
)on [PRIMARY]


-- Create Track table
CREATE TABLE Track (
    Track_Id INT PRIMARY KEY,
    Track_Name VARCHAR(100) NOT NULL,
    Intake_Id INT,  
    FOREIGN KEY (Intake_Id) REFERENCES Intake(Intake_Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
)on [PRIMARY]


-- Create Student table
CREATE TABLE Student 
(
	Student_Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Student_Fname VARCHAR (220)NOT NULL,
	Student_Lname VARCHAR(220)NOT NULL,
	Student_BrithDate DATE NOT NULL, 
	Student_City VARCHAR(220)NOT NULL, --- 
	Student_Email VARCHAR(220)NOT NULL,
	Student_Password VARCHAR(220)NOT NULL,
	Student_Gender VARCHAR(80)NOT NULL,
	Track_Id INT NOT NULL,
	
	CONSTRAINT FK_Student_Track FOREIGN KEY (Track_Id)
        REFERENCES Track (Track_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

) ON [PRIMARY]



-- Create Course table
CREATE TABLE Course 
(
	Course_Id INT  PRIMARY KEY NOT NULL,
	Course_Name VARCHAR (220) NOT NULL,
	Course_Description VARCHAR(300)NOT NULL,
	Course_MaxGrade Float NOT NULL, --- 100 
	Course_MinGrade Float NOT NULL, ----- 50

) ON [PRIMARY]

-- Create Topic table
CREATE TABLE Topic (
    Topic_Id INT PRIMARY KEY,
    Topic_Name VARCHAR(100) NOT NULL,
    Course_Id INT,  
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
)ON [PRIMARY];



--create student course table (relation)
CREATE TABLE Student_Course (
    student_course_Id INT IDENTITY (1,1) PRIMARY KEY,
    Student_Id INT,
    Course_Id INT,
	Student_Grade Float,
    CONSTRAINT student_course_fk FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id),
    CONSTRAINT student_course_fk2 FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

--create course track table
Create table Course_Track(

	Course_Id INT NOT NULL,
	Track_Id INT NOT NULL,

	CONSTRAINT PK2_Course_Track PRIMARY KEY (Course_Id,Track_Id),

	CONSTRAINT FK_Course_Track_Table_Course FOREIGN KEY (Course_Id)
		REFERENCES Course (Course_Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	CONSTRAINT FK_Course_Track_Table_Track FOREIGN KEY (Track_Id)
		REFERENCES Track (Track_Id)
		ON DELETE CASCADE
		ON UPDATE CASCADE

);

-- Create Exam_Question table  (relation)
Create TABLE Exam_Question (
    Exam_Question_Id INT IDENTITY (1,1) PRIMARY KEY,
    Exam_Id INT,  
    Question_Id INT,  
    FOREIGN KEY (Exam_Id) REFERENCES Exam(Exam_Id),
    FOREIGN KEY (Question_Id) REFERENCES Question(Question_Id)
)on [secondaryFG];



-- Create Instructor_Course table  (relation)
Create TABLE Instructor_Course (
    Ins_Crs_Id INT  PRIMARY KEY,
    Instructor_Id INT,  
    Course_Id INT,  
    FOREIGN KEY (Instructor_Id) REFERENCES Instructor(Instructor_Id),
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
)on [secondaryFG];



-- Create Answer table  (relation)
Create TABLE Answer (
    Answer_Id INT IDENTITY (1,1) PRIMARY KEY,
    Exam_Id INT, 
    Student_Id INT,  
    Course_Id INT,
	Student_Answer VARCHAR(100),
	Question_Grade float,
    FOREIGN KEY (Exam_Id) REFERENCES Exam(Exam_Id),
    FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id),
    FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
)on [secondaryFG];
  

--create Graduated_student table
Create table Graduated_Student (
	Grad_St_Id INT IDENTITY (1,1) PRIMARY KEY,
	Student_Id INT,
	Student_name nvarchar(100),
	Collage_name nvarchar(100),
	certificates nvarchar(400),
	work_place nvarchar(100),
	FOREIGN KEY (Student_Id) REFERENCES Student(Student_Id)
)