---1 index for student
create index student_Index_Fn
on student ([Student_Fname])
go
create index student_Index_LN
on student ([Student_Lname])
go
create index student_Index_Track
on student (Track_ID)
----2 index for instructor
go
create index instructor_index_FN
on instructor ([Instructor_Fname])
go
create index instructor_index_LN
on instructor ([Instructor_Lname])
go

----3 index for instructor_course
create index instructor_courseID_index
on [dbo].[instructor_course] (course_ID)

go
create index instructor_course_instructorID_index
on [dbo].[instructor_course] (instructor_ID)

go
-----4 index for course---
create index course_index_crs_name
on course (course_Name)

go
create index course_index_crs_description
on course (course_Description)
go

-----5-index for exam
create index exam_index_Exam_type
on exam (Exam_type)
go
create index exam_index_instructor_ID
on exam (instructor_ID)
go
create index exam_index_date
on exam (Exam_date)
go
create index Exam_Startdate
on [dbo].[exam]([Exam_StartTime],[Exam_EndTime])

create index  Exam_index_total_grades
on [dbo].[Exam]([Exam_TotalGrades])
go

------5 - index for exam question
create index exam_question_question_ID
on exam_question([Question_Id])
go
create index exam_question_exam_ID
on exam_question([Exam_ID])
go

-----7---index for question
create  index  question_index_Q_header
on question ([Question_Header])
go
create  index  question_index_question_type
on question ([question_type])
go
-----8--- index for student answer
create index answer_index_st_ID
on [dbo].[Answer] ([Student_Id])
go
create index answer_index_crs_ID
on [dbo].[Answer]([Course_Id])
go
create index student_answer_index_e_ID
on  [dbo].[Answer]([Exam_ID])

create index answer_index_ST_answer
on [dbo].[Answer]([Student_Answer])
go

---- 9--index for Department
create index department_index_name
on [dbo].[Department]([Department_Name])
go
create index department_index_Manger_id
on [dbo].[Department]([Training_Manager_Id])
go

go

----12--student_course
create index st_crs_st_ID
on [dbo].[Student_course] ([Student_ID])
go
create index st_crs_crs_ID
on [dbo].[Student_course] ([Course_ID])
go
create index st_crs_St_grade
on Student_course (Student_Grade)

go
