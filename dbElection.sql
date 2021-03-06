USE [master]
GO
/****** Object:  Database [Elections]    Script Date: 31/10/2021 01:30:46 ******/
CREATE DATABASE [Elections]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Elections', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Elections.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Elections_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Elections_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Elections] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Elections].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Elections] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Elections] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Elections] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Elections] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Elections] SET ARITHABORT OFF 
GO
ALTER DATABASE [Elections] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Elections] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Elections] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Elections] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Elections] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Elections] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Elections] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Elections] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Elections] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Elections] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Elections] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Elections] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Elections] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Elections] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Elections] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Elections] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Elections] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Elections] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Elections] SET  MULTI_USER 
GO
ALTER DATABASE [Elections] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Elections] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Elections] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Elections] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Elections] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Elections] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Elections] SET QUERY_STORE = OFF
GO
USE [Elections]
GO
/****** Object:  Table [dbo].[Partys]    Script Date: 31/10/2021 01:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partys](
	[partyName] [nvarchar](50) NOT NULL,
	[voters] [int] NULL,
 CONSTRAINT [PK_dbPartys] PRIMARY KEY CLUSTERED 
(
	[partyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voters]    Script Date: 31/10/2021 01:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voters](
	[fullName] [nvarchar](50) NULL,
	[ID] [nvarchar](50) NOT NULL,
	[idDate] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[phoneNumber] [nvarchar](50) NULL,
	[eMail] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[isVoted] [nvarchar](50) NULL,
	[votedFor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Voters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Partys] ([partyName], [voters]) VALUES (N'Likud', 9)
INSERT [dbo].[Partys] ([partyName], [voters]) VALUES (N'yeshAtid', 8)
INSERT [dbo].[Partys] ([partyName], [voters]) VALUES (N'ZionutDatit', 2)
GO
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'nir dror', N'166548934', N'15-7-2012', N'male', N'054-324152', N'nir @gmail.com', N'haifa', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'nofar nahum', N'234978510', N'6-5-2008', N'female', N'054-323446', N'nofar@gmail.com', N'jerusalem', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'hanan dayan', N'321467756', N'5-3-2018', N'male', N'054-340876', N'hanan @gmail.com', N'jerusalem', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'avi ron', N'352776876', N'29-1-2010', N'male', N'054-129765', N'avi @gmail.com', N'tel aviv', N'yes', N'ZionutDatit')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'nimrod raz', N'383634659', N'22-12-2010', N'male', N'054-534262', N'nimrod @gmail.com', N'jerusalem', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'alon frid', N'423665463', N'12-7-2010', N'male', N'054-600900', N'alon @gmail.com', N'jerusalem', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'yogev katz', N'431563577', N'9-12-2013', N'male', N'054-183705', N'yogev @gmail.com', N'haifa', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'shir nissim', N'493263475', N'17-11-2008', N'frmale', N'054-670095', N'shir @gmail.com', N'tel aviv', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'ravit shemesh', N'543663474', N'4-4-2005', N'female', N'054-320746', N'ravit @gmail.com', N'haifa', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'dana hen', N'548745223', N'6-8-2013', N'female', N'054-853513', N'dana @gmail.com', N'tel aviv', N'yes', N'ZionutDatit')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'simcha rif', N'573322478', N'5-11-2003', N'male', N'054-765832', N'simcha @gmail.com', N'haifa', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'alona menashe', N'630509367', N'6-9-2011', N'female', N'054-434565', N'alona @gmail.com', N'jerusalem', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'hila ravid', N'657333889', N'11-4-2010', N'female', N'054-837484', N'hila @gmail.com', N'tel aviv', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'moshe levi', N'738467467', N'10-5-2009', N'male', N'054-867563', N'moshe@gmail.com', N'tel aviv', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'michal cohen', N'765373211', N'11-2-2009', N'female', N'054-356541', N'michal @gmail.com', N'haifa', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'ronit mantzur', N'765432145', N'23-4-2012', N'female', N'054-400542', N'ronit @gmail.com', N'haifa', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'dudu biton', N'843152673', N'10-6-2005', N'male', N'054-876657', N'dudu @gmail.com', N'tel aviv', N'yes', N'yeshAtid')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'shula miki', N'843215436', N'28-9-2006', N'female', N'054-138644', N'shula @gmail.com', N'haifa', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'omer levi', N'847493628', N'17-3-2009', N'male', N'054-746845', N'omer @gmail.com', N'tel aviv', N'yes', N'Likud')
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'liraz tayeb', N'876531467', N'13-3-2015', N'female', N'054-543756', N'liraz @gmail.com', N'tel aviv', N'no', NULL)
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'ehud david', N'876942514', N'19-9-2018', N'male', N'054-876436', N'ehud @gmail.com', N'jerusalem', N'no', NULL)
INSERT [dbo].[Voters] ([fullName], [ID], [idDate], [gender], [phoneNumber], [eMail], [city], [isVoted], [votedFor]) VALUES (N'lilach ronen', N'879475343', N'3-12-2007', N'female', N'054-415544', N'lilach @gmail.com', N'jerusalem', N'no', NULL)
GO
USE [master]
GO
ALTER DATABASE [Elections] SET  READ_WRITE 
GO
