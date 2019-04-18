declare @newdb sysname
set @newdb = 'CuedInDB'
exec('create database ' + @newdb)
ALTER DATABASE [CuedInDB] SET AUTO_CLOSE OFF;
GO

CREATE PROCEDURE createDB

AS
DECLARE @triggerNewApplicationNotification varchar(MAX);
DECLARE @triggerAhmeddeadline varchar(MAX);





CREATE TABLE [CuedInDB].[dbo].[School](
    [SchoolID] [int] identity(0,1) NOT NULL,
    [SchoolName] [varchar](50) NOT NULL,
    [ContactEmail] [varchar](50) NOT NULL,
    [SchoolPhoneNumber] [varchar](50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
    [SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [CuedInDB].[dbo].[CareerCluster](
    [CareerCluster] [varchar](50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CareerCluster_1] PRIMARY KEY CLUSTERED 
(
    [CareerCluster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [CuedInDB].[dbo].[Organization](
    [OrganizationID] [int] identity(0,1) NOT NULL,
    [OrganizationName] [varchar](50) NOT NULL,
    [OrganizationType] [varchar](50) NOT NULL,
    [CareerCluster] [varchar](50) NOT NULL,
    [PhoneNumber] [varchar](50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
    [OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_CareerCluster] FOREIGN KEY([CareerCluster])
REFERENCES [CuedInDB].[dbo].[CareerCluster] ([CareerCluster])

CREATE TABLE [CuedInDB].[dbo].[Event](
    [EventID] [int] identity(0,1) NOT NULL,
    [SchoolID] [int] NOT NULL,
    [Date] [datetime] NOT NULL,
    [EventType] [varchar](50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
    [EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_School] FOREIGN KEY([SchoolID])
REFERENCES [CuedInDB].[dbo].[School] ([SchoolID])

ALTER TABLE [CuedInDB].[dbo].[Event] CHECK CONSTRAINT [FK_Event_School]

CREATE TABLE [CuedInDB].[dbo].[Student](
    [StudentID] [int] identity(0,1) NOT NULL,
    [SchoolID] [int] NOT NULL,
    [FirstName] [varchar](50) NOT NULL,
    [LastName] [varchar](50) NOT NULL,
    [MiddleName] [varchar](50) NULL,
    [Age] [int] NOT NULL,
    [GradeLevel] [int] NOT NULL,
    [Email] [varchar](50) NOT NULL,
    [AbleToWork] [varchar] (3) NULL,
    [OneTimePass] [varchar](50) NULL,
    [CounselorEmail] [varchar](50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
    [StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_School] FOREIGN KEY([SchoolID])
REFERENCES [CuedInDB].[dbo].[School] ([SchoolID])

ALTER TABLE [CuedInDB].[dbo].[Student] CHECK CONSTRAINT [FK_Student_School]

CREATE TABLE [CuedInDB].[dbo].[OrganizationVerification](
    [SchoolID] [int] NOT NULL,
    [OrganizationID] [int] NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
    PRIMARY KEY(SchoolID, OrganizationID)
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[OrganizationVerification]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationVerification_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [CuedInDB].[dbo].[Organization] ([OrganizationID])

ALTER TABLE [CuedInDB].[dbo].[OrganizationVerification] CHECK CONSTRAINT [FK_OrganizationVerification_Organization]

ALTER TABLE [CuedInDB].[dbo].[OrganizationVerification]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationVerification_School] FOREIGN KEY([SchoolID])
REFERENCES [CuedInDB].[dbo].[School] ([SchoolID])

ALTER TABLE [CuedInDB].[dbo].[OrganizationVerification] CHECK CONSTRAINT [FK_OrganizationVerification_School]

CREATE TABLE [CuedInDB].[dbo].[CareerInterests](
    [CareerCluster] [varchar](50) NOT NULL,
    [StudentID] [int] NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
    PRIMARY KEY(CareerCluster, StudentID)
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[CareerInterests]  WITH CHECK ADD  CONSTRAINT [FK_CareerInterests_CareerCluster] FOREIGN KEY([CareerCluster])
REFERENCES [CuedInDB].[dbo].[CareerCluster] ([CareerCluster])

ALTER TABLE [CuedInDB].[dbo].[CareerInterests] CHECK CONSTRAINT [FK_CareerInterests_CareerCluster]

ALTER TABLE [CuedInDB].[dbo].[CareerInterests]  WITH CHECK ADD  CONSTRAINT [FK_CareerInterests_Student] FOREIGN KEY([StudentID])
REFERENCES [CuedInDB].[dbo].[Student] ([StudentID])

ALTER TABLE [CuedInDB].[dbo].[CareerInterests] CHECK CONSTRAINT [FK_CareerInterests_Student]

CREATE TABLE [CuedInDB].[dbo].[OrganizationAttendance](
    [EventID] [int] NOT NULL,
    [OrganizationID] [int] NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
    PRIMARY KEY(EventID, OrganizationID)
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[OrganizationAttendance]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAttendance_Event] FOREIGN KEY([EventID])
REFERENCES [CuedInDB].[dbo].[Event] ([EventID])

ALTER TABLE [CuedInDB].[dbo].[OrganizationAttendance] CHECK CONSTRAINT [FK_OrganizationAttendance_Event]

ALTER TABLE [CuedInDB].[dbo].[OrganizationAttendance]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAttendance_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [CuedInDB].[dbo].[Organization] ([OrganizationID])

ALTER TABLE [CuedInDB].[dbo].[OrganizationAttendance] CHECK CONSTRAINT [FK_OrganizationAttendance_Organization]

CREATE TABLE [CuedInDB].[dbo].[Job](
    [JobID] [int] identity(0,1) NOT NULL,
    [OrganizationID] [int] NOT NULL,
    [JobTitle] [varchar](50) NOT NULL,
    [Pay] [money] NOT NULL,
    [PayType] [varchar](10)NOT NULL, 
    [MinimumAge] [int] NULL,
    [JobType] [varchar](50) NOT NULL,
    [JobDescription] [varchar](500) NOT NULL,
    [Deadline] [datetime] NULL,
    [ApplicationType] [varchar](300) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
    [CareerCluster] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
    [JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [CuedInDB].[dbo].[Organization] ([OrganizationID])

ALTER TABLE [CuedInDB].[dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_CareerCluster] FOREIGN KEY([CareerCluster])
REFERENCES [CuedInDB].[dbo].[CareerCluster] ([CareerCluster])

ALTER TABLE [CuedInDB].[dbo].[Job] CHECK CONSTRAINT [FK_Job_Organization]

CREATE TABLE [CuedInDB].[dbo].[Application](
    [ApplicationID] [int] identity(0,1) NOT NULL,
    [StudentID] [int] NOT NULL,
    [JobID] [int] NOT NULL,
    [Status] [varchar](50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
    [ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Job] FOREIGN KEY([JobID])
REFERENCES [CuedInDB].[dbo].[Job] ([JobID])

ALTER TABLE [CuedInDB].[dbo].[Application] CHECK CONSTRAINT [FK_Application_Job]

ALTER TABLE [CuedInDB].[dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Student] FOREIGN KEY([StudentID])
REFERENCES [CuedInDB].[dbo].[Student] ([StudentID])

ALTER TABLE [CuedInDB].[dbo].[Application] CHECK CONSTRAINT [FK_Application_Student]

CREATE TABLE [CuedInDB].[dbo].[Scholarship](
    [ScholarshipID] [int] IDENTITY(0,1) NOT NULL,
    [OrganizationID] [int] NOT NULL,
    [Amount] [money] NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
    [Title] [varchar](50) NULL,
    [Sponsor] [varchar](50) NULL,
    [Email] [varchar](50) NULL,
    [Description] [varchar](200) NULL,
    [Deadline] [date] NULL,
 CONSTRAINT [PK_Scholarship] PRIMARY KEY CLUSTERED 
(
    [ScholarshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [CuedInDB].[dbo].[Scholarship]  WITH CHECK ADD  CONSTRAINT [FK_Scholarship_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [CuedInDB].[dbo].[Organization] ([OrganizationID])

ALTER TABLE [CuedInDB].[dbo].[Scholarship] CHECK CONSTRAINT [FK_Scholarship_Organization]

CREATE TABLE [CuedInDB].[dbo].[OrganizationUser](
    Username VARCHAR(50)Primary Key  NOT NULL,
    Password VARCHAR(256) NOT NULL,
    EmailAddress VARCHAR(50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
    OneTimePasscode [int] NULL,
    Notifications [varchar](30) NOT NULL,
    OrganizationID int NOT NULL)
ALTER TABLE [CuedInDB].[dbo].[OrganizationUser]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationUser_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [CuedInDB].[dbo].[Organization] ([OrganizationID])

CREATE TABLE [CuedInDB].[dbo].[StudentAttributes](
    Attribute VARCHAR(50)Primary Key  NOT NULL)


--QuickApplyJobAttributes
CREATE TABLE [CuedInDB].[dbo].[QuickApplyJobAttributes](
    QuickApplyID int Primary Key NOT NULL Identity,
StudentAttribute VARCHAR(50) NOT NULL,
    JobID int NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL)

ALTER TABLE [CuedInDB].[dbo].[QuickApplyJobAttributes]  WITH CHECK ADD  CONSTRAINT [FK_QuickApplyJobAttributes_StudentAttributes] FOREIGN KEY([StudentAttribute])
REFERENCES [CuedInDB].[dbo].[StudentAttributes] ([Attribute])

ALTER TABLE [CuedInDB].[dbo].[QuickApplyJobAttributes]  WITH CHECK ADD  CONSTRAINT [FK_QuickApplyJobAttributes_Job] FOREIGN KEY([JobID])
REFERENCES [CuedInDB].[dbo].[Job] ([JobID])

CREATE TABLE [CuedInDB].[dbo].[Files](
    FileID int Primary Key NOT NULL Identity,
    FileName varchar(50) NOT NULL,
    FileType nvarchar(200) NOT NULL,
    Data varbinary(MAX) NOT NULL,
    UploadType varchar(50) NOT NULL,
    [LastUpdated] [datetime] NOT NULL,
    [LastUpdatedBy] [varchar](50) NOT NULL,
    StudentID int NOT NULL)
ALTER TABLE [CuedInDB].[dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Student] FOREIGN KEY([StudentID])
REFERENCES [CuedInDB].[dbo].[Student] ([StudentID])

CREATE TABLE [CuedInDB].[dbo].[Notification](
    NotificationID int Primary Key NOT NULL Identity,
    Header varchar(50) NOT NULL,
    Content varchar(200) NOT NULL,
    IsReceived char(1) NOT NULL,
    [SendDate] [datetime] NOT NULL,
    Username varchar(50) NOT NULL)
ALTER TABLE [CuedInDB].[dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_OrganizationUser] FOREIGN KEY([Username])
REFERENCES [CuedInDB].[dbo].[OrganizationUser] ([Username])

INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Agriculture, Food, and Natural Resources', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Architecture and Construction', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Arts, Audio, Video Technology, and Communications', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Business Management and Administration', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Education and Training', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Finance', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Government and Public Administration', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Health Science', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Hospitality and Tourism', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Human Services', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Information Technology', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Law, Public Safety, Corrections, and Security', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Manufacturing', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Marketing', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Science, Technology, Engineering, and Mathematics', GETDATE(), 'ACME GROUP')
INSERT INTO [CuedInDB].[dbo].[CareerCluster] VALUES('Transportation, Distribution, and Logistics', GETDATE(), 'ACME GROUP')

INSERT INTO [CuedInDB].[dbo].[School] VALUES('Harrisonburg High School', 'dflick@harrisonburg.k12.va.us', '5404332651', GETDATE(), 'ACME GROUP');


INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('Name');
INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('Age');
INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('Grade Level');
INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('Email');
INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('Resume');
INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('Transcript');
INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('US Work Eligibility');
INSERT INTO [CuedInDB].[dbo].[StudentAttributes] VALUES('Counselor Email');

-- =============================================
-- Author:        <Eric, Savior of Acme Group>
-- Create date: <MMXIX in the year of our Lord>
-- Description:    <Eric Blesses the system with notification functionality>
-- =============================================

SET @triggerNewApplicationNotification =
'USE [CuedInDB]
GO
CREATE TRIGGER newApplicationNotification
   ON  [CuedInDB].[dbo].[Application] 
   AFTER INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

DECLARE @AppID int = IDENT_CURRENT(''Application'');--(Select ApplicationID from inserted);----(SELECT MAX(Application.ApplicationID) from Application);
DECLARE @OrgID int = (SELECT Job.OrganizationID FROM Application INNER JOIN Job ON Application.JobID = Job.JobID WHERE Application.ApplicationID = @AppID);
DECLARE @MyCursor CURSOR;
DECLARE @MyField varchar(50);
DECLARE @Message varchar (200);
SET @Message = ''Someone has applied to your job posting: '' + Cast((Select job.JobTitle from job where job.JobID = (Select Application.JobID from Application where ApplicationID = @AppID)) as Varchar(5)) + ''\n\nApplication Number: '' + Cast(@AppID as varchar(5));
BEGIN
    SET @MyCursor = CURSOR FOR
    select top 1000 Username from dbo.OrganizationUser
        where OrganizationID = @OrgID      

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @MyField

    WHILE @@FETCH_STATUS = 0
    BEGIN
      /*
         YOUR ALGORITHM GOES HERE   
      */
      INSERT INTO dbo.Notification VALUES(''You have a new application!'', @Message, ''N'', GETDATE(), @MyField);
      --

      FETCH NEXT FROM @MyCursor 
      INTO @MyField 
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;

END'

SET @triggerAhmeddeadline =
'USE [CuedInDB]
GO
CREATE TRIGGER [ahmeddeadline] ON [CuedInDB].[dbo].[Job]
After UPDATE 
AS
IF
( UPDATE (Deadline)) 
BEGIN
SET NOCOUNT ON -- added to prevent extra result sets from interfering with SELECT statements
DECLARE 
@id int,
@dl datetime
Select @id =(select jobid from inserted)
SELECT @dl =(select Deadline from inserted)
if(@dl like ''%1900%'')
UPDATE [CuedInDB].[dbo].[Job]
SET Deadline = null WHERE jobid = @id
END'

EXECUTE(@triggerAhmeddeadline);
EXECUTE(@triggerNewApplicationNotification);




INSERT [CuedInDB].[dbo].[Event] ([SchoolID], [Date], [EventType], [LastUpdated], [LastUpdatedBy]) VALUES (0, CAST(N'2019-04-24T00:00:00.000' AS DateTime), N'Presentation', CAST(N'2019-04-17T21:43:34.707' AS DateTime), N'CUED-IN')


INSERT [CuedInDB].[dbo].[Student] ([SchoolID], [FirstName], [LastName], [MiddleName], [Age], [GradeLevel], [Email], [AbleToWork], [OneTimePass], [CounselorEmail], [LastUpdated], [LastUpdatedBy]) VALUES (0, N'manfredo', N'l', N'i', 22, 5, N'stu1@stu.edu', N'Yes', NULL, N'stu@stu.edu', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[Student] ([SchoolID], [FirstName], [LastName], [MiddleName], [Age], [GradeLevel], [Email], [AbleToWork], [OneTimePass], [CounselorEmail], [LastUpdated], [LastUpdatedBy]) VALUES (0, N'Manfred', N'Hueskes', N'', 34, 12, N'hueskes@cox.net', N'Yes', NULL, N'mhueskes@yahoo.com', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[Student] ([SchoolID], [FirstName], [LastName], [MiddleName], [Age], [GradeLevel], [Email], [AbleToWork], [OneTimePass], [CounselorEmail], [LastUpdated], [LastUpdatedBy]) VALUES (0, N'Nina', N'Duong', N'', 23, 12, N'nina@gmail.com', N'Yes', NULL, N'nina@gmail.com', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[Student] ([SchoolID], [FirstName], [LastName], [MiddleName], [Age], [GradeLevel], [Email], [AbleToWork], [OneTimePass], [CounselorEmail], [LastUpdated], [LastUpdatedBy]) VALUES (0, N'Manfred', N'Hueskes', N'X', 12, 5, N'manfred@yahoo.com', N'Yes', NULL, N'chris@yahoo.com', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[Student] ([SchoolID], [FirstName], [LastName], [MiddleName], [Age], [GradeLevel], [Email], [AbleToWork], [OneTimePass], [CounselorEmail], [LastUpdated], [LastUpdatedBy]) VALUES (0, N'Eric', N'Ericson', N'G', 17, 11, N'eric@gmail.com', N'No', NULL, N'alex@gmail.com', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'ACME GROUP')


INSERT [CuedInDB].[dbo].[Organization] ([OrganizationName], [OrganizationType], [CareerCluster], [PhoneNumber], [LastUpdated], [LastUpdatedBy]) VALUES (N'Acme Group', N'Profit', N'Information Technology', N'5718350190', CAST(N'2019-04-18T01:36:01.363' AS DateTime), N'TestUser')
INSERT [CuedInDB].[dbo].[Organization] ([OrganizationName], [OrganizationType], [CareerCluster], [PhoneNumber], [LastUpdated], [LastUpdatedBy]) VALUES (N'Apex Technology', N' Profit', N'Science, Technology, Engineering, and Mathematics', N'1211211212', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'TestUser')
INSERT [CuedInDB].[dbo].[Organization] ([OrganizationName], [OrganizationType], [CareerCluster], [PhoneNumber], [LastUpdated], [LastUpdatedBy]) VALUES (N'JMU', N' Profit', N'Education and Training', N'5405683555', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'TestUser')
INSERT [CuedInDB].[dbo].[Organization] ([OrganizationName], [OrganizationType], [CareerCluster], [PhoneNumber], [LastUpdated], [LastUpdatedBy]) VALUES (N'Jack Brown', N' Profit', N'Agriculture, Food, and Natural Resources', N'5405681999', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'TestUser')
INSERT [CuedInDB].[dbo].[Organization] ([OrganizationName], [OrganizationType], [CareerCluster], [PhoneNumber], [LastUpdated], [LastUpdatedBy]) VALUES (N'VT', N' Non-Profit', N'Business Management and Administration', N'5878936711', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'TestUser')
INSERT [CuedInDB].[dbo].[Organization] ([OrganizationName], [OrganizationType], [CareerCluster], [PhoneNumber], [LastUpdated], [LastUpdatedBy]) VALUES (N'Chiquitita', N' Profit', N'Arts, Audio, Video Technology, and Communications', N'2846618873', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'TestUser')

INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Architecture and Construction', 2, CAST(N'2019-04-18T03:37:12.883' AS DateTime), N'Acme Group')
INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Architecture and Construction', 3, CAST(N'2019-04-18T03:38:35.807' AS DateTime), N'Acme Group')
INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Arts, Audio, Video Technology, and Communications', 2, CAST(N'2019-04-18T03:37:12.890' AS DateTime), N'Acme Group')
INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Arts, Audio, Video Technology, and Communications', 3, CAST(N'2019-04-18T03:38:35.823' AS DateTime), N'Acme Group')
INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Business Management and Administration', 2, CAST(N'2019-04-18T03:37:12.900' AS DateTime), N'Acme Group')
INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Business Management and Administration', 4, CAST(N'2019-04-18T03:39:37.127' AS DateTime), N'Acme Group')
INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Health Science', 1, CAST(N'2019-04-18T02:48:24.337' AS DateTime), N'Acme Group')
INSERT [CuedInDB].[dbo].[CareerInterests] ([CareerCluster], [StudentID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Science, Technology, Engineering, and Mathematics', 1, CAST(N'2019-04-18T02:48:24.350' AS DateTime), N'Acme Group')


INSERT [CuedInDB].[dbo].[Job] ([OrganizationID], [JobTitle], [Pay], [PayType], [MinimumAge], [JobType], [JobDescription], [Deadline], [ApplicationType], [LastUpdated], [LastUpdatedBy], [CareerCluster]) VALUES (1, N'Test Job', 26000.0000, N'Per Hour', 16, N'Full-Time', N'This is a test.', CAST(N'2019-04-27T00:00:00.000' AS DateTime), N'www.yesboi.com', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'mhueskes', N'Architecture and Construction')
INSERT [CuedInDB].[dbo].[Job] ([OrganizationID], [JobTitle], [Pay], [PayType], [MinimumAge], [JobType], [JobDescription], [Deadline], [ApplicationType], [LastUpdated], [LastUpdatedBy], [CareerCluster]) VALUES (1, N'The Best Job', 26.0000, N'Per Hour', 21, N'Full-Time', N'Bestest Job', CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'Quick Apply', CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'mhueskes', N'Science, Technology, Engineering, and Mathematics')


INSERT [CuedInDB].[dbo].[Scholarship] ([OrganizationID], [Amount], [LastUpdated], [LastUpdatedBy], [Title], [Sponsor], [Email], [Description], [Deadline]) VALUES (1, 20000.0000, CAST(N'2019-04-17T21:33:10.907' AS DateTime), N'Peaches', N'Test', N'No current employer', N'hueskemh@dukes.jmu.edu', N'Testing', CAST(N'2019-04-18' AS Date))
INSERT [CuedInDB].[dbo].[OrganizationUser] ([Username], [Password], [EmailAddress], [LastUpdated], [LastUpdatedBy], [OneTimePasscode], [Notifications], OrganizationID) VALUES (N'duongdt', N'2000:OLQ6Ps0PnmZp+Az+0v8j9r5TmUw5LBa2:B1W1m4J7IUzhPyHQJ0DtpukNf+0=', N'duongdt@dukes.jmu.edu', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'Blueberry', 12345, N'Enabled',1)
INSERT [CuedInDB].[dbo].[OrganizationUser] ([Username], [Password], [EmailAddress], [LastUpdated], [LastUpdatedBy], [OneTimePasscode], [Notifications], OrganizationID) VALUES (N'jawad1', N'2000:tzqM2ClgFIhPhl77AkTqUILW1okksnKK:cXclVk/imRlWDC9HSKlch+boC5c=', N'jawad@dukes.jmu.edu', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'Blueberry', 12345, N'Enabled',2)
INSERT [CuedInDB].[dbo].[OrganizationUser] ([Username], [Password], [EmailAddress], [LastUpdated], [LastUpdatedBy], [OneTimePasscode], [Notifications], OrganizationID) VALUES (N'manfred', N'2000:84FjCZ8o0Y5iNXIrQNJUzHNkNk+2zDRz:fegmUk46s0jbFmhTiPitD0v/QZg=', N'duongdt@dukes.jmu.edu', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'Blueberry', 12345, N'Enabled',3)
INSERT [CuedInDB].[dbo].[OrganizationUser] ([Username], [Password], [EmailAddress], [LastUpdated], [LastUpdatedBy], [OneTimePasscode], [Notifications], OrganizationID) VALUES (N'Master', N'2000:xKl/q3GLZv5RxqgsLxJ8o/xMe8e6UlHi:H5C29BXJeUQ5NQLsK4fe+c5G07U=', N'mhueskes@yahoo.com', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'Blueberry', 12345, N'Disabled',0)
INSERT [CuedInDB].[dbo].[OrganizationUser] ([Username], [Password], [EmailAddress], [LastUpdated], [LastUpdatedBy], [OneTimePasscode], [Notifications], OrganizationID) VALUES (N'mhueskes', N'2000:J7irsC1YWb/gLpBDMFvbGUGTvk3JvDFm:GnX2n6ue5N1lF8DVtI41Yhc7rWw=', N'mhueskes@yahoo.com', CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'Blueberry', 12345, N'Enabled',4)


INSERT [CuedInDB].[dbo].[Application] ([StudentID], [JobID], [Status], [LastUpdated], [LastUpdatedBy]) VALUES (1, 1, N'Pending', CAST(N'2019-04-18T02:48:32.283' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[Application] ([StudentID], [JobID], [Status], [LastUpdated], [LastUpdatedBy]) VALUES (2, 0, N'Pending', CAST(N'2019-04-18T03:37:27.830' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[Application] ([StudentID], [JobID], [Status], [LastUpdated], [LastUpdatedBy]) VALUES (3, 1, N'Pending', CAST(N'2019-04-18T03:38:38.913' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[Application] ([StudentID], [JobID], [Status], [LastUpdated], [LastUpdatedBy]) VALUES (4, 0, N'Pending', CAST(N'2019-04-18T03:39:38.940' AS DateTime), N'ACME GROUP')


INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Age', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Counselor Email', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Email', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Grade Level', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Name', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Resume', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'Transcript', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')
INSERT [CuedInDB].[dbo].[QuickApplyJobAttributes] ([StudentAttribute], [JobID], [LastUpdated], [LastUpdatedBy]) VALUES (N'US Work Eligibility', 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'ACME GROUP')


INSERT [CuedInDB].[dbo].[Notification] ([Header], [Content], [IsReceived], [SendDate], [Username]) VALUES (N'You have a new application!', N'Someone has applied to your job posting: The B\n\nApplication Number: 0', N'Y', CAST(N'2019-04-18T02:48:32.300' AS DateTime), N'mhueskes')
INSERT [CuedInDB].[dbo].[Notification] ([Header], [Content], [IsReceived], [SendDate], [Username]) VALUES (N'You have a new application!', N'Someone has applied to your job posting: Test \n\nApplication Number: 1', N'N', CAST(N'2019-04-18T03:37:27.843' AS DateTime), N'mhueskes')
INSERT [CuedInDB].[dbo].[Notification] ([Header], [Content], [IsReceived], [SendDate], [Username]) VALUES (N'You have a new application!', N'Someone has applied to your job posting: The B\n\nApplication Number: 2', N'N', CAST(N'2019-04-18T03:38:38.913' AS DateTime), N'mhueskes')
INSERT [CuedInDB].[dbo].[Notification] ([Header], [Content], [IsReceived], [SendDate], [Username]) VALUES (N'You have a new application!', N'Someone has applied to your job posting: Test \n\nApplication Number: 3', N'N', CAST(N'2019-04-18T03:39:38.940' AS DateTime), N'mhueskes')



GO

--EXEC createDB





