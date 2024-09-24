---------------Views-------------------------------


---View All Departments with Their Managers
CREATE VIEW vw_DepartmentsWithManagers AS
SELECT 
    d.Department_ID,
    d.Department_Name,
    i.Instructor_Fname + ' ' + i.Instructor_Lname AS Manager_Name
FROM 
    Department d
LEFT JOIN 
    Instructor i ON d.Training_Manager_Id = i.Instructor_Id;



Select * From vw_DepartmentsWithManagers


---View All Students in Each Department
CREATE VIEW vw_StudentsWithDepartments AS
SELECT 
    s.Student_Id,
    s.Student_Fname,
    s.Student_Lname,
    d.Department_Name
FROM 
    Student s
INNER JOIN 
    Track t ON s.Track_Id = t.Track_Id
INNER JOIN 
    Intake i ON t.Intake_Id = i.Intake_Id
INNER JOIN 
    Department d ON i.Department_ID = d.Department_ID;


Select * From vw_StudentsWithDepartments


--View Course Topics
CREATE VIEW vw_CourseTopics AS
SELECT 
    c.Course_Id,
    c.Course_Name,
    t.Topic_Id,
    t.Topic_Name
FROM 
    Course c
INNER JOIN 
    Topic t ON c.Course_Id = t.Course_Id;


Select * From vw_CourseTopics


---View All Courses with Instructor Names
CREATE VIEW vw_CoursesWithInstructors AS
SELECT 
    c.Course_Id,
    c.Course_Name,
    i.Instructor_Fname + ' ' + i.Instructor_Lname AS Instructor_Name
FROM 
    Course c
INNER JOIN 
    Instructor_Course ic ON c.Course_Id = ic.Course_Id
INNER JOIN 
    Instructor i ON ic.Instructor_Id = i.Instructor_Id;


Select * From vw_CoursesWithInstructors


--## View Exam Details with Instructor Information
CREATE VIEW vw_ExamsWithInstructors AS
SELECT 
    e.Exam_Id,
    e.Exam_Date,
    e.Exam_StartTime,
    e.Exam_EndTime,
    i.Instructor_Fname + ' ' + i.Instructor_Lname AS Instructor_Name
FROM 
    Exam e
INNER JOIN 
    Instructor i ON e.Instructor_Id = i.Instructor_Id;


select * from vw_ExamsWithInstructors


--View All Questions in Each Exam
CREATE VIEW vw_ExamQuestions AS
SELECT 
    e.Exam_Id,
    q.Question_Id,
    q.Question_header,
    q.Question_Type,
    q.Question_Grade
FROM 
    Exam e
INNER JOIN 
    Exam_Question eq ON e.Exam_Id = eq.Exam_Id
INNER JOIN 
    Question q ON eq.Question_Id = q.Question_Id;


select * from vw_ExamQuestions


--View Student Grades in Each Course

CREATE VIEW vw_StudentGrades AS
SELECT 
    s.Student_Id,
    s.Student_Fname,
    s.Student_Lname,
    c.Course_Name,
    a.Answer_Id,
    q.Question_Header,
    a.Course_Id
FROM 
    Student s
INNER JOIN 
    Answer a ON s.Student_Id = a.Student_Id
INNER JOIN 
    Course c ON a.Course_Id = c.Course_Id
INNER JOIN 
    Exam e ON a.Exam_Id = e.Exam_Id
INNER JOIN 
    Exam_Question eq ON e.Exam_Id = eq.Exam_Id
INNER JOIN 
    Question q ON eq.Question_Id = q.Question_Id;



select * from vw_StudentGrades
----------------------------------------------------------

--View Exam Results by Exam and Student

CREATE VIEW vw_ExamResultsByStudent AS
SELECT 
    e.Exam_Id,
    s.Student_Id,
    s.Student_Fname,
    s.Student_Lname,
    q.Question_Header,
    a.Answer_Id
FROM 
    Exam e
INNER JOIN 
    Answer a ON e.Exam_Id = a.Exam_Id
INNER JOIN 
    Student s ON a.Student_Id = s.Student_Id
INNER JOIN 
    Exam_Question eq ON e.Exam_Id = eq.Exam_Id
INNER JOIN 
    Question q ON eq.Question_Id = q.Question_Id;


Select * from vw_ExamResultsByStudent



---------------------------------------------------
