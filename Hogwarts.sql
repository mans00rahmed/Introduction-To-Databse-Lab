CREATE TABLE WhizardingSchool(
    SchoolID NUMBER(5) NOT NULL,
    SchoolName VARCHAR2(15) NOT NULL,
    CurrentHead VARCHAR2(15) NOT NULL,
    DeputyHead VARCHAR2(15) NOT NULL,
    Region VARCHAR2(13) NOT NULL,

CONSTRAINT PkSchool PRIMARY KEY(SchoolID)
)
/

CREATE TABLE Books(
    ISBN NUMBER(5) NOT NULL,
    Author VARCHAR2(15) NOT NULL,
    PublishedBy VARCHAR2(15) NOT NULL,
    PublishedDate Date NOT NULL,

CONSTRAINT PkBook PRIMARY KEY(ISBN)
)
/

CREATE TABLE Characters(
    CharID NUMBER(5) NOT NULL,
    CharName VARCHAR2(25) Not Null,

CONSTRAINT PkCharacter PRIMARY KEY(CharID)
)
/

Create table Enrollment
(StdID Number Not Null,
CourseID Number Not Null,
Constraint FEnKStudent Foreign Key (StdID) References Student(StdID),
Constraint FEnKCourse Foreign Key (CourseID) References Course(CourseID)
)
/

CREATE TABLE Appearance(
    ISBN NUMBER(5) NOT NULL,
    CharID NUMBER(5) NOT NULL,

    CONSTRAINT ISBN  FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    CONSTRAINT CharID FOREIGN KEY (CharID) REFERENCES Characters(CharID)
)
/
CREATE TABLE Student(
    StdId NUMBER(5) NOT NULL,
    StdName VARCHAR2(15) NOT NULL,
    CharID NUMBER(15) NOT NULL,
    SchoolID NUMBER(15) NOT NULL,
    Year NUMBER NOT NULL,

CONSTRAINT PkStudent PRIMARY KEY(StdId),
CONSTRAINT CharIDFk FOREIGN KEY (CharID) REFERENCES Characters(CharID),
CONSTRAINT SchoolIDFk FOREIGN KEY (SchoolID) REFERENCES WhizardingSchool(SchoolID)
)
/
CREATE TABLE Course(
    CourseId NUMBER(5) NOT NULL,
    CourseName VARCHAR2(15) NOT NULL,
    CDHr NUMBER(15) NOT NULL,
CONSTRAINT PkCourse PRIMARY KEY(CourseId)
)
/
CREATE TABLE Grades(
    StdId NUMBER(5) NOT NULL,
    CourseId NUMBER(5) NOT NULL,
    Grade VARCHAR2(12) NOT NULL,
    SchoolID NUMBER(15) NOT NULL,
    Year NUMBER NOT NULL,

CONSTRAINT StdIdFk FOREIGN KEY (StdId) REFERENCES Student(StdId),
CONSTRAINT CourseIDFk FOREIGN KEY (CourseId) REFERENCES Course(CourseId),
CONSTRAINT GradeObt CHECK(Grade IN('O','E','P','A','D','T'))
)
/

CREATE TABLE Student(
    StdId NUMBER(5) NOT NULL,
    StdName VARCHAR2(15) NOT NULL,
    CharID NUMBER(15) NOT NULL,
    SchoolID NUMBER(15) NOT NULL,
    Year NUMBER NOT NULL,

CONSTRAINT PkStudent PRIMARY KEY(StdId),
CONSTRAINT CharIDFk FOREIGN KEY (CharID) REFERENCES Characters(CharID),
CONSTRAINT SchoolIDFk FOREIGN KEY (SchoolID) REFERENCES WhizardingSchool(SchoolID)
)
/

CREATE TABLE Professor(
    ProfId NUMBER(5) NOT NULL,
    ProfName VARCHAR2(15) NOT NULL,
    CharID NUMBER(15) NOT NULL,
    CourseId NUMBER(5) NOT NULL,


CONSTRAINT ProfessorID PRIMARY KEY(ProfId),
CONSTRAINT ProfCharIDFk FOREIGN KEY (CharID) REFERENCES Characters(CharID),
CONSTRAINT ProfCourseIDFk FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
)
/

CREATE TABLE Minister(
    MinisterId NUMBER(5) NOT NULL,
    MinisterName VARCHAR2(15) NOT NULL,
    Hiredate Date NOT NULL,


CONSTRAINT MinisterID PRIMARY KEY(MinisterId)
)
/

CREATE TABLE LEVAL(
    LevalId NUMBER(5) NOT NULL,
    LevalName VARCHAR2(15) NOT NULL,
    MinisterId NUMBER(5) NOT NULL,

CONSTRAINT LevalId PRIMARY KEY(LevalId),
CONSTRAINT MinisterIDFk FOREIGN KEY (MinisterId) REFERENCES Minister(MinisterId)
)
/

CREATE TABLE OfficeIncharge(
    InchargeId NUMBER(5) NOT NULL,
    InchargeName VARCHAR2(15) NOT NULL,
    Hiredate Date NOT NULL,


CONSTRAINT IChagrgeID PRIMARY KEY(InchargeId)
)
/


CREATE TABLE EmployeeMinistry(
    EmployeeID NUMBER(5) NOT NULL,
    EmployeeName VARCHAR2(15) NOT NULL,
    Age NUMBER(15) NOT NULL,
    Job NUMBER(15) NOT NULL,
    CharID NUMBER(15) NOT NULL,
    StdId NUMBER(5) NOT NULL,


CONSTRAINT PkEmployee PRIMARY KEY(EmployeeID),
CONSTRAINT EmpCharIDFk FOREIGN KEY (CharID) REFERENCES Characters(CharID),
CONSTRAINT EmpStdIDFk FOREIGN KEY (StdId) REFERENCES Student(StdId)
)
/

CREATE TABLE Office(
    OfficeID NUMBER(5) NOT NULL,
    OfficeName VARCHAR2(15) NOT NULL,
    EmployeeID NUMBER(5) NOT NULL,
    LevalId NUMBER(5) NOT NULL,
    InchargeId NUMBER(5) NOT NULL,

CONSTRAINT PkOffice PRIMARY KEY(OfficeID),
CONSTRAINT OfficeLeval FOREIGN KEY (LevalID) REFERENCES LEVAL(LevalID),
CONSTRAINT InchargeOffice FOREIGN KEY (InchargeId) REFERENCES OfficeIncharge(InchargeId)
)
/

CREATE TABLE Examminer(
    ExamminerID NUMBER(5) NOT NULL,
    ExamminerName VARCHAR2(15) NOT NULL,
    CharID NUMBER(5) NOT NULL,
    LevalId NUMBER(5) NOT NULL,
    
CONSTRAINT PkExamminer PRIMARY KEY(ExamminerID),
CONSTRAINT ExamminerLeval FOREIGN KEY (LevalID) REFERENCES LEVAL(LevalID),
CONSTRAINT Examminerchar FOREIGN KEY (CharID) REFERENCES Characters(CharID)
)
/

Create Table OWLExam(
    ExamminerID Number Not Null,
    CourseID Number Not Null,
    Slot Number(2) Not Null,
    Nature Varchar2(20) Not Null,

Constraint FOKExaminer Foreign Key (ExamminerID) References Examminer(ExamminerID),
Constraint FOKCourse Foreign Key (CourseID) References Course(CourseID),
Constraint Slotted Check ((Slot Between 1 And 19)),
Constraint OwlsExamNature Check ((Nature In('Theory','Practical','Theory&Practical') ))
)
/