USE [master]
GO
/****** Object:  Database [FAP_Fake]    Script Date: 6/14/2022 8:33:06 AM ******/
CREATE DATABASE [FAP_Fake]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FAP_Fake', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FAP_Fake.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FAP_Fake_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FAP_Fake_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FAP_Fake] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FAP_Fake].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FAP_Fake] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FAP_Fake] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FAP_Fake] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FAP_Fake] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FAP_Fake] SET ARITHABORT OFF 
GO
ALTER DATABASE [FAP_Fake] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FAP_Fake] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FAP_Fake] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FAP_Fake] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FAP_Fake] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FAP_Fake] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FAP_Fake] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FAP_Fake] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FAP_Fake] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FAP_Fake] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FAP_Fake] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FAP_Fake] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FAP_Fake] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FAP_Fake] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FAP_Fake] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FAP_Fake] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FAP_Fake] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FAP_Fake] SET RECOVERY FULL 
GO
ALTER DATABASE [FAP_Fake] SET  MULTI_USER 
GO
ALTER DATABASE [FAP_Fake] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FAP_Fake] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FAP_Fake] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FAP_Fake] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FAP_Fake] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FAP_Fake] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FAP_Fake', N'ON'
GO
ALTER DATABASE [FAP_Fake] SET QUERY_STORE = OFF
GO
USE [FAP_Fake]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [nvarchar](50) NOT NULL,
	[coursename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[groupname] [nvarchar](50) NOT NULL,
	[course_id] [nvarchar](50) NOT NULL,
	[student_id] [nvarchar](50) NOT NULL,
	[instrurtor_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[instructor_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lession]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lession](
	[lession_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[slot_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[instructor_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[lession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[student_id] [nvarchar](50) NOT NULL,
	[lession_id] [int] NOT NULL,
	[statsus] [bit] NOT NULL,
	[recordtime] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slot_id] [int] IDENTITY(1,1) NOT NULL,
	[timestart] [nvarchar](50) NOT NULL,
	[timeend] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/14/2022 8:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[middlename] [nvarchar](50) NOT NULL,
	[givenname] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Instructor] FOREIGN KEY([instrurtor_id])
REFERENCES [dbo].[Instructor] ([instructor_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Instructor]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Student]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Account]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Group] ([group_id])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Group]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Instructor] FOREIGN KEY([instructor_id])
REFERENCES [dbo].[Instructor] ([instructor_id])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Instructor]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Room]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Slot] FOREIGN KEY([slot_id])
REFERENCES [dbo].[Slot] ([slot_id])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Slot]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Lession] FOREIGN KEY([lession_id])
REFERENCES [dbo].[Lession] ([lession_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Lession]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Student]
GO
USE [master]
GO
ALTER DATABASE [FAP_Fake] SET  READ_WRITE 
GO
