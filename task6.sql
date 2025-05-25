CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    HeadOfDepartmentID INT
)

INSERT INTO Departments (DepartmentID, DepartmentName, HeadOfDepartmentID) VALUES
(1, 'Computer Science', NULL),
(2, 'Physics', NULL),
(3, 'Mathematics', NULL)


CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT  
);

INSERT INTO Professors (ProfessorID, Name, Email, DepartmentID) VALUES
(101, 'Dr. Alice Smith', 'alice.s@university.edu', 1),
(102, 'Dr. Bob Johnson', 'bob.j@university.edu', 1),
(103, 'Dr. Carol White', 'carol.w@university.edu', 2),
(104, 'Dr. David Green', 'david.g@university.edu', 3),
(105, 'Dr. Eve Black', 'eve.b@university.edu', 1);


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    MajorID INT   
);

INSERT INTO Students (StudentID, Name, Email, MajorID) VALUES
(1, 'John Doe', 'john.d@student.edu', 1),
(2, 'Jane Miller', 'jane.m@student.edu', 1),
(3, 'Peter Jones', 'peter.j@student.edu', 2),
(4, 'Sarah Davis', 'sarah.d@student.edu', 3),
(5, 'Mike Brown', 'mike.b@student.edu', 1);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT,
    ProfessorID INT
);

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits, ProfessorID) VALUES
(1001, 'Intro to Programming', 1, 3, 101),
(1002, 'Data Structures', 1, 4, 102),
(1003, 'Quantum Mechanics', 2, 3, 103),
(1004, 'Calculus I', 3, 4, 104),
(1005, 'Database Systems', 1, 3, 105),
(1006, 'Linear Algebra', 3, 3, 104);


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(101, 1, 1001, '2023-09-01'),
(102, 1, 1002, '2023-09-01'),
(103, 2, 1001, '2023-09-01'),
(104, 3, 1003, '2023-09-01'),
(105, 4, 1004, '2023-09-01'),
(106, 5, 1005, '2023-09-01'),
(107, 2, 1005, '2023-09-01'),
(108, 1, 1005, '2023-09-01');

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    EnrollmentID INT NOT NULL,
    Grade VARCHAR(5),
    Semester VARCHAR(20)
);

INSERT INTO Grades (GradeID, EnrollmentID, Grade, Semester) VALUES
(1, 101, 'A', 'Fall 2023'),
(2, 102, 'B+', 'Fall 2023'),
(3, 103, 'A-', 'Fall 2023'),
(4, 104, 'B', 'Fall 2023'),
(5, 105, 'A', 'Fall 2023'),
(6, 106, 'C+', 'Fall 2023'),
(7, 107, 'B', 'Fall 2023'),
(8, 108, 'A', 'Fall 2023');


-- 1.Student and their enrollments
SELECT 
    S.Name AS StudentName,
    E.EnrollmentDate,
    E.CourseID
FROM
    Students S
INNER JOIN
    Enrollments E ON S.StudentID = E.StudentID;

--2. Enrollments and the courses 
SELECT
    E.EnrollmentID,
    C.CourseName,
    E.EnrollmentDate
FROM
    Enrollments E
INNER JOIN
    Courses C ON E.CourseID = C.CourseID;

--3. Courses and the departments
SELECT
    C.CourseName,
    D.DepartmentName
FROM
    Courses C
INNER JOIN
    Departments D ON C.DepartmentID = D.DepartmentID;

--4.Professors and the departments
SELECT
    P.Name AS ProfessorName,
    D.DepartmentName
FROM
    Professors P
INNER JOIN
    Departments D ON P.DepartmentID = D.DepartmentID;

--5.Students and their major departments
SELECT
    S.Name AS StudentName,
    D.DepartmentName AS MajorDepartment
FROM
    Students S
INNER JOIN
    Departments D ON S.MajorID = D.DepartmentID;

--6.Enrollments and their grades
SELECT
    E.EnrollmentID,
    G.Grade,
    G.Semester
FROM
    Enrollments E
INNER JOIN
    Grades G ON E.EnrollmentID = G.EnrollmentID;

--7.Courses and the professors teaching them
SELECT
    C.CourseName,
    P.Name AS ProfessorName
FROM
    Courses C
INNER JOIN
    Professors P ON C.ProfessorID = P.ProfessorID;

--8.Departments and their head professors
SELECT
    D.DepartmentName,
    P.Name AS HeadOfDepartmentName
FROM
    Departments D
LEFT JOIN
    Professors P ON D.HeadOfDepartmentID = P.ProfessorID;

--9.Professors and the courses they teach
SELECT
    P.Name AS ProfessorName,
    C.CourseName
FROM
    Professors P
LEFT JOIN
    Courses C ON P.ProfessorID = C.ProfessorID;

--10.Students, their enrolled courses, and the grades received
SELECT
    S.Name AS StudentName,
    C.CourseName,
    G.Grade,
    G.Semester
FROM
    Students S
INNER JOIN
    Enrollments E ON S.StudentID = E.StudentID
INNER JOIN
    Courses C ON E.CourseID = C.CourseID
INNER JOIN
    Grades G ON E.EnrollmentID = G.EnrollmentID;

	
---10 query which should cover aggregation, having, group by, order by

SELECT D.DepartmentName,
COUNT(S.StudentID) AS NumberOfStudents
FROM Departments D
LEFT JOIN Students S ON D.DepartmentID = S.MajorID
GROUP BY D.DepartmentName
ORDER BY NumberOfStudents DESC;

	
SELECT P.Name AS ProfessorName,
COUNT(C.CourseID) AS NumberOfCoursesTaught
FROM Professors P
LEFT JOIN Courses C ON P.ProfessorID = C.ProfessorID
GROUP BY P.Name
ORDER BY NumberOfCoursesTaught DESC, ProfessorName ASC;


SELECT S.Name AS StudentName,
COUNT(E.EnrollmentID) AS TotalEnrollments
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
GROUP BY S.Name
HAVING COUNT(E.EnrollmentID) > 1
ORDER BY TotalEnrollments DESC;


SELECT  D.DepartmentName,
COUNT(C.CourseID) AS NumberOfCourses
FROM Departments D
INNER JOIN Courses C ON D.DepartmentID = C.DepartmentID
GROUP BY  D.DepartmentName
HAVING COUNT(C.CourseID) > 2
ORDER BY NumberOfCourses DESC;


SELECT C.CourseName,
COUNT(E.StudentID) AS StudentsEnrolled
FROM Courses C
INNER JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName
ORDER BY StudentsEnrolled DESC, C.CourseName ASC;


SELECT P.Name AS ProfessorName,D.DepartmentName,
AVG(C.Credits) AS AverageDepartmentCourseCredits
FROM Professors P
INNER JOIN Departments D ON P.DepartmentID = D.DepartmentID
INNER JOIN Courses C ON D.DepartmentID = C.DepartmentID
GROUP BY P.Name, D.DepartmentName
ORDER BY AverageDepartmentCourseCredits DESC;


SELECT S.Name AS StudentName,
SUM(C.Credits) AS TotalEnrolledCredits
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID
GROUP BY S.Name
ORDER BY TotalEnrolledCredits DESC;


SELECT C.CourseName,
COUNT(G.Grade) AS NumberOfAGrades
FROM Courses C
INNER JOIN Enrollments E ON C.CourseID = E.CourseID
INNER JOIN Grades G ON E.EnrollmentID = G.EnrollmentID
WHERE G.Grade = 'A'
GROUP BY C.CourseName
HAVING COUNT(G.Grade) > 0
ORDER BY NumberOfAGrades DESC;


SELECT G.Semester,
COUNT(E.EnrollmentID) AS TotalEnrollments
FROM Enrollments E
INNER JOIN Grades G ON E.EnrollmentID = G.EnrollmentID
GROUP BY G.Semester
ORDER BY G.Semester ASC;

SELECT S.Name AS StudentName,
COUNT(E.EnrollmentID) AS NumberOfEnrollments
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
GROUP BY S.Name
ORDER BY NumberOfEnrollments DESC
LIMIT 3;





