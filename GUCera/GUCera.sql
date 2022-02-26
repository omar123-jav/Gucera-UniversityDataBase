CREATE DATABASE GUCera

CREATE TABLE Users(
	id INT PRIMARY KEY IDENTITY,
	firstName VARCHAR(20),
	lastName VARCHAR(20),
	password VARCHAR(20),
	gender bit,
	email VARCHAR(50),
	address VARCHAR(10)
)

CREATE TABLE UserMobileNumber(
	id INT FOREIGN KEY REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
	mobileNumber VARCHAR(20),
	PRIMARY KEY(id,mobileNumber)
)
	
CREATE TABLE Instructor(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES Users ON DELETE NO ACTION ON UPDATE NO ACTION,
	rating DECIMAL(2,1)
)

CREATE TABLE Student(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES Users ON DELETE NO ACTION ON UPDATE NO ACTION,
	gpa DECIMAL(3,2)
)


CREATE TABLE Admin(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES Users ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Course(
	id INT PRIMARY KEY IDENTITY,
	creditHours INT,
	name VARCHAR(10),
	courseDescription VARCHAR(200),
	price DECIMAL(6,2),
	content VARCHAR(20),
	adminId INT FOREIGN KEY REFERENCES Admin ON DELETE SET NULL ON UPDATE NO ACTION,
	instructorId INT FOREIGN KEY REFERENCES Instructor ON DELETE NO ACTION ON UPDATE NO ACTION,
	accepted BIT
)

CREATE TABLE Assignment(
	cid INT FOREIGN KEY REFERENCES Course ON DELETE CASCADE ON UPDATE CASCADE,
	number INT,
	type varchar(10),
	fullGrade INT,
	weight DECIMAL(4,1),
	deadline DATETIME,
	content VARCHAR(20),
	PRIMARY KEY(cid,number,type)
)

CREATE TABLE Feedback(
	cid INT FOREIGN KEY REFERENCES Course ON DELETE CASCADE ON UPDATE CASCADE,
	number INT,
	comments VARCHAR(100),
	numberOfLikes INT,
	sid INT FOREIGN KEY REFERENCES Student ON DELETE NO ACTION ON UPDATE NO ACTION
	PRIMARY KEY(cid,number)
)

CREATE TABLE Promocode
(
	code varchar(6) PRIMARY KEY,
	issueDate DATETIME,
	expiryDate DateTIME,
	discount DECIMAL(4,2),
	amount DECIMAL(6,2), --not sure
	adminId INT FOREIGN KEY REFERENCES Admin  ON DELETE CASCADE ON UPDATE CASCADE--foreign key admin--
)

CREATE TABLE StudentHasPromocode(
	sid INT FOREIGN KEY REFERENCES Student ON DELETE NO ACTION ON UPDATE NO ACTION,
	code varchar(6) FOREIGN KEY REFERENCES Promocode ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(sid,code)
)

CREATE TABLE CreditCard(
	number VARCHAR(15) PRIMARY KEY,
	cardHolderName VARCHAR(16),
	expiryDate datetime,
	cvv VARCHAR(3)
)

CREATE TABLE StudentAddCreditCard
(
	sid INT FOREIGN KEY REFERENCES Student ON DELETE NO ACTION ON UPDATE NO ACTION,
	creditCardNumber VARCHAR(15) FOREIGN KEY REFERENCES CreditCard ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(sid, creditCardNumber)
)

CREATE TABLE StudentTakeCourse
(
	sid INT FOREIGN KEY REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE,
	cid INT FOREIGN KEY REFERENCES Course ON DELETE NO ACTION ON UPDATE NO ACTION,
	instId INT FOREIGN KEY REFERENCES Instructor ON DELETE NO ACTION ON UPDATE NO ACTION,
	payedFor bit,
	grade DECIMAL(10,2),
	PRIMARY KEY(sid,cid,instId)
)

CREATE TABLE StudentTakeAssignment
(
	sid INT FOREIGN KEY REFERENCES Student ON DELETE NO ACTION ON UPDATE NO ACTION,
	cid INT,
	assignmentNumber INT,
	assignmentType varchar(10),
	grade DECIMAL(5,2) DEFAULT 0.00,
	FOREIGN KEY(cid, assignmentNumber, assignmentType) REFERENCES Assignment ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(sid,cid,grade,assignmentType,assignmentNumber)
)

CREATE TABLE StudentRateInstructor(
	sid INT FOREIGN KEY REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE,
	instId INT FOREIGN KEY REFERENCES Instructor ON DELETE NO ACTION ON UPDATE NO ACTION,
	rate DECIMAL(2,1),
	PRIMARY KEY(sid,instId)
)

CREATE TABLE StudentCertifyCourse(
	sid INT FOREIGN KEY REFERENCES Student,
	cid INT FOREIGN KEY REFERENCES Course,
	issueDate datetime,
	PRIMARY KEY(sid,cid)
)

CREATE TABLE CoursePrerequisiteCourse
(
	cid INT FOREIGN KEY REFERENCES Course ON DELETE CASCADE ON UPDATE CASCADE,
	prerequisiteId INT FOREIGN KEY REFERENCES Course ON DELETE NO ACTION ON UPDATE NO ACTION,
	PRIMARY KEY(cid,prerequisiteId)
)

CREATE TABLE InstructorTeachCourse
(
	instId INT FOREIGN KEY REFERENCES Instructor ON DELETE CASCADE ON UPDATE CASCADE,
	cid INT FOREIGN KEY REFERENCES Course ON DELETE NO ACTION ON UPDATE NO ACTION,
	PRIMARY KEY(instId, cid)
)





-- START of Procedures
GO 
CREATE PROC studentRegister
	 @first_name varchar(20), @last_name varchar(20), @password varchar(20), @email varchar(50),
	 @gender bit, @address varchar(10)
AS
BEGIN
	INSERT INTO USERS		VALUES(@first_name, @last_name, @password,  @gender, @email, @address);
	INSERT INTO STUDENT VALUES(SCOPE_IDENTITY(),0.00);
END

-- Unresgistered Users

GO
CREATE PROC instructorRegister
	 @first_name varchar(20), @last_name varchar(20), @password varchar(20), @email varchar(50), 
	 @gender bit, @address varchar(10)
AS
BEGIN
	INSERT INTO USERS			VALUES(@first_name, @last_name, @password, @gender, @email, @address);
	INSERT INTO INSTRUCTOR		VALUES(SCOPE_IDENTITY(),0.0)
END

-- Registered Users

GO
CREATE PROC userLogin
	@ID int, @password varchar(20), @Success bit OUTPUT, @Type int OUTPUT
AS
BEGIN
	IF EXISTS (SELECT id, password FROM USERS WHERE id = @ID and password = @password)
	BEGIN
		SET @Success = 1;
		IF EXISTS (SELECT id FROM ADMIN WHERE ADMIN.id = @ID)
		BEGIN
			SET @Type = 1;
		END
		ELSE IF EXISTS (SELECT id FROM INSTRUCTOR WHERE INSTRUCTOR.id = @ID)
		BEGIN
			SET @Type = 0;
		END
		ELSE
		BEGIN
			SET @Type = 2;
		END
	END
	ELSE
	BEGIN
		SET @Success = 0;
	END
END

GO
CREATE PROC addMobile
	 @ID varchar(20), @mobile_number varchar(20)
AS
BEGIN
	IF EXISTS (SELECT id FROM USERS WHERE id = @ID)
	BEGIN
		INSERT INTO UserMobileNumber VALUES(@ID, @mobile_number);
	END
END

GO

CREATE PROC AdminListInstr
AS
BEGIN
	SELECT firstName, lastName
	FROM Users u inner join Instructor i
	on i.id = u.id 
END

GO

CREATE PROC AdminViewInstructorProfile
@instrId INT
AS
BEGIN
	SELECT U.*, I.rating
	FROM Users U INNER JOIN Instructor I ON U.id = I.id
	WHERE I.id = @instrId
END

GO

CREATE PROC AdminViewAllCourses
AS
BEGIN
	SELECT name,creditHours,price,content,accepted FROM Course
END

GO

CREATE PROC AdminViewNonAcceptedCourses
AS
BEGIN
	SELECT name,creditHours,price,content
	FROM Course
	WHERE accepted != 1 OR accepted IS NULL
END


GO

CREATE PROC AdminViewCourseDetails
@courseId INT
AS
BEGIN
	SELECT name,creditHours,price,content,accepted
	FROM Course
	WHERE id = @courseId
END

GO 
CREATE PROC AdminAcceptRejectCourse
@adminId INT, @courseId INT
AS
BEGIN
	IF(EXISTS(SELECT * FROM Admin WHERE id = @adminId))
	BEGIN
		UPDATE Course
		SET accepted = 1
		WHERE id = @courseId
		UPDATE Course
		SET adminId = @adminId
		WHERE id = @courseId
	END
END



GO

CREATE PROC AdminCreatePromoCode
@code varchar(6), @issueDate datetime, @expiryDate datetime, @discount decimal(4,2), @adminId int
AS
BEGIN
	INSERT INTO Promocode(code,issueDate,expiryDate,discount,adminId) VALUES(@code,@issueDate,@expiryDate,@discount,@adminId)
END

GO

CREATE PROC AdminListAllStudents
AS
BEGIN
	SELECT firstName,lastName
	FROM Student S INNER JOIN Users U ON S.id = U.id
END

GO

CREATE PROC AdminViewStudentProfile
@sid INT
AS
BEGIN
	SELECT U.firstName, U.lastName, U.gender, U.email, U.address ,S.gpa
	FROM Student S INNER JOIN Users U ON S.id = U.id
	WHERE S.id = @sid
END


GO

CREATE PROC AdminIssuePromocodeToStudent
@sid INT, @pid VARCHAR(6)
AS
BEGIN
	INSERT INTO StudentHasPromocode VALUES(@sid, @pid)
END


GO

CREATE PROC InstAddCourse
@creditHours int, @name varchar(10), @price DECIMAL(6,2), @instructorId int
AS
BEGIN
	INSERT INTO Course(creditHours,name,price,instructorId) VALUES(@creditHours,@name,@price,@instructorId)
	INSERT INTO InstructorTeachCourse VALUES(@instructorId,SCOPE_IDENTITY())
END

GO

CREATE PROC UpdateCourseContent
@instrId int, @courseId int, @content varchar(20)
AS
BEGIN
	
	UPDATE Course
	SET content = @content
	WHERE id = @courseid AND ((@instrId = instructorId) OR (EXISTS(SELECT instId
															FROM InstructorTeachCourse 
															WHERE instId = @instrId AND @courseid = cid)))
END

GO

CREATE PROC UpdateCourseDescription
@instrId int, @courseId int, @courseDescription varchar(200)
AS
BEGIN
	UPDATE Course
	SET courseDescription = @courseDescription
	WHERE id = @courseId AND (instructorId = @instrId OR (EXISTS(SELECT instId
															FROM InstructorTeachCourse 
															WHERE instId = @instrId AND @courseid = cid)))
END

GO

CREATE PROC AddAnotherInstructorToCourse
@instid int, @cid int, @adderIns int
AS
BEGIN
	IF EXISTS(SELECT * FROM Course WHERE id = @cid AND instructorId = @adderIns)
	BEGIN
		INSERT INTO InstructorTeachCourse VALUES(@instid,@cid)
	END
END

GO

CREATE PROC InstructorViewAcceptedCoursesByAdmin
@instrId int
AS
BEGIN
	SELECT id,name,creditHours FROM Course
	WHERE instructorId = @instrId AND accepted = 1
END

GO

CREATE PROC DefineCoursePrerequisites
@cid int , @prerequsiteId int
AS
BEGIN
	INSERT INTO CoursePrerequisiteCourse VALUES(@cid,@prerequsiteId)
END

GO 

CREATE PROC DefineAssignmentOfCourseOfCertainType
@instId int, @cid int , @number int, @type varchar(10), @fullGrade int, @weight decimal(4, 1), @deadline DATETIME, @content varchar(200)
AS
BEGIN
	INSERT INTO Assignment VALUES(@cid, @number, @type, @fullGrade, @weight, @deadline, @content)
END

GO

CREATE PROC updateInstructorRate
@insid INT
AS
BEGIN
	DECLARE @newRate DECIMAL(2,1)
	SELECT @newRate = avg(rate) FROM StudentRateInstructor WHERE instId = @insid
	UPDATE Instructor
	SET rating = @newRate
	WHERE id = @insid
END

GO

CREATE PROC ViewInstructorProfile
@instrId INT
AS
BEGIN
	SELECT U.firstName,U.lastName,U.gender,U.email,U.address,I.rating,M.mobileNumber FROM Instructor I INNER JOIN Users U ON I.id = U.id LEFT JOIN UserMobileNumber M ON U.id = M.id
END

GO

CREATE PROC InstructorViewAssignmentsStudents
@instrId INT, @cid INT
AS
BEGIN
	SELECT sid,cid,assignmentNumber,assignmentType
	FROM StudentTakeAssignment
	WHERE cid = @cid
END

GO

CREATE PROC InstructorgradeAssignmentOfAStudent
@instrId int, @sid int , @cid int, @assignmentNumber int, @type varchar(10), @grade decimal(5, 2) 
AS
BEGIN
	UPDATE StudentTakeAssignment
	SET grade = @grade
	WHERE sid = @sid AND cid = @cid AND assignmentNumber = @assignmentNumber AND assignmentType = @type
END

GO

CREATE PROC ViewFeedbacksAddedByStudentsOnMyCourse
@instId INT, @cid INT
AS
BEGIN
	SELECT F.number,F.comments,F.numberOfLikes
	FROM Feedback F INNER JOIN Course C ON F.cid = C.id
	WHERE F.cid = @cid AND C.instructorId = @instId
END

GO

CREATE PROC calculateFinalGrade
@cid int , @sid int , @insId int
AS
BEGIN
	IF EXISTS(SELECT instId FROM InstructorTeachCourse WHERE cid = @cid AND instId = @insId)
	BEGIN
		DECLARE @finalgrade DECIMAL(10,2)
		SELECT @finalgrade = sum(SA.grade*A.weight) FROM StudentTakeAssignment SA INNER JOIN Assignment A ON A.cid = SA.cid AND A.number = SA.assignmentNumber
		WHERE SA.sid = @sid AND SA.cid = @cid
		UPDATE StudentTakeCourse
		SET grade = @finalgrade
		WHERE sid = @sid AND @cid = @cid
	END
END

GO

CREATE PROC InstructorIssueCertificateToStudent
@cid int , @sid int , @insId int, @issueDate datetime
AS
BEGIN
	IF EXISTS(SELECT instId FROM InstructorTeachCourse WHERE cid = @cid AND instId = @insId)
	BEGIN
		INSERT INTO StudentCertifyCourse VALUES(@sid,@cid,@issueDate)
	END
END

--5

GO
CREATE PROC addFeedback
@comment VARCHAR(100), @cid INT, @sid INT
AS
BEGIN
    DECLARE @number INT
	SELECT @number =  MAX(number) 
    FROM Feedback
	WHERE @cid = cid

    SET @number = ISNULL(@number + 1, 1)
    INSERT INTO Feedback VALUES(@cid,@number,@comment,0,@sid)
END

GO 
CREATE PROC rateInstructor
@rate DECIMAL (2,1), @sid INT, @insid INT
AS
BEGIN
    INSERT INTO StudentRateInstructor VALUES(@sid, @insid, @rate)
END


GO

CREATE PROC viewCertificate
@cid INT, @sid INT
AS
BEGIN
	SELECT *
	FROM StudentCertifyCourse
	WHERE @cid = cid AND @sid = sid
END


GO

CREATE PROC viewMyProfile
	@id int
AS
BEGIN
	SELECT * FROM Student s inner join Users u
	on s.id = u.id
	WHERE s.id = @id
END

GO
CREATE PROC editMyProfile
	@id int, @firstName varchar(10), @lastName varchar(10), @password varchar(10), @gender binary, 
	@email varchar(10), @address varchar(10)
AS
BEGIN
	UPDATE Users
	SET firstname = ISNULL(@firstname, firstName), lastname = ISNULL(@lastname, lastName), password = ISNULL(@password, password), gender = ISNULL(@gender,gender), email = ISNULL(@email, email), address = ISNULL(@address, address)
	WHERE id = @id;
END

GO
CREATE PROC availableCourses
AS
BEGIN
	SELECT name, creditHours, price FROM Course
	WHERE accepted = 1;
END

GO
CREATE PROC courseInformation
	@id int
AS
BEGIN
	SELECT c.*, u.firstName, u.lastName
	FROM Course c inner join Users u
	on u.id = c.instructorId
	WHERE c.id = @id
END

GO
CREATE PROC EnrollInCourse
	@sid INT, @cid INT, @instr int
AS
BEGIN
	IF EXISTS(SELECT * FROM InstructorTeachCourse WHERE @instr = instId AND @cid = cid)
	BEGIN
		INSERT INTO StudentTakeCourse VALUES(@sid, @cid, @instr,0 , 0);
	END
END

GO
CREATE PROC addCreditCard
	@sid int, @number varchar(15), @cardHolderName varchar(16), @expiryDate datetime, @cvv varchar(3)
AS
BEGIN
	IF EXISTS (SELECT id FROM Users WHERE Users.id = @sid) -- This is just because I don't know why they would require the sid
	BEGIN
		INSERT INTO CreditCard VALUES(@number, @cardHolderName, @expiryDate, @cvv);
	END
END

GO
CREATE PROC viewPromoCode
	@sid int
AS
BEGIN
	SELECT code FROM StudentHasPromocode
	WHERE StudentHasPromocode.sid = @sid;
END

GO
CREATE PROC payCourse
	@cid INT, @sid INT
AS
BEGIN
	UPDATE StudentTakeCourse
	SET StudentTakeCourse.payedFor = 1
	WHERE sid = @sid AND cid = @cid;
END

GO
CREATE PROC enrollInCourseViewContent
	@id int, @cid int
AS
BEGIN
	IF EXISTS (SELECT sid FROM StudentTakeCourse WHERE sid = @id)
	BEGIN
		SELECT id, creditHours, name, courseDescription, price, content
		FROM Course
		WHERE Course.id = @cid;
	END
END

GO

CREATE PROC viewAssign
@courseId INT, @sid VARCHAR(10)
AS
BEGIN
	SELECT a.*
	FROM StudentTakeCourse sa inner join Assignment a
	on sa.cid = a.cid
	WHERE @courseId = sa.cid AND @sid = sid
END


GO
CREATE PROC submitAssign
	@assignType VARCHAR(10), @assignnumber int, @sid INT, @cid INT
AS
BEGIN
	INSERT INTO StudentTakeAssignment VALUES(@sid, @cid, @assignnumber, @assignType,0.00);
END


GO
CREATE PROC viewAssignGrades
	@assignnumber int, @assignType VARCHAR(10), @cid INT, @sid INT, @assignGrade INT OUTPUT
AS
BEGIN
	SELECT grade = @assignGrade
	FROM StudentTakeAssignment SA INNER JOIN Assignment A 
	ON SA.assignmentNumber = A.number AND SA.cid = A.cid
	WHERE assignmentNumber = @assignnumber AND A.type = @assignType AND SA.cid = @cid AND SA.sid = @sid
END

GO
CREATE PROC viewFinalGrade
	@cid INT, @sid INT
AS
BEGIN
	SELECT grade FROM StudentTakeCourse WHERE sid = @sid AND cid = @cid;
END

-- Destruction Labs

EXEC selfDestruct;
EXEC nukeProcedures;

-- The Following is for veteran destruction lab guys. Excersice Caution!
DROP PROCEDURE selfDestruct;
DROP PROCEDURE nukeProcedures;

GO
CREATE PROC selfDestruct
AS
BEGIN
	EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
	EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
	EXEC sp_msforeachtable @command1 = "DROP TRIGGER ?"

SELECT 'DROP PROCEDURE [' + SCHEMA_NAME(p.schema_id) + '].[' + p.NAME + '];'
FROM sys.procedures p
END

GO
CREATE PROC nukeProcedures
AS
BEGIN
DROP PROCEDURE [dbo].[AdminListAllStudents];
DROP PROCEDURE [dbo].[AdminViewStudentProfile];
DROP PROCEDURE [dbo].[AdminIssuePromocodeToStudent];
DROP PROCEDURE [dbo].[InstAddCourse];
DROP PROCEDURE [dbo].[UpdateCourseContent];
DROP PROCEDURE [dbo].[UpdateCourseDescription];
DROP PROCEDURE [dbo].[AddAnotherInstructorToCourse];
DROP PROCEDURE [dbo].[InstructorViewAcceptedCoursesByAdmin];
DROP PROCEDURE [dbo].[DefineCoursePrerequisites];
DROP PROCEDURE [dbo].[DefineAssignmentOfCourseOfCertianType];
DROP PROCEDURE [dbo].[updateInstructorRate];
DROP PROCEDURE [dbo].[InstructorViewAssignmentsStudents];
DROP PROCEDURE [dbo].[InstructorgradeAssignmentOfAStudent];
DROP PROCEDURE [dbo].[DefineAssignmentOfCourseOfCertainType];
DROP PROCEDURE [dbo].[ViewInstructorProfile];
DROP PROCEDURE [dbo].[ViewFeedbacksAddedByStudentsOnMyCourse];
DROP PROCEDURE [dbo].[calculateFinalGrade];
DROP PROCEDURE [dbo].[InstructorIssueCertificateToStudent];
DROP PROCEDURE [dbo].[addFeedback];
DROP PROCEDURE [dbo].[rateInstructor];
DROP PROCEDURE [dbo].[viewCertificate];
DROP PROCEDURE [dbo].[viewMyProfile];
DROP PROCEDURE [dbo].[editMyProfile];
DROP PROCEDURE [dbo].[availableCourses];
DROP PROCEDURE [dbo].[courseInformation];
DROP PROCEDURE [dbo].[EnrollInCourse];
DROP PROCEDURE [dbo].[addCreditCard];
DROP PROCEDURE [dbo].[viewPromoCode];
DROP PROCEDURE [dbo].[payCourse];
DROP PROCEDURE [dbo].[enrollInCourseViewContent];
DROP PROCEDURE [DBO].[viewAssign];
DROP PROCEDURE [dbo].[submitAssign];
DROP PROCEDURE [dbo].[viewAssignGrades];
DROP PROCEDURE [dbo].[viewFinalGrade];
DROP PROCEDURE [dbo].[studentRegister];
DROP PROCEDURE [dbo].[instructorRegister];
DROP PROCEDURE [dbo].[userLogin];
DROP PROCEDURE [dbo].[addMobile];
DROP PROCEDURE [dbo].[AdminListInstr];
DROP PROCEDURE [dbo].[AdminViewInstructorProfile];
DROP PROCEDURE [dbo].[AdminViewAllCourses];
DROP PROCEDURE [dbo].[AdminViewNonAcceptedCourses];
DROP PROCEDURE [dbo].[AdminViewCourseDetails];
DROP PROCEDURE [dbo].[AdminAcceptRejectCourse];
DROP PROCEDURE [dbo].[AdminCreatePromoCode];
END



--testing zone

--register
exec studentRegister @first_name = merna, @last_name = michel, @password = 'merna', @email = 'm@mail.com',
@gender = 1, @address = 'nasr city'

exec InstructorRegister 'Rana', 'Magdy', 'rana', 'rana@mail.com', 1,'Cairo'
exec InstructorRegister 'Raneen', 'Magd', 'raneen', 'raneen@mail.com', 1,'Cairo'

INSERT INTO Users VALUES('AdminMan','Adminson','333',0, 'adminson@adminson.admoona','cairo')
INSERT INTO Admin VALUES(3)

SELECT * FROM Users
SELECT * FROM Student
SELECT * FROM Instructor
--login
Declare @succ bit, @type int
exec userLogin 1, 'merna' , @succ output, @type output
print 'Success:'
print @succ
print 'Type:'
print @type

exec addMobile 1, '111111'
SELECT * FROM UserMobileNumber

--admin
exec AdminListInstr

exec AdminViewInstructorProfile 2

--add course
exec InstAddCourse 2,'DB',100,2
exec InstAddCourse 4,'DB2',100,4



SELECT * FROM Users
SELECT * FROM Course
SELECT * FROM InstructorTeachCourse
SELECT * FROM Admin
Select * FROM Promocode
Select * FROM StudentTakeCourse

exec AdminViewAllCourses

exec AdminViewNonAcceptedCourses

exec AdminViewCourseDetails 2

exec AdminAcceptRejectCourse 3,1

exec AdminCreatePromocode 'G101', '1/1/2019', '1/1/2020', 10,3

exec AdminListAllStudents

exec AdminViewStudentProfile 1

exec AdminIssuePromocodeToStudent 1,'G101'

--Instructor

exec UpdateCourseContent 2,1,'intranet.guc.edu.eg/db1'

exec UpdateCourseDescription 2,1,'DB1'

exec AddAnotherInstructorToCourse 4,1,2

exec InstructorViewAcceptedCoursesByAdmin 2

exec DefineCoursePrerequisites 2,1

exec ViewInstructorProfile 2

exec UpdateInstructorRate 2

exec InstructorViewAssignmentsStudents 2,1

exec ViewFeedbacksAddedByStudentsOnMyCourse 2,1

exec InstructorGradeAssignmentOfAStudent 2,1,1,1,'quiz',10

exec calculateFinalGrade 1,1,2

exec InstructorIssueCertificateToStudent 1,1,2,'10/29/2020'

SELECT * FROM StudentCertifyCourse




exec DefineAssignmentOfCourseOfCertainType 2, 1, 1, 'quiz', 10, 2, '12/12/2020', 'question1'

SELECT * FROM Course
SELECT * FROM InstructorTeachCourse
SELECT * FROM CoursePrerequisiteCourse
SELECT * FROM Assignment
SELECT * FROM Feedback

--student
exec viewMyProfile 1

exec editMyProfile 1,null,null,null,null,null,'york'

--test with accepted course
exec availableCourses

exec courseInformation 2

exec enrollInCourse 1, 1, 2
Select * From StudentTakeCourse

exec addCreditCard 1, 123334111111111, 'Merna', '2/10/2019', '123' 

exec viewPromocode 1 

exec payCourse 1, 1

exec enrollInCourseViewContent 1, 1

exec addFeedback 'nice',2,1

exec viewAssign 1, 1 --test when assignments are added

exec submitAssign 'quiz', 1, 1, 1
SELECT * FROM StudentTakeAssignment

DECLARE @grade INT 
exec viewAssignGrades 1, 'quiz', 1, 1, @grade output
print @grade

exec viewFinalGrade 1, 1

exec addFeedback 'good',1,1

exec rateInstructor 2,1,2

exec viewCertificate 1,1

SELECT * FROM StudentRateInstructor
SELECT * FROM Feedback