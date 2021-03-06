USE [master]
GO
/****** Object:  Database [mvebase]    Script Date: 8/9/2018 9:50:53 PM ******/
CREATE DATABASE [mvebase]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mvebase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mvebase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mvebase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mvebase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mvebase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mvebase] SET ARITHABORT OFF 
GO
ALTER DATABASE [mvebase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mvebase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mvebase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mvebase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mvebase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mvebase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mvebase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mvebase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mvebase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mvebase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mvebase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mvebase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mvebase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mvebase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mvebase] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [mvebase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mvebase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [mvebase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mvebase] SET RECOVERY FULL 
GO
ALTER DATABASE [mvebase] SET  MULTI_USER 
GO
ALTER DATABASE [mvebase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mvebase] SET DB_CHAINING OFF 
GO
USE [mvebase]
GO

USE [mvebase]
GO
/****** Object:  StoredProcedure [dbo].[Test1]    Script Date: 8/10/2018 6:10:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Batch submitted through debugger: SQLQuery5.sql|4|0|C:\Users\Jethro\AppData\Local\Temp\~vsB6A5.sql
CREATE PROCEDURE [dbo].[Test1]	@p1 varchar(255) = '', @p2 int
AS
BEGIN
	SET NOCOUNT ON;
	
	Update [dbo].[counter] set [counter] = ISNULL([counter], 0) + 1, [Text] = @p1 where id=@p2

END


GO
/****** Object:  StoredProcedure [dbo].[Test2]    Script Date: 8/10/2018 6:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Test2]	@p1 int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @p2 int =0 

	select @p2 = [counter] from [dbo].[counter] where id = @p1

	return @p2
	
END



GO
/****** Object:  Table [dbo].[counter]    Script Date: 8/10/2018 6:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[counter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[counter] [int] NULL,
	[text] [varchar](255) NULL
)

GO
SET ANSI_PADDING OFF
GO



USE [master]
GO
ALTER DATABASE [mvebase] SET  READ_WRITE 
GO

INSERT INTO [dbo].[counter] ([counter]) values (0)
INSERT INTO [dbo].[counter] ([counter]) values (0)
INSERT INTO [dbo].[counter] ([counter]) values (0)
