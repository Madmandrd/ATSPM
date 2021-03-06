CREATE DATABASE [MOE_Orig] ON  PRIMARY 
( NAME = N'MOE_Orig', FILENAME = N'D:\MSSQL\Data\MOE_Orig.mdf' , SIZE = 3072KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MOE_Orig_log', FILENAME = N'D:\MSSQL\Data\MOE_Orig_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MOE_Orig] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [MOE_Orig] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MOE_Orig] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MOE_Orig] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MOE_Orig] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MOE_Orig] SET ARITHABORT OFF 
GO
ALTER DATABASE [MOE_Orig] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MOE_Orig] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MOE_Orig] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MOE_Orig] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MOE_Orig] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MOE_Orig] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MOE_Orig] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MOE_Orig] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MOE_Orig] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MOE_Orig] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MOE_Orig] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MOE_Orig] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MOE_Orig] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MOE_Orig] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MOE_Orig] SET  READ_WRITE 
GO
ALTER DATABASE [MOE_Orig] SET RECOVERY FULL 
GO
ALTER DATABASE [MOE_Orig] SET  MULTI_USER 
GO
ALTER DATABASE [MOE_Orig] SET PAGE_VERIFY CHECKSUM  
GO
USE [MOE_Orig]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [MOE_Orig] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO

/*create teh tables*/


USE [MOE_ORIG]
GO
/****** Object:  Table [dbo].[Signals]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Signals](
	[SignalID] [nvarchar](10) NOT NULL,
	[Primary_Name] [varchar](30) NULL,
	[Secondary_Name] [varchar](30) NULL,
	[IP_Address] [varchar](50) NULL,
	[Latitude] [varchar](30) NULL,
	[Longitude] [varchar](30) NULL,
	[Region] [varchar](50) NULL,
	[Controller_Type] [int] NULL,
	[Collection_Frequency] [int] NULL,
 CONSTRAINT [PK_Signals] PRIMARY KEY CLUSTERED 
(
	[SignalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Program_Settings]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program_Settings](
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Program_Message]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program_Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [nvarchar](10) NULL,
	[Program] [nvarchar](50) NULL,
	[Message] [nvarchar](500) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK__Program___3214EC272C3393D0] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOE_Users]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOE_Users](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ReceiveAlerts] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuId] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MenuLocation] [nvarchar](100) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Application] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTable]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogTable](
	[TSQLStatement] [varchar](max) NULL,
	[FRAGMENTATION] [float] NULL,
	[Executed] [datetime] NULL,
	[ExecutedBy] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApproachRoute]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApproachRoute](
	[ApproachRouteId] [int] IDENTITY(1,1) NOT NULL,
	[RouteName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.ApproachRoute] PRIMARY KEY CLUSTERED 
(
	[ApproachRouteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApproachDirection]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApproachDirection](
	[DirectionID] [int] NOT NULL,
	[DirectionName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Accordian]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accordian](
	[AccHeader] [nvarchar](150) NULL,
	[AccContent] [nvarchar](max) NULL,
	[AccOrder] [int] NULL,
	[Application] [nvarchar](50) NULL,
	[AccID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Accordian] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetTableSize]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTableSize] 
(
@TableName VARCHAR(100)
)
	


AS

BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- Do not lock anything, and do not get held up by any locks.
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 
-- Quickly get row counts.
SELECT so.name as TableName, ddps.row_count as [RowCount]
FROM sys.objects so
JOIN sys.indexes si ON si.OBJECT_ID = so.OBJECT_ID
JOIN sys.dm_db_partition_stats AS ddps ON si.OBJECT_ID = ddps.OBJECT_ID  AND si.index_id = ddps.index_id
WHERE si.index_id < 2  AND so.is_ms_shipped = 0 and so.name = @TableName
ORDER BY ddps.row_count DESC
END
GO
/****** Object:  Table [dbo].[holdkey]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[holdkey](
	[Timestamp] [datetime] NULL,
	[SignalID] [nvarchar](10) NULL,
	[EventCode] [int] NULL,
	[EventParam] [int] NULL,
	[DupeCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[holddups]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[holddups](
	[SignalID] [nvarchar](10) NULL,
	[Timestamp] [datetime] NULL,
	[EventCode] [int] NULL,
	[EventParam] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetAllTableSizes]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTableSizes]
AS
/*
    Obtains spaced used data for ALL user tables in the database
*/
DECLARE @TableName VARCHAR(100)    --For storing values in the cursor

--Cursor to get the name of all user tables from the sysobjects listing
DECLARE tableCursor CURSOR
FOR 
select [name]
from dbo.sysobjects 
where  OBJECTPROPERTY(id, N'IsUserTable') = 1
FOR READ ONLY

--A procedure level temp table to store the results
CREATE TABLE #TempTable
(
    tableName varchar(100),
    numberofRows varchar(100),
    reservedSize varchar(50),
    dataSize varchar(50),
    indexSize varchar(50),
    unusedSize varchar(50)
)

--Open the cursor
OPEN tableCursor

--Get the first table name from the cursor
FETCH NEXT FROM tableCursor INTO @TableName

--Loop until the cursor was not able to fetch
WHILE (@@Fetch_Status >= 0)
BEGIN
    --Dump the results of the sp_spaceused query to the temp table
    INSERT  #TempTable
        EXEC sp_spaceused @TableName

    --Get the next table name
    FETCH NEXT FROM tableCursor INTO @TableName
END

--Get rid of the cursor
CLOSE tableCursor
DEALLOCATE tableCursor

--Select all records so we can use the reults
SELECT * 
FROM #TempTable
ORDER BY CAST(LEFT(dataSize,LEN(dataSize)-3) AS NUMERIC(18,0)) DESC 
--Final cleanup!
DROP TABLE #TempTable
GO
/****** Object:  Table [dbo].[Error_Types]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error_Types](
	[ErrorType] [int] NOT NULL,
	[ErrorDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_Error_Types] PRIMARY KEY CLUSTERED 
(
	[ErrorType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DownloadAgreements]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DownloadAgreements](
	[DownloadAgreementID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[EmailAddress] [nvarchar](max) NOT NULL,
	[Acknowledged] [bit] NOT NULL,
	[AgreementDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DownloadAgreements] PRIMARY KEY CLUSTERED 
(
	[DownloadAgreementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Archived_Metrics_Temp]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archived_Metrics_Temp](
	[Timestamp] [datetime] NOT NULL,
	[DetectorID] [nvarchar](50) NOT NULL,
	[Volume] [int] NULL,
	[speed] [int] NULL,
	[delay] [int] NULL,
	[AoR] [int] NULL,
	[BinSize] [int] NOT NULL,
	[SpeedHits] [int] NULL,
	[BinGreenTime] [int] NULL,
	[BinYellowTime] [int] NULL,
	[BinRedTime] [int] NULL,
 CONSTRAINT [CK_Archived_Metrics_IDTime_Temp] UNIQUE NONCLUSTERED 
(
	[Timestamp] ASC,
	[DetectorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Archived_Metrics]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Archived_Metrics](
	[Timestamp] [datetime] NOT NULL,
	[DetectorID] [varchar](50) NOT NULL,
	[Volume] [int] NULL,
	[speed] [int] NULL,
	[delay] [int] NULL,
	[AoR] [int] NULL,
	[BinSize] [int] NOT NULL,
	[SpeedHits] [int] NULL,
	[BinGreenTime] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ix_ArchiveMetricsTimestampDetector] ON [dbo].[Archived_Metrics] 
(
	[Timestamp] ASC,
	[DetectorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ControllerEventLog_GetIndexFragementation]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ControllerEventLog_GetIndexFragementation]
As
Begin

DECLARE @db_id SMALLINT;
DECLARE @object_id INT;

SET @db_id = DB_ID(N'MOE');
SET @object_id = OBJECT_ID(N'Controller_Event_Log');

IF @db_id IS NULL
BEGIN;
    PRINT N'Invalid database';
END;
ELSE IF @object_id IS NULL
BEGIN;
    PRINT N'Invalid object';
END;
ELSE
BEGIN;
    SELECT * FROM sys.dm_db_index_physical_stats(@db_id, @object_id, NULL, NULL , 'LIMITED');
END;
End
GO


/****** Object:  Table [dbo].[Controller_Type]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Controller_Type](
	[TypeID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[SNMPPort] [bigint] NOT NULL,
	[FTPDirectory] [varchar](max) NOT NULL,
	[ActiveFTP] [bit] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alert_Types]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert_Types](
	[AlertID] [int] NOT NULL,
	[Alert_Description] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetAlertThreshhold]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAlertThreshhold]
(
	@SignalID nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT SignalID, SpeedHitsThreshhold, DetHitsThreshhold, PlanChangeThreshold
FROM  Alert_Thresholds
WHERE (SignalID = @SignalID)
GO
/****** Object:  Table [dbo].[Alert_Recipients]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert_Recipients](
	[UserID] [int] NULL,
	[AlertID] [int] NULL,
	[RowID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Alert_Recipients] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alert_Day_Types]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert_Day_Types](
	[DayTypeNumber] [int] NOT NULL,
	[DayTypeDesctiption] [nvarchar](50) NULL,
 CONSTRAINT [PK_Alert_Day_Types] PRIMARY KEY CLUSTERED 
(
	[DayTypeNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action_Log_Metric_List]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Log_Metric_List](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Action_Log_Metric_List_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action_Log_Agency_List]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Log_Agency_List](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Action_Log_Agency_List_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action_Log_Action_List]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Log_Action_List](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Action_Log_Action_List_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Route](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Region] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Region]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[ID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[SPM_Error]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SPM_Error](
	[ErrorID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[ErrorType] [int] NOT NULL,
	[Param1] [varchar](50) NULL,
	[Param2] [varchar](50) NULL,
 CONSTRAINT [PK_SPM_Error] PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SPM_Comment]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SPM_Comment](
	[CommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Entity] [varchar](50) NOT NULL,
	[ChartType] [int] NOT NULL,
	[Comment] [varchar](max) NOT NULL,
	[EntityType] [int] NULL,
 CONSTRAINT [PK_SPM_Message] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Speed_Events]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speed_Events](
	[DetectorID] [nvarchar](50) NOT NULL,
	[MPH] [int] NOT NULL,
	[KPH] [int] NOT NULL,
	[timestamp] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ByDetID] ON [dbo].[Speed_Events] 
(
	[DetectorID] ASC,
	[timestamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDistinctPhasesBySignalByReport]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Shane>
-- Create date: <April 24 2013>
-- Description:	<Allows Detectors to be filtered by report type>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SelectDistinctPhasesBySignalByReport] 
	-- Add the parameters for the stored procedure here
	@SignalID varchar(50),
	@ColumnName varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

    Declare @Query varchar(1000)
    
	set @Query = ('SELECT DISTINCT Phase, Direction, Det_Channel, Is_Overlap,
	Case
	When MPH > 0 then
	((DistanceFromStopBar/(MPH*1.467))-Decision_Point)*1000
	Else 0
	End as offset
FROM Graph_Detectors AS g with (NOLOCK)
WHERE (SignalID = ' +@SignalID+ ' AND ' +@ColumnName+' = 1)
ORDER BY Phase')

exec(@query)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSignalsbyRegionbyReportType]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectSignalsbyRegionbyReportType]
(
	@Region varchar(1),
	@ColumnName varchar(50)
)
AS
	SET NOCOUNT ON;
	
	DECLARE @query VARCHAR(1000)
	
	set @query = ('Select distinct signalID from Graph_Detectors where Region = '+@Region+' 
	AND '+@ColumnName+' = 1 order by signalID')
	exec(@query)
GO
/****** Object:  StoredProcedure [dbo].[sp_Signals_Update]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Signals_Update]
(
	@SignalId varchar(10),
	@Primary_Name varchar(30),
	@Secondary_Name varchar(30),
	@IP_Address varchar(50),
	@Latitude varchar(30),
	@Longitude varchar(30),
	@Region varchar(50),
	@Controller_Type Int,
	@Collection_Frequency Int,
	@Original_SignalId varchar(15)
)
AS
	SET NOCOUNT OFF;
UPDATE [Signals] SET [SignalID] = @SignalId, [Primary_Name] = @Primary_Name, [Secondary_Name] = @Secondary_Name, [IP_Address] = @IP_Address, [Latitude] = @Latitude, [Longitude] = @Longitude, [Region] = @Region, [Controller_Type] = @Controller_Type, [Collection_Frequency] = @Collection_Frequency WHERE [SignalID] = @Original_SignalId
	
SELECT SignalID, Primary_Name, Secondary_Name, IP_Address, Latitude, Longitude, Region FROM Signals WHERE (SignalID = @SignalId)
GO
/****** Object:  StoredProcedure [dbo].[sp_Signals_SelectBySignalID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Signals_SelectBySignalID]
(
	@signalID varchar(10)
)
AS
	SET NOCOUNT ON;
SELECT     SignalId, Primary_Name, Secondary_Name, IP_Address, Latitude, Longitude, Region, Controller_Type, Collection_Frequency
FROM         Signals
WHERE     (SignalId = @signalID)
GO
/****** Object:  StoredProcedure [dbo].[sp_Signals_SelectAll]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Signals_SelectAll]
AS
	SET NOCOUNT ON;
SELECT     SignalID, Primary_Name, Secondary_Name, IP_Address, Latitude, Longitude, Region, Controller_Type, Collection_Frequency
FROM         Signals
GO
/****** Object:  StoredProcedure [dbo].[sp_Signals_Insert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Signals_Insert]
(
	@SignalId varchar(10),
	@Primary_Name varchar(30),
	@Secondary_Name varchar(30),
	@IP_Address varchar(50),
	@Latitude varchar(30),
	@Longitude varchar(30),
	@Region varchar(50),
	@Controller_Type Int,
	@Collection_Frequency int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Signals] ([SignalID], [Primary_Name], [Secondary_Name], [IP_Address], [Latitude], [Longitude], [Region], [Controller_Type], [Collection_Frequency]) VALUES (@SignalId, @Primary_Name, 
@Secondary_Name, @IP_Address, @Latitude, @Longitude, @Region, @Controller_Type,
	@Collection_Frequency
)

;
	
SELECT SignalID, Primary_Name, Secondary_Name, IP_Address, Latitude, Longitude, Region FROM Signals WHERE (SignalID = @SignalId)
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoute]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectRoute]
(
	@RouteID int
)
AS
	SET NOCOUNT ON;
SELECT     RouteID, Name, Description, Region
FROM         Route
WHERE     (RouteID = @RouteID)
GO
/****** Object:  StoredProcedure [dbo].[sp_SPM_Error_SelectbyDateRange]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPM_Error_SelectbyDateRange]
(
	@StartDate datetime,
	@EndDate datetime
)
AS
	SET NOCOUNT ON;
SELECT     ErrorID, TimeStamp, ErrorType, Param1, Param2
FROM         SPM_Error
WHERE     (TimeStamp BETWEEN @StartDate AND @EndDate)
ORDER BY TimeStamp
GO
/****** Object:  StoredProcedure [dbo].[sp_SPM_Error_SelectAll]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPM_Error_SelectAll]
AS
	SET NOCOUNT ON;
SELECT     ErrorID, TimeStamp, ErrorType, Param1, Param2
FROM         SPM_Error
GO
/****** Object:  StoredProcedure [dbo].[sp_SPM_Error_Insert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPM_Error_Insert]
(

	@ErrorType int,
	@Param1 varchar(50),
	@Param2 varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [SPM_Error] ( [ErrorType], [Param1], [Param2]) VALUES ( @ErrorType, @Param1, @Param2)
GO
/****** Object:  StoredProcedure [dbo].[sp_SPM_Comment_Update]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPM_Comment_Update]
(
	@TimeStamp datetime,
	@Entity varchar(50),
	@ChartType int,
	@Comment varchar(MAX),
	@EntityType int,
	@Original_CommentID bigint,
	@Original_TimeStamp datetime,
	@Original_Entity varchar(50),
	@Original_ChartType int,
	@IsNull_EntityType Int,
	@Original_EntityType int,
	@CommentID bigint
)
AS
	SET NOCOUNT OFF;
UPDATE [SPM_Comment] SET [TimeStamp] = @TimeStamp, [Entity] = @Entity, [ChartType] = @ChartType, [Comment] = @Comment, [EntityType] = @EntityType WHERE (([CommentID] = @Original_CommentID) AND ([TimeStamp] = @Original_TimeStamp) AND ([Entity] = @Original_Entity) AND ([ChartType] = @Original_ChartType) AND ((@IsNull_EntityType = 1 AND [EntityType] IS NULL) OR ([EntityType] = @Original_EntityType)));
	
SELECT CommentID, TimeStamp, Entity, ChartType, Comment, EntityType FROM SPM_Comment WHERE (CommentID = @CommentID) ORDER BY TimeStamp DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_SPM_Comment_SelectByEntityByChartType]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPM_Comment_SelectByEntityByChartType]
(
	@ChartType int,
	@Entity varchar(50),
	@EntityType int
)
AS
	SET NOCOUNT ON;
SELECT     CommentID, TimeStamp, Entity, ChartType, Comment, EntityType
FROM         SPM_Comment
WHERE     (ChartType = @ChartType) AND (Entity = @Entity) and (EntityType = @EntityType) 
ORDER BY TimeStamp DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_SPM_Comment_Insert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPM_Comment_Insert]
(
	@TimeStamp datetime,
	@Entity varchar(50),
	@ChartType int,
	@Comment varchar(MAX),
	@EntityType int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [SPM_Comment] ([TimeStamp], [Entity], [ChartType], [Comment], [EntityType]) VALUES (@TimeStamp, @Entity, @ChartType, @Comment, @EntityType);
	
SELECT CommentID, TimeStamp, Entity, ChartType, Comment, EntityType FROM SPM_Comment WHERE (CommentID = SCOPE_IDENTITY()) ORDER BY TimeStamp DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_SPM_Comment_Delete]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPM_Comment_Delete]
(
	@Original_CommentID bigint,
	@Original_TimeStamp datetime,
	@Original_Entity varchar(50),
	@Original_ChartType int,
	@IsNull_EntityType Int,
	@Original_EntityType int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [SPM_Comment] WHERE (([CommentID] = @Original_CommentID) AND ([TimeStamp] = @Original_TimeStamp) AND ([Entity] = @Original_Entity) AND ([ChartType] = @Original_ChartType) AND ((@IsNull_EntityType = 1 AND [EntityType] IS NULL) OR ([EntityType] = @Original_EntityType)))
GO
/****** Object:  StoredProcedure [dbo].[sp_Speed_EventsSelectAll]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Speed_EventsSelectAll]
AS
	SET NOCOUNT ON;
SELECT        DetectorID, MPH, KPH, timestamp
FROM            Speed_Events
GO
/****** Object:  StoredProcedure [dbo].[sp_Speed_EventsInsert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Speed_EventsInsert]
(
	@DetectorID nvarchar(50),
	@MPH int,
	@KPH int,
	@timestamp datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Speed_Events] ([DetectorID], [MPH], [KPH], [timestamp]) VALUES (@DetectorID, @MPH, @KPH, @timestamp)
GO
/****** Object:  StoredProcedure [dbo].[sp_SignalsSelectFTPParamsBySignalID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SignalsSelectFTPParamsBySignalID]
(
	@SignalID varchar(10)
)
AS
	SET NOCOUNT ON;
SELECT     Controller_Type.SNMPPort, Controller_Type.FTPDirectory, Controller_Type.ActiveFTP, Controller_Type.UserName, Controller_Type.Password, Signals.SignalID, 
                      Signals.Primary_Name, Signals.Secondary_Name, Signals.IP_Address, Signals.Latitude, Signals.Longitude, Signals.Region, Signals.Collection_Frequency, 
                      Signals.Controller_Type
FROM         Signals INNER JOIN
                      Controller_Type ON Signals.Controller_Type = Controller_Type.TypeID
WHERE     (Signals.SignalID = @SignalID)
GO
/****** Object:  StoredProcedure [dbo].[sp_SignalsSelectFTPParamsByControllerType]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SignalsSelectFTPParamsByControllerType]
(
	@Controller_Type int
)
AS
	SET NOCOUNT ON;
SELECT     Controller_Type.SNMPPort, Controller_Type.FTPDirectory, Controller_Type.ActiveFTP, Controller_Type.UserName, Controller_Type.Password, Signals.SignalID, 
                      Signals.Primary_Name, Signals.Secondary_Name, Signals.IP_Address, Signals.Latitude, Signals.Longitude, Signals.Region, Signals.Collection_Frequency, 
                      Signals.Controller_Type
FROM         Signals INNER JOIN
                      Controller_Type ON Signals.Controller_Type = Controller_Type.TypeID
WHERE     (Signals.Controller_Type = @Controller_Type)
GO
/****** Object:  StoredProcedure [dbo].[sp_SignalsSelectFTPParams]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SignalsSelectFTPParams]
AS
	SET NOCOUNT ON;
SELECT     Controller_Type.SNMPPort, Controller_Type.FTPDirectory, Controller_Type.ActiveFTP, Controller_Type.UserName, Controller_Type.Password, Signals.SignalID, 
                      Signals.Primary_Name, Signals.Secondary_Name, Signals.IP_Address, Signals.Latitude, Signals.Longitude, Signals.Region, Signals.Collection_Frequency, 
                      Signals.Controller_Type
FROM         Signals INNER JOIN
                      Controller_Type ON Signals.Controller_Type = Controller_Type.TypeID
GO
/****** Object:  StoredProcedure [dbo].[usp_FixIndexFragmentation]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_FixIndexFragmentation] 
( 
    /* Use online rebuild if detected  edition is Enterprise, Developer or Evaluation.*/ 
    @Online BIT = 1, 
 
    /* Log recommendations Only */     
    @LogOnly BIT = 1, 
 
    /* Specifies a percentage that indicates how full the Database Engine should  
    make the leaf level of each index page during index creation or alteration.  
    Fillfactor must be an integer value from 1 to 100. The default is 0. */ 
    @FillFactor TINYINT = 50, 
 
   /* Specifies the scan level that is used to obtain statistics. Valid inputs are  
    DEFAULT, NULL, LIMITED, SAMPLED, or DETAILED. */ 
    @Index_physical_stats_mode VARCHAR(20) = 'Limited', 
 
 
    /* Total number of index or data pages. */ 
    @Index_physical_stats_page_count BIGINT = 500, 
 
 
    /* Logical fragmentation for indexes, or extent fragmentation for heaps in the  
    IN_ROW_DATA allocation unit. The value is measured as a percentage and  
    takes into account multiple files */ 
    @Avg_fragmentation_percent TINYINT = 40 
) 
AS 
BEGIN 
    SET NOCOUNT ON 
 
    DEClARE @Rows BIGINT = 0 
    DEClARE @Counter BIGINT = 1 
    DECLARE @TSQLStatement NVARCHAR(MAX) 
 
    IF OBJECT_ID('tempdb..#TmpTable') IS NOT NULL  
        DROP TABLE #TmpTable  
           
    CREATE TABLE #TmpTable  
    ( 
        RowNo BIGINT IDENTITY(1,1), TSQLStatement VARCHAR(MAX) 
    ) 
           
    IF NOT EXISTS  
    ( 
        SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogTable]')  
        AND type in (N'U') 
    ) 
    BEGIN 
        CREATE TABLE [dbo].[LogTable] 
        ( 
            [TSQLStatement] [varchar](max) NULL, 
            [FRAGMENTATION] [float] NULL, 
            [Executed] [datetime] NULL, 
            [ExecutedBy] [varchar](100) NULL 
        ) ON [PRIMARY] 
    END 
                     
    INSERT INTO LogTable 
    OUTPUT INSERTED.TSQLStatement INTO #TmpTable 
    SELECT    'ALTER INDEX [' + ix.name + '] ON [' + s.name + '].[' + t.name + '] ' + 
    CASE 
        WHEN ps.avg_fragmentation_in_percent > @Avg_fragmentation_percent THEN 
        CASE 
            WHEN @Online = 1 AND  
                ( 
                    CAST(SERVERPROPERTY('Edition') AS VARCHAR) LIKE 'Enterprise%' 
                    OR 
                    CAST(SERVERPROPERTY('Edition') AS VARCHAR) LIKE 'Developer%' 
 
                    OR 
                    CAST(SERVERPROPERTY('Edition') AS VARCHAR) LIKE 'Evaluation%' 
                ) 
                THEN 'REBUILD WITH (ONLINE = ON, FILLFACTOR = '  
                    + CAST(@FillFactor AS VARCHAR(10)) + ') ' 
            ELSE 'REBUILD WITH (FILLFACTOR = '  
                + CAST(@FillFactor AS VARCHAR(10)) + ') ' 
        END 
        ELSE 'REORGANIZE ' 
    END + 
    CASE 
        WHEN pc.partition_count > 1  
            THEN ' PARTITION = ' + CAST(ps.partition_number AS NVARCHAR(MAX)) 
        ELSE '' 
    END, 
    PS.AVG_FRAGMENTATION_IN_PERCENT, GETDATE(), SUSER_NAME() 
    FROM sys.indexes AS ix INNER JOIN sys.tables t 
        ON t.object_id = ix.object_id     INNER JOIN sys.schemas s 
        ON t.schema_id = s.schema_id INNER JOIN  
        (          
            SELECT object_id, index_id, avg_fragmentation_in_percent, partition_number 
            FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL,  
                @Index_physical_stats_mode)  
            WHERE page_count > @Index_physical_stats_page_count 
        ) ps 
            ON t.object_id = ps.object_id AND ix.index_id = ps.index_id INNER JOIN  
    ( 
        SELECT object_id, index_id, COUNT(DISTINCT partition_number) AS partition_count 
        FROM sys.partitions 
        GROUP BY  object_id, index_id 
    ) pc 
            ON t.object_id = pc.object_id AND ix.index_id = pc.index_id 
    WHERE ps.avg_fragmentation_in_percent > 10 AND ix.name IS NOT NULL 
    ORDER BY  ps.avg_fragmentation_in_percent DESC 
 
    SET @Rows = @@ROWCOUNT 
 
    IF @LogOnly = 0 
    BEGIN 
        WHILE (@Counter <= @Rows) 
            BEGIN 
            SELECT @TSQLStatement = TSQLStatement 
            FROM #TmpTable 
            WHERE RowNo = @Counter 
 
            EXECUTE sp_executesql @TSQLStatement 
 
            SET @Counter += 1 
            END 
    END 
     
  SET NOCOUNT OFF 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSignals]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				


				

/****** Object:  StoredProcedure [dbo].[SP_SelectMostRecentArchiveRecord]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectMostRecentArchiveRecord] 
	-- Add the parameters for the stored procedure here
	(
	@DetectorID nvarchar(50)
	)
AS
	SET NOCOUNT ON;
	SELECT     TOP (1) Timestamp, DetectorID, Volume, speed, delay, AoR, BinSize, SpeedHits, BinGreenTime
FROM         Archived_Metrics
WHERE     (DetectorID = @DetectorID)
ORDER BY Timestamp DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectAllRoutes]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectAllRoutes]
AS
	SET NOCOUNT ON;
SELECT     RouteID, Name, Description, Region
FROM         Route
GO
/****** Object:  StoredProcedure [dbo].[sp_RouteUpdate]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RouteUpdate]
(
	@RouteID int,
	@Description varchar(MAX),
	@Name varchar(MAX),
	@Region int
)
AS
	SET NOCOUNT OFF;
UPDATE [Route] SET [Description] = @Description, [Name] = @Name, [Region] = @Region WHERE (([RouteID] = @RouteID));
GO
/****** Object:  StoredProcedure [dbo].[sp_RouteSelectAll]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RouteSelectAll]
AS
	SET NOCOUNT ON;
SELECT [Description], [RouteID] FROM [Route]
GO
/****** Object:  StoredProcedure [dbo].[sp_RouteInsert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RouteInsert]
(

	@RouteID int Output,
	@Description varchar(MAX),
	@Name varchar(MAX),
	@Region int

)
AS
	SET NOCOUNT OFF;
INSERT INTO [Route] ([Name], [Description], [Region]) VALUES (@Name, @Description, @Region)
	SET @RouteID = SCOPE_IDENTITY()
SELECT @RouteID, Description, Name FROM Route WHERE (@RouteID = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertArchiveRecord]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_InsertArchiveRecord] 
	-- Add the parameters for the stored procedure here
	(
	@Timestamp DateTime,
	@Volume Int,
	@speed Int,
	@delay Int,
	@AoR Int,
	@BinSize Int,
	@speedhits Int,
	@detectorID nVarChar(50),
	@greentime int
	)
AS
INSERT INTO Archived_Metrics
                      (Timestamp, Volume, speed, delay, AoR, BinSize, SpeedHits, DetectorID, BinGreenTime)
VALUES     (@Timestamp,@Volume,@speed,@delay,@AoR,@BinSize,@speedhits,@detectorID,@greentime)
GO
/****** Object:  StoredProcedure [dbo].[sp_RouteDelete]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RouteDelete]
(
	@Original_RouteID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Route] WHERE (([RouteID] = @Original_RouteID))
GO
/****** Object:  StoredProcedure [dbo].[sp_RegionSelectAll]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegionSelectAll]
AS
	SET NOCOUNT ON;
SELECT Id, Description
FROM  Region
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramMessageUpdate]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProgramMessageUpdate]
(
	@Priority nvarchar(10),
	@Program nvarchar(50),
	@Message nvarchar(500),
	@Original_ID int,
	@IsNull_Priority Int,
	@Original_Priority nvarchar(10),
	@IsNull_Program Int,
	@Original_Program nvarchar(50),
	@IsNull_Message Int,
	@Original_Message nvarchar(500),
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [Program_Message] SET [Priority] = @Priority, [Program] = @Program, [Message] = @Message WHERE (([ID] = @Original_ID) AND ((@IsNull_Priority = 1 AND [Priority] IS NULL) OR ([Priority] = @Original_Priority)) AND ((@IsNull_Program = 1 AND [Program] IS NULL) OR ([Program] = @Original_Program)) AND ((@IsNull_Message = 1 AND [Message] IS NULL) OR ([Message] = @Original_Message)));
	
SELECT ID, Priority, Program, Message FROM Program_Message WHERE (ID = @ID)
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramMessageSelect]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProgramMessageSelect]
AS
	SET NOCOUNT ON;
SELECT        ID, Priority, Program, Message
FROM            Program_Message
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramMessageInsert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProgramMessageInsert]
(
	@Priority nvarchar(10),
	@Program nvarchar(50),
	@Message nvarchar(500)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Program_Message] ([Priority], [Program], [Message]) VALUES (@Priority, @Program, @Message);
	
SELECT ID, Priority, Program, Message FROM Program_Message WHERE (ID = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramMessageDelete]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProgramMessageDelete]
(
	@Original_ID int,
	@IsNull_Priority Int,
	@Original_Priority nvarchar(10),
	@IsNull_Program Int,
	@Original_Program nvarchar(50),
	@IsNull_Message Int,
	@Original_Message nvarchar(500)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Program_Message] WHERE (([ID] = @Original_ID) AND ((@IsNull_Priority = 1 AND [Priority] IS NULL) OR ([Priority] = @Original_Priority)) AND ((@IsNull_Program = 1 AND [Program] IS NULL) OR ([Program] = @Original_Program)) AND ((@IsNull_Message = 1 AND [Message] IS NULL) OR ([Message] = @Original_Message)))
GO
/****** Object:  StoredProcedure [dbo].[SP_getSpeedbyDetectorbetweenTime]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_getSpeedbyDetectorbetweenTime]
(
	@detID nvarchar(50),
	@starttime datetime,
	@stoptime datetime
)
AS

declare @_detID nvarchar(50)
declare @_starttime datetime
declare @_stoptime datetime

set @_detID = @detID
set @_starttime = @starttime
set @_stoptime = @stoptime


	SET NOCOUNT ON;
SELECT DetectorID, MPH, timestamp
FROM  Speed_Events
WHERE (DetectorID = @_detID) AND (timestamp BETWEEN @_starttime AND @_stoptime)
GO
/****** Object:  StoredProcedure [dbo].[sp_getSetting]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getSetting]
(
	@SettingName nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT SettingName, SettingValue
FROM  Program_Settings
WHERE (SettingName = @SettingName)
GO
/****** Object:  StoredProcedure [dbo].[sp_get_alert_recipients]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_alert_recipients]
AS
	SET NOCOUNT ON;
SELECT MOE_Users.Email, Alert_Types.AlertID
FROM  Alert_Recipients INNER JOIN
               MOE_Users ON Alert_Recipients.UserID = MOE_Users.ID INNER JOIN
               Alert_Types ON Alert_Recipients.AlertID = Alert_Types.AlertID
               Where MOE_Users.ReceiveAlerts = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_ControllerTypeSelectAll]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ControllerTypeSelectAll]
AS
	SET NOCOUNT ON;
SELECT     TypeID, Description, SNMPPort, FTPDirectory, ActiveFTP, UserName, Password
FROM         Controller_Type
GO
/****** Object:  StoredProcedure [dbo].[sp_ArchiveMetricSelectByDateRoute]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArchiveMetricSelectByDateRoute]
(
	@StartDate datetime,
	@EndDate datetime,
	@StartHour int,
	@EndHour int,
	@daylist varchar(20),
	@RouteID int
)
AS
	SET NOCOUNT ON;
SELECT        DATEPART(YEAR, Timestamp) Year,
DATEPART(MONTH, Timestamp) Month,
DATEPART(DAY, Timestamp) Day,
DATEPART(HOUR, Timestamp) Hour, 
Sum(Volume) Volume, 
Sum(speed) Speed, 
Sum(delay) Delay, 
Sum(AoR) AoR, 
Sum(SpeedHits) SpeedHits
FROM            Archived_Metrics


WHERE        Timestamp >= @StartDate 
AND Timestamp < @EndDate 
AND DATEPART(hh,Timestamp ) >= @StartHour AND DATEPART(hh,Timestamp ) <= @EndHour 
AND datepart(dw, Timestamp ) in (select * from #tempList)

AND (Detector IN
 (SELECT        DetectorID
   FROM            Route_Signals
   WHERE        (RouteID = @RouteID)))
Group By
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)
Order By
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)
GO
/****** Object:  StoredProcedure [dbo].[sp_ArchiveMetricSelectByDateDetector_Old]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArchiveMetricSelectByDateDetector_Old]
(
	@StartDate datetime,
	@EndDate datetime,
	@DetectorID int
)

as
SELECT      
DATEPART(YEAR, Timestamp) Year,
DATEPART(MONTH, Timestamp) Month,
DATEPART(DAY, Timestamp) Day,
DATEPART(HOUR, Timestamp) Hour, 
Sum(Volume) Volume, 
Sum(speed) Speed, 
Sum(delay) Delay, 
Sum(AoR) AoR, 
Sum(SpeedHits) SpeedHits,
Sum(BinGreenTime) BinGreenTime
FROM            Archived_Metrics
WHERE        Timestamp >= @StartDate 
AND Timestamp < @EndDate 
AND DetectorID = @DetectorID
Group By
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)

Order By
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)
GO
/****** Object:  StoredProcedure [dbo].[sp_ArchiveMetricSelectByDateDetector]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArchiveMetricSelectByDateDetector]
(
	@StartDate datetime,
	@EndDate datetime,
	@StartHour int,
	@EndHour int,
	@daylist varchar(20),
	@DetectorID nvarchar(50)
)
AS
	SET NOCOUNT ON;

	If OBJECT_ID('#TempList') Is NOT Null
Begin
Drop Table #TempList
End

CREATE TABLE #TempList
	(
		OrderID int
	)

	DECLARE @OrderID varchar(10), @Pos int

	SET @daylist = LTRIM(RTRIM(@daylist))+ ','
	SET @Pos = CHARINDEX(',', @daylist, 1)

	IF REPLACE(@daylist, ',', '') <> ''
	BEGIN
		WHILE @Pos > 0
		BEGIN
			SET @OrderID = LTRIM(RTRIM(LEFT(@daylist, @Pos - 1)))
			IF @OrderID <> ''
			BEGIN
				INSERT INTO #TempList (OrderID) VALUES (CAST(@OrderID AS int)) --Use Appropriate conversion
			END
			SET @daylist = RIGHT(@daylist, LEN(@daylist) - @Pos)
			SET @Pos = CHARINDEX(',', @daylist, 1)

		END
	END	

SELECT      
DATEPART(YEAR, Timestamp) Year,
DATEPART(MONTH, Timestamp) Month,
DATEPART(DAY, Timestamp) Day,
DATEPART(HOUR, Timestamp) Hour, 
Sum(Volume) Volume, 
Sum(speed) Speed, 
Sum(delay) Delay, 
Sum(AoR) AoR, 
Sum(SpeedHits) SpeedHits,
Sum(BinGreenTime) BinGreenTime
FROM            Archived_Metrics

WHERE        Timestamp >= @StartDate 
AND Timestamp < @EndDate 
AND DetectorID = @DetectorID
AND DATEPART(hh,Timestamp ) >= @StartHour AND DATEPART(hh,Timestamp ) <= @EndHour 
AND datepart(dw, Timestamp ) in (select * from #tempList)

Group By
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)

Order By
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)
GO
/****** Object:  StoredProcedure [dbo].[SP_Archived_MetricsSelectMaxTimeStamp]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Derek Lowe
-- Create date: 1/28/14
-- Description:	Gets the last entry date from Archived_Metrics
-- =============================================
CREATE PROCEDURE [dbo].[SP_Archived_MetricsSelectMaxTimeStamp] 
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     Max(Timestamp) MaxDate
FROM         Archived_Metrics
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ApproachRouteUpdateByRouteID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ApproachRouteUpdateByRouteID]
(
	@RouteID int,
	@RouteName Varchar(50)

)
AS
	SET NOCOUNT OFF;
UPDATE    ApproachRoute
SET              RouteName = @RouteName
WHERE     (ApproachRouteId = @RouteID)
GO
/****** Object:  Table [dbo].[Graph_Detectors]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Graph_Detectors](
	[DetectorID] [nvarchar](50) NOT NULL,
	[SignalID] [nvarchar](10) NOT NULL,
	[Lane] [varchar](50) NULL,
	[Phase] [varchar](50) NOT NULL,
	[Loops] [varchar](50) NULL,
	[Comments] [varchar](500) NULL,
	[Direction] [varchar](50) NOT NULL,
	[Det_Channel] [int] NOT NULL,
	[IPaddr] [varchar](50) NULL,
	[DistanceFromStopBar] [int] NULL,
	[Port] [bigint] NULL,
	[MPH] [int] NULL,
	[Decision_Point] [int] NULL,
	[Region] [int] NULL,
	[Movement_Delay] [int] NULL,
	[Min_Speed_Filter] [int] NULL,
	[Has_Speed_Detector] [bit] NULL,
	[Has_PCD] [bit] NULL,
	[Monitor_Date] [datetime] NULL,
	[Is_Overlap] [bit] NULL,
	[Has_Phase_Data] [bit] NULL,
	[Has_TMC] [bit] NULL,
	[TMC_Lane_Type] [varchar](50) NULL,
	[Date_Added] [datetime] NULL,
	[Has_RLM] [bit] NULL,
	[Perm_Phase] [varchar](50) NULL,
	[Has_SplitFail] [bit] NULL,
 CONSTRAINT [PK_Graph_Detectors] PRIMARY KEY CLUSTERED 
(
	[DetectorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Action_Log]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Agency] [int] NULL,
	[Comment] [nvarchar](255) NULL,
	[SignalID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Action_Log_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApproachRouteDetail]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApproachRouteDetail](
	[ApproachRouteId] [int] NOT NULL,
	[ApproachOrder] [int] NULL,
	[SignalID] [nvarchar](10) NOT NULL,
	[Direction] [nvarchar](15) NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ApproachRouteId] ON [dbo].[ApproachRouteDetail] 
(
	[ApproachRouteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lastupdate]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lastupdate](
	[SignalID] [nvarchar](10) NOT NULL,
	[LastUpdateTime] [datetime] NULL,
	[LastErrorTime] [datetime] NULL,
 CONSTRAINT [PK_Lastupdate] PRIMARY KEY CLUSTERED 
(
	[SignalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route_Detectors]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route_Detectors](
	[DetectorID] [nvarchar](50) NOT NULL,
	[RouteID] [int] NOT NULL,
	[RouteOrder] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Graph_Detectors_SelectDetectorInfoBySignalID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Graph_Detectors_SelectDetectorInfoBySignalID]
(
	@SignalID nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT     DetectorID, SignalID, Lane, Phase, Loops, Comments, Direction, Det_Channel, IPaddr, DistanceFromStopBar, Port, MPH, Decision_Point, Region, Movement_Delay, 
                      Min_Speed_Filter, Has_Speed_Detector, Has_PCD, Monitor_Date, Is_Overlap, Has_Phase_Data, Has_TMC, TMC_Lane_Type, Date_Added, Has_RLM, Comments, Perm_Phase, Has_SplitFail
FROM         Graph_Detectors
WHERE     (SignalID = @SignalID)
GO
/****** Object:  StoredProcedure [dbo].[GetDistinctSignalandRegion]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDistinctSignalandRegion]
AS
	SET NOCOUNT ON;
SELECT DISTINCT SignalID, Region
FROM  Graph_Detectors
ORDER BY Region
GO
/****** Object:  StoredProcedure [dbo].[AllSignalsSelect]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Detector_Error]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detector_Error](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NULL,
	[DetectorID] [nvarchar](50) NOT NULL,
	[ErrorType] [int] NULL,
	[Phase] [int] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DetectorError] ON [dbo].[Detector_Error] 
(
	[DetectorID] ASC,
	[Timestamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detector_Comment]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detector_Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NOT NULL,
	[DetectorID] [nvarchar](50) NOT NULL,
	[SignalID] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Controller_Event_Log]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Controller_Event_Log](
	[SignalID] [nvarchar](10) NULL,
	[Timestamp] [datetime2](7) NULL,
	[EventCode] [int] NULL,
	[EventParam] [int] NULL
)
GO

/****** Object:  Index [IX_Clustered_Controller_Event_Log_Temp]    Script Date: 11/09/2016 12:00:38 ******/
CREATE CLUSTERED INDEX [IX_Clustered_Controller_Event_Log_Temp] ON [dbo].[Controller_Event_Log] 
(
	[Timestamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO



/****** Object:  Index [IX_Controller_Event_Log]    Script Date: 11/09/2016 12:00:43 ******/
CREATE NONCLUSTERED INDEX [IX_Controller_Event_Log] ON [dbo].[Controller_Event_Log] 
(
	[SignalID] ASC,
	[Timestamp] ASC,
	[EventCode] ASC,
	[EventParam] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO

ALTER TABLE [dbo].[Controller_Event_Log] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[Action_Log_Metrics]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Log_Metrics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Action_Log_Id] [int] NOT NULL,
	[Metric_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action_Log_Actions]    Script Date: 10/26/2016 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action_Log_Actions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Action_Log_Id] [int] NOT NULL,
	[Action_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_ApproachRouteDetailInsert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ApproachRouteDetailInsert]
(
	@RouteID int,
	@Order int,
	@SignalID nvarchar(15),
	@Direction nvarchar(15)
)
AS
	SET NOCOUNT OFF;
INSERT INTO ApproachRouteDetail
                      (ApproachRouteId, ApproachOrder, SignalID, Direction)
VALUES     (@RouteID,@Order,@SignalID,@Direction)
GO
/****** Object:  StoredProcedure [dbo].[sp_ActionLogSelectAll]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActionLogSelectAll]
AS
	SET NOCOUNT ON;
SELECT        ID, Date, Agency, Comment, SignalID, Name
FROM            Action_Log
GO
/****** Object:  StoredProcedure [dbo].[sp_ActionLogInsert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActionLogInsert]
(
	@Name nvarchar(100),
	@Date datetime,
	@Agency int,
	@Comment nvarchar(255),
	@SignalID nvarchar(10),
	@ID int OUTPUT
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Action_Log] ([Date], [Agency], [Comment], [SignalID], [Name])

VALUES (@Date, @Agency, @Comment, @SignalID, @Name) 

Set @ID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[sp_ArchiveMetricDetectors]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArchiveMetricDetectors]
(
	@StartDate datetime,
	@EndDate datetime,
	@Region int
)

as
SELECT DISTINCT
gd.SignalID,
am.DetectorID
FROM            Archived_Metrics am
JOIN			Graph_Detectors gd on am.DetectorID = gd.DetectorID
WHERE        Timestamp >= @StartDate
AND Timestamp < @EndDate
AND gd.Region = @Region
AND gd.Has_PCD = 1
Order By
gd.SignalID,
am.DetectorID
GO
/****** Object:  StoredProcedure [dbo].[sp_ArchiveMetricSignals]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArchiveMetricSignals]
(
	@StartDate datetime,
	@EndDate datetime,
	@Region int
)

as
SELECT DISTINCT
gd.SignalID,
s.Primary_Name,
s.Secondary_Name
FROM            Archived_Metrics am
JOIN			Graph_Detectors gd on am.DetectorID = gd.DetectorID
JOIN			Signals s on gd.SignalID = s.SignalID
WHERE        Timestamp >= @StartDate
AND Timestamp < @EndDate
AND gd.Region = @Region
AND gd.Has_PCD = 1
Order By
gd.SignalID
GO
/****** Object:  StoredProcedure [dbo].[sp_ArchiveMetricSelectByRegion]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArchiveMetricSelectByRegion]
(
	@StartDate datetime,
	@EndDate datetime,
	@StartHour int,
	@EndHour int,
	@daylist varchar(20),
	@Region int
)

as

SET NOCOUNT ON;

	If OBJECT_ID('#TempList') Is NOT Null
Begin
Drop Table #TempList
End

CREATE TABLE #TempList
	(
		OrderID int
	)

	DECLARE @OrderID varchar(10), @Pos int

	SET @daylist = LTRIM(RTRIM(@daylist))+ ','
	SET @Pos = CHARINDEX(',', @daylist, 1)

	IF REPLACE(@daylist, ',', '') <> ''
	BEGIN
		WHILE @Pos > 0
		BEGIN
			SET @OrderID = LTRIM(RTRIM(LEFT(@daylist, @Pos - 1)))
			IF @OrderID <> ''
			BEGIN
				INSERT INTO #TempList (OrderID) VALUES (CAST(@OrderID AS int)) --Use Appropriate conversion
			END
			SET @daylist = RIGHT(@daylist, LEN(@daylist) - @Pos)
			SET @Pos = CHARINDEX(',', @daylist, 1)

		END
	END	

SELECT 
gd.SignalID,
gd.DetectorID,     
DATEPART(YEAR, Timestamp) Year,
DATEPART(MONTH, Timestamp) Month,
DATEPART(DAY, Timestamp) Day,
DATEPART(HOUR, Timestamp) Hour, 
Sum(Volume) Volume, 
Sum(speed) Speed, 
Sum(delay) Delay, 
Sum(AoR) AoR, 
Sum(SpeedHits) SpeedHits,
Sum(BinGreenTime) BinGreenTime
FROM            Archived_Metrics am
JOIN			Graph_Detectors gd on am.DetectorID = gd.DetectorID
JOIN			Signals s on gd.SignalID = s.SignalID

WHERE        Timestamp >= @StartDate 
AND Timestamp < @EndDate 
AND DATEPART(hh,Timestamp ) >= @StartHour AND DATEPART(hh,Timestamp ) <= @EndHour 
AND datepart(dw, Timestamp ) in (select * from #tempList)
AND gd.Region = @Region
AND gd.Has_PCD = 1
Group By
gd.SignalID,
gd.DetectorID,
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)

Order By
gd.SignalID,
gd.DetectorID,
DATEPART(YEAR, Timestamp),
DATEPART(MONTH, Timestamp),
DATEPART(DAY, Timestamp),
DATEPART(HOUR, Timestamp)
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteGraphDetector]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteGraphDetector]
(
	@Original_Detector_ID nvarchar(50),
	@Original_Signal_ID nvarchar(10),
	@IsNull_Lane Int,
	@Original_Lane varchar(50),
	@Original_Phase varchar(50),
	@IsNull_Loops Int,
	@Original_Loops varchar(50),
	@IsNull_Comments Int,
	@Original_Comments varchar(50),
	@Original_Direction varchar(50),
	@Original_Det_Channel int,
	@IsNull_IPaddr Int,
	@Original_IPaddr varchar(50),
	@IsNull_DistanceFromStopBar Int,
	@Original_DistanceFromStopBar int,
	@IsNull_Port Int,
	@Original_Port bigint,
	@IsNull_MPH Int,
	@Original_MPH int,
	@IsNull_Decision_Point Int,
	@Original_Decision_Point int,
	@Original_Region int,
	@IsNull_Movement_Delay Int,
	@Original_Movement_Delay int,
	@IsNull_Min_Speed_Filter Int,
	@Original_Min_Speed_Filter int,
	@IsNull_Has_Speed_Detector Int,
	@Original_Has_Speed_Detector bit,
	@IsNull_Has_PCD Int,
	@Original_Has_PCD bit,
	@IsNull_Monitor_Date Int,
	@Original_Monitor_Date datetime,
	@IsNull_Has_Phase_Data Int,
	@Original_Has_Phase_Data bit,
	@IsNull_Is_Overlap Int,
	@Original_Is_Overlap bit,
	@IsNull_Has_TMC Int,
	@Original_Has_TMC bit,
	@IsNull_TMC_Lane_Type Int,
	@Original_TMC_Lane_Type varchar(50)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Graph_Detectors] WHERE (([DetectorID] = @Original_Detector_ID) AND ([SignalID] = @Original_Signal_ID) AND ((@IsNull_Lane = 1 AND [Lane] IS NULL) OR ([Lane] = @Original_Lane)) AND ([Phase] = @Original_Phase) AND ((@IsNull_Loops = 1 AND [Loops] IS NULL) OR ([Loops] = @Original_Loops)) AND ((@IsNull_Comments = 1 AND [Comments] IS NULL) OR ([Comments] = @Original_Comments)) AND ([Direction] = @Original_Direction) AND ([Det_Channel] = @Original_Det_Channel) AND ((@IsNull_IPaddr = 1 AND [IPaddr] IS NULL) OR ([IPaddr] = @Original_IPaddr)) AND ((@IsNull_DistanceFromStopBar = 1 AND [DistanceFromStopBar] IS NULL) OR ([DistanceFromStopBar] = @Original_DistanceFromStopBar)) AND ((@IsNull_Port = 1 AND [Port] IS NULL) OR ([Port] = @Original_Port)) AND ((@IsNull_MPH = 1 AND [MPH] IS NULL) OR ([MPH] = @Original_MPH)) AND ((@IsNull_Decision_Point = 1 AND [Decision_Point] IS NULL) OR ([Decision_Point] = @Original_Decision_Point)) AND ([Region] = @Original_Region) AND ((@IsNull_Movement_Delay = 1 AND [Movement_Delay] IS NULL) OR ([Movement_Delay] = @Original_Movement_Delay)) AND ((@IsNull_Min_Speed_Filter = 1 AND [Min_Speed_Filter] IS NULL) OR ([Min_Speed_Filter] = @Original_Min_Speed_Filter)) AND ((@IsNull_Has_Speed_Detector = 1 AND [Has_Speed_Detector] IS NULL) OR ([Has_Speed_Detector] = @Original_Has_Speed_Detector)) AND ((@IsNull_Has_PCD = 1 AND [Has_PCD] IS NULL) OR ([Has_PCD] = @Original_Has_PCD)) AND ((@IsNull_Monitor_Date = 1 AND [Monitor_Date] IS NULL) OR ([Monitor_Date] = @Original_Monitor_Date)) AND ((@IsNull_Has_Phase_Data = 1 AND [Has_Phase_Data] IS NULL) OR ([Has_Phase_Data] = @Original_Has_Phase_Data)) AND ((@IsNull_Is_Overlap = 1 AND [Is_Overlap] IS NULL) OR ([Is_Overlap] = @Original_Is_Overlap)) AND ((@IsNull_Has_TMC = 1 AND [Has_TMC] IS NULL) OR ([Has_TMC] = @Original_Has_TMC)) AND ((@IsNull_TMC_Lane_Type = 1 AND [TMC_Lane_Type] IS NULL) OR ([TMC_Lane_Type] = @Original_TMC_Lane_Type)))
GO
/****** Object:  StoredProcedure [dbo].[SP_DistinctDetector]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DistinctDetector]
(
	@SignalID nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT DetectorID, Phase, Direction, DistanceFromStopBar, MPH, Decision_Point, Movement_Delay, Min_Speed_Filter, Det_Channel, Region, Monitor_Date, Has_PCD, Has_Phase_Data, Has_Speed_Detector, Has_TMC 
FROM  Graph_Detectors
WHERE (SignalID = @SignalID)
GO
/****** Object:  StoredProcedure [dbo].[sp_GraphDetectorsSelectBySignal]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GraphDetectorsSelectBySignal]
(
	@SignalId nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT        DetectorID
FROM            Graph_Detectors
WHERE        (SignalID = @SignalId)
AND			Has_PCD = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_GraphDetectorsRLMDistinctPhases]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Derek Lowe
-- Create date: 4/21/15
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GraphDetectorsRLMDistinctPhases] 
	@SignalId nvarchar(10)
AS
BEGIN

Declare @_SignalId nvarchar(10)

set @_SignalId = @SignalId

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Phase, Direction, Is_Overlap, Perm_Phase
FROM Graph_Detectors AS g with (NOLOCK)
WHERE (SignalID = @_SignalId AND Has_RLM = 1)
group by Phase, Direction, Is_Overlap, Perm_Phase
ORDER BY Phase
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GraphDetectors_UpdateByDetectorID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GraphDetectors_UpdateByDetectorID]
(
	@SignalID nvarchar(10),
	@Phase varchar(50),
	@Lane varchar(50),
	@Loops varchar(50),
	@Comments varchar(500),
	@Direction varchar(50),
	@Det_Channel int,
	@IPAddr varchar(50),
	@DistanceFromStopBar int,
	@Port bigint,
	@MPH int,
	@Decision_Point int,
	@Region int,
	@Movement_Delay int,
	@Min_Speed_Filter int,
	@Has_Speed bit,
	@Has_PCD bit,
	@Monitor_Date datetime,
	@Is_Overlap bit,
	@Has_Pahse_Data bit,
	@Has_TMC bit,
	@TMC_Lane_Type varchar(50),
	@Date_Added datetime,
	@DetectorID nvarchar (50),
	@Has_RLM bit,
	@Perm_Phase varchar(50),
	@Has_SplitFail bit
)
AS
	SET NOCOUNT OFF;
UPDATE    Graph_Detectors
SET              SignalID = @SignalID, Phase = @Phase, Lane = @Lane, Loops = @Loops, Comments = @Comments, Direction = @Direction, Det_Channel = @Det_Channel, 
                      IPaddr = @IPAddr, DistanceFromStopBar = @DistanceFromStopBar, Port = @Port, MPH = @MPH, Decision_Point = @Decision_Point, Region = @Region, 
                      Movement_Delay = @Movement_Delay, Min_Speed_Filter = @Min_Speed_Filter, Has_Speed_Detector = @Has_Speed, Has_PCD = @Has_PCD, 
                      Monitor_Date = @Monitor_Date, Is_Overlap = @Is_Overlap, Has_Phase_Data = @Has_Pahse_Data, Has_TMC = @Has_TMC, 
                      TMC_Lane_Type = @TMC_Lane_Type, Date_Added = @Date_Added, Has_RLM = @Has_RLM, Perm_Phase = @Perm_Phase, Has_SplitFail = @Has_SplitFail
WHERE     (DetectorID = @DetectorID)
GO
/****** Object:  StoredProcedure [dbo].[sp_Graph_Detectors_SelectByDetectorID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Graph_Detectors_SelectByDetectorID]
(
	@DetectorID nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT     DetectorID, SignalID, Lane, Phase, Loops, Comments, Direction, Det_Channel, IPaddr, DistanceFromStopBar, Port, MPH, Decision_Point, Region, Movement_Delay, 
                      Min_Speed_Filter, Has_Speed_Detector, Has_PCD, Monitor_Date, Is_Overlap, Has_Phase_Data, Has_TMC, TMC_Lane_Type, Date_Added, Has_RLM, Perm_Phase, Has_SplitFail
FROM         Graph_Detectors
WHERE     (DetectorID = @DetectorID)
GO
/****** Object:  StoredProcedure [dbo].[sp_Graph_Detectors_DeletebyDetectorID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Graph_Detectors_DeletebyDetectorID]
(
	@DetectorID nvarchar(50)
)
AS
	SET NOCOUNT OFF;
DELETE FROM Graph_Detectors
WHERE     (DetectorID = @DetectorID)
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllGraphDetectors]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllGraphDetectors]
AS
	SET NOCOUNT ON;
SELECT DetectorID, SignalID, Lane, Phase, Loops, Comments, Direction, Det_Channel, IPaddr, DistanceFromStopBar, Port, MPH, Decision_Point, Region, 
               Movement_Delay, Min_Speed_Filter, Has_Speed_Detector, Has_PCD, Monitor_Date, Has_Phase_Data, Is_Overlap, Has_TMC, TMC_Lane_Type, Date_Added, Has_RLM, Perm_Phase
FROM  Graph_Detectors
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllGraphDetectorIDs]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllGraphDetectorIDs]
AS
	SET NOCOUNT ON;
SELECT DetectorID
FROM  Graph_Detectors
Where Has_PCD = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Unique_Regions]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Get_Unique_Regions]
AS
	SET NOCOUNT ON;
SELECT DISTINCT Region
FROM  Graph_Detectors
GO
/****** Object:  StoredProcedure [dbo].[SP_PDCDetectorsBySignalAndDirectionOLD]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PDCDetectorsBySignalAndDirectionOLD]
(
	@SignalID nvarchar(10),
	@Direction varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT DetectorID, TMC_Lane_Type, Has_TMC, SignalID, Phase, Direction, Det_Channel
FROM  Graph_Detectors
WHERE (Has_PCD = 1) AND (SignalID = @SignalID) AND (Direction = @Direction)
GO
/****** Object:  StoredProcedure [dbo].[SP_PDCDetectorsBySignalAndDirection]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PDCDetectorsBySignalAndDirection]
(
	@SignalID nvarchar(10),
	@Direction varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT DetectorID, TMC_Lane_Type, Has_TMC, SignalID, Phase, Direction, Det_Channel, Region, Movement_Delay, Decision_Point, MPH, Port, DistanceFromStopBar
FROM  Graph_Detectors
WHERE (SignalID = @SignalID) AND (Direction = @Direction) AND (Has_PCD = 1)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewGraphDetector]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertNewGraphDetector]
(
	@DetectorID nvarchar(50),
	@SignalID nvarchar(10),
	@Lane varchar(50),
	@Phase varchar(50),
	@Loops varchar(50),
	@Comments varchar(50),
	@Direction varchar(50),
	@Det_Channel int,
	@IPaddr varchar(50),
	@DistanceFromStopBar int,
	@Port bigint,
	@MPH int,
	@Decision_Point int,
	@Region int,
	@Movement_Delay int,
	@Min_Speed_Filter int,
	@Has_Speed_Detector bit,
	@Has_PCD bit,
	@Monitor_Date datetime,
	@Has_Phase_Data bit,
	@Is_Overlap bit,
	@Has_TMC bit,
	@TMC_Lane_Type varchar(50),
	@Date_Added datetime,
	@Has_RLM bit,
	@Perm_Phase varchar (50), 
	@Has_SplitFail bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Graph_Detectors] ([DetectorID], [SignalID], [Lane], [Phase], [Loops], [Comments], [Direction], [Det_Channel], [IPaddr], [DistanceFromStopBar], [Port], [MPH], [Decision_Point], [Region], [Movement_Delay], [Min_Speed_Filter], [Has_Speed_Detector], [Has_PCD], [Monitor_Date], [Has_Phase_Data], [Is_Overlap], [Has_TMC], [TMC_Lane_Type], [Date_Added], [Has_RLM], [Perm_Phase], [Has_SplitFail]) VALUES (@DetectorID, @SignalID, @Lane, @Phase, @Loops, @Comments, @Direction, @Det_Channel, @IPaddr, @DistanceFromStopBar, @Port, @MPH, @Decision_Point, @Region, @Movement_Delay, @Min_Speed_Filter, @Has_Speed_Detector, @Has_PCD, @Monitor_Date, @Has_Phase_Data, @Is_Overlap, @Has_TMC, @TMC_Lane_Type, @Date_Added, @Has_RLM, @Perm_Phase, @Has_SplitFail);
	
SELECT DetectorID, SignalID, Lane, Phase, Loops, Comments, Direction, Det_Channel, IPaddr, DistanceFromStopBar, Port, MPH, Decision_Point, Region, Movement_Delay, Min_Speed_Filter, Has_Speed_Detector, Has_PCD, Monitor_Date, Has_Phase_Data, Is_Overlap, Has_TMC, TMC_Lane_Type, Date_Added, Perm_Phase, Has_SplitFail FROM Graph_Detectors WHERE (DetectorID = @DetectorID)
GO
/****** Object:  StoredProcedure [dbo].[SP_RLMDetectorsBySignalAndDirection]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RLMDetectorsBySignalAndDirection]
(
	@SignalID nvarchar(10),
	@Direction varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT DetectorID, TMC_Lane_Type, Has_TMC, SignalID, Phase, Direction, Det_Channel, Region, Movement_Delay, Decision_Point, MPH, Port, DistanceFromStopBar
FROM  Graph_Detectors
WHERE (Has_RLM = 1) AND(SignalID = @SignalID) AND (Direction = @Direction)
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectAllSignals]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectAllSignals]
AS
	SET NOCOUNT ON;
SELECT DISTINCT 
 Signals.SignalId, 
 Signals.Primary_Name, 
 Signals.Secondary_Name, 
 Signals.SignalId + ' - ' + Signals.Primary_Name + ' ' + Signals.Secondary_Name AS Location, 
 Signals.IP_Address, 
 Signals.Latitude, 
 Signals.Longitude, 
 Signals.Region, 
 
 Case when(Select count(*)
 from Graph_Detectors 
 where SignalID = Signals.SignalID
 and Has_Phase_Data = 1)> 0 then 1 else 0 end Has_Phase_Data,
 
  Case when(Select count(*)
 from Graph_Detectors 
 where SignalID = Signals.SignalID
 and Has_RLM = 1)> 0 then 1 else 0 end Has_RLM,
 
 Case when(Select count(*)
 from Graph_Detectors 
 where SignalID = Signals.SignalID
 and Has_TMC = 1)> 0 then 1 else 0 end Has_TMC,
 
 Case when(Select count(*)
 from Graph_Detectors 
 where SignalID = Signals.SignalID
 and Has_PCD = 1)> 0 then 1 else 0 end Has_PCD, 
                         
 Case when(Select count(*)
 from Graph_Detectors 
 where SignalID = Signals.SignalID
 

 
 and Has_Speed_Detector = 1)> 0 then 1 else 0 end Has_Speed_Detector,
  Case when(Select count(*)
 from Graph_Detectors 
 where SignalID = Signals.SignalID 
 and Has_SplitFail = 1)> 0 then 1 else 0 end Has_Split_Fail
FROM            Signals 
JOIN Graph_Detectors on Graph_Detectors.SignalID = Signals.SignalID
ORDER BY Signals.SignalID
GO
/****** Object:  StoredProcedure [dbo].[sp_SignalsSelectByRegion]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SignalsSelectByRegion]
(
	@Region int
)

as
SELECT Distinct     
signals.SignalID,
Primary_Name,
Secondary_Name
From Signals
Join Graph_Detectors on signals.SignalID = Graph_Detectors.SignalID
Where signals.Region = @Region
and Graph_Detectors.has_pcd =1
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDistinctPhasesBySignal]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectDistinctPhasesBySignal]
(
	@SignalID nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT DISTINCT Phase, Direction, Det_Channel, Is_Overlap,
	((DistanceFromStopBar/(MPH*1.467))-Decision_Point)*1000 as offset
FROM            Graph_Detectors AS g with (NOLOCK)
WHERE        (SignalID = @SignalID) and MPH > 0
ORDER BY Phase
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectRLMDetectorsBySignal]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectRLMDetectorsBySignal]
(
	@SignalID varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT     DetectorID, SignalID, Phase, TMC_Lane_Type, Has_TMC, Direction, Det_Channel
                      Region, Movement_Delay, Decision_Point, MPH, Port, DistanceFromStopBar, IPaddr, Det_Channel, Comments, Loops
FROM         Graph_Detectors
WHERE     (Has_RLM = 1) AND (SignalID = @SignalID)
GO
/****** Object:  StoredProcedure [dbo].[sp_Signals_Delete]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Signals_Delete]
(
	@Original_Signal_Id nvarchar(10)

)
AS

declare @Orig_Signal_Id nvarchar(10)
set @Orig_Signal_Id = @Original_Signal_Id

	SET NOCOUNT OFF;
DELETE FROM [Graph_Detectors] Where	([SignalID] = @Orig_Signal_Id)

DELETE FROM [Signals] WHERE ([SignalID] = @Orig_Signal_Id)
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectTMCDetectorsBySignal]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectTMCDetectorsBySignal]
(
	@SignalID varchar(10)
)
AS
	SET NOCOUNT ON;
SELECT     DetectorID, SignalID, Phase, TMC_Lane_Type, Has_TMC, Direction, Det_Channel
                      Region, Movement_Delay, Decision_Point, MPH, Port, DistanceFromStopBar, IPaddr, Det_Channel, Comments, Loops
FROM         Graph_Detectors
WHERE     (Has_TMC = 1) AND (SignalID = @SignalID)
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSignals]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectSignals]
(
	@Region int
)
AS
	SET NOCOUNT ON;
SELECT        distinct SignalID
FROM            Graph_Detectors
WHERE        (Region = @Region)
order by SignalID
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateGraphDetector]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateGraphDetector]
(
	@DetectorID nvarchar(50),
	@SignalID varchar(10),
	@Lane varchar(50),
	@Phase varchar(50),
	@Loops varchar(50),
	@Comments varchar(50),
	@Direction varchar(50),
	@Det_Channel int,
	@IPaddr varchar(50),
	@DistanceFromStopBar int,
	@Port bigint,
	@MPH int,
	@Decision_Point int,
	@Region int,
	@Movement_Delay int,
	@Min_Speed_Filter int,
	@Has_Speed_Detector bit,
	@Has_PCD bit,
	@Monitor_Date datetime,
	@Has_Phase_Data bit,
	@Is_Overlap bit,
	@Has_TMC bit,
	@TMC_Lane_Type varchar(50),
	@Original_Detector_ID nvarchar(50),
	@Original_Signal_ID nvarchar(10),
	@IsNull_Lane Int,
	@Original_Lane varchar(50),
	@Original_Phase varchar(50),
	@IsNull_Loops Int,
	@Original_Loops varchar(50),
	@IsNull_Comments Int,
	@Original_Comments varchar(50),
	@Original_Direction varchar(50),
	@Original_Det_Channel int,
	@IsNull_IPaddr Int,
	@Original_IPaddr varchar(50),
	@IsNull_DistanceFromStopBar Int,
	@Original_DistanceFromStopBar int,
	@IsNull_Port Int,
	@Original_Port bigint,
	@IsNull_MPH Int,
	@Original_MPH int,
	@IsNull_Decision_Point Int,
	@Original_Decision_Point int,
	@Original_Region int,
	@IsNull_Movement_Delay Int,
	@Original_Movement_Delay int,
	@IsNull_Min_Speed_Filter Int,
	@Original_Min_Speed_Filter int,
	@IsNull_Has_Speed_Detector Int,
	@Original_Has_Speed_Detector bit,
	@IsNull_Has_PCD Int,
	@Original_Has_PCD bit,
	@IsNull_Monitor_Date Int,
	@Original_Monitor_Date datetime,
	@IsNull_Has_Phase_Data Int,
	@Original_Has_Phase_Data bit,
	@IsNull_Is_Overlap Int,
	@Original_Is_Overlap bit,
	@IsNull_Has_TMC Int,
	@Original_Has_TMC bit,
	@IsNull_TMC_Lane_Type Int,
	@Original_TMC_Lane_Type varchar(50)
)
AS
	SET NOCOUNT OFF;
UPDATE [Graph_Detectors] SET [DetectorID] = @DetectorID, [SignalID] = @SignalID, [Lane] = @Lane, [Phase] = @Phase, [Loops] = @Loops, [Comments] = @Comments, [Direction] = @Direction, [Det_Channel] = @Det_Channel, [IPaddr] = @IPaddr, [DistanceFromStopBar] = @DistanceFromStopBar, [Port] = @Port, [MPH] = @MPH, [Decision_Point] = @Decision_Point, [Region] = @Region, [Movement_Delay] = @Movement_Delay, [Min_Speed_Filter] = @Min_Speed_Filter, [Has_Speed_Detector] = @Has_Speed_Detector, [Has_PCD] = @Has_PCD, [Monitor_Date] = @Monitor_Date, [Has_Phase_Data] = @Has_Phase_Data, [Is_Overlap] = @Is_Overlap, [Has_TMC] = @Has_TMC, [TMC_Lane_Type] = @TMC_Lane_Type WHERE (([DetectorID] = @Original_Detector_ID) AND ([SignalID] = @Original_Signal_ID) AND ((@IsNull_Lane = 1 AND [Lane] IS NULL) OR ([Lane] = @Original_Lane)) AND ([Phase] = @Original_Phase) AND ((@IsNull_Loops = 1 AND [Loops] IS NULL) OR ([Loops] = @Original_Loops)) AND ((@IsNull_Comments = 1 AND [Comments] IS NULL) OR ([Comments] = @Original_Comments)) AND ([Direction] = @Original_Direction) AND ([Det_Channel] = @Original_Det_Channel) AND ((@IsNull_IPaddr = 1 AND [IPaddr] IS NULL) OR ([IPaddr] = @Original_IPaddr)) AND ((@IsNull_DistanceFromStopBar = 1 AND [DistanceFromStopBar] IS NULL) OR ([DistanceFromStopBar] = @Original_DistanceFromStopBar)) AND ((@IsNull_Port = 1 AND [Port] IS NULL) OR ([Port] = @Original_Port)) AND ((@IsNull_MPH = 1 AND [MPH] IS NULL) OR ([MPH] = @Original_MPH)) AND ((@IsNull_Decision_Point = 1 AND [Decision_Point] IS NULL) OR ([Decision_Point] = @Original_Decision_Point)) AND ([Region] = @Original_Region) AND ((@IsNull_Movement_Delay = 1 AND [Movement_Delay] IS NULL) OR ([Movement_Delay] = @Original_Movement_Delay)) AND ((@IsNull_Min_Speed_Filter = 1 AND [Min_Speed_Filter] IS NULL) OR ([Min_Speed_Filter] = @Original_Min_Speed_Filter)) AND ((@IsNull_Has_Speed_Detector = 1 AND [Has_Speed_Detector] IS NULL) OR ([Has_Speed_Detector] = @Original_Has_Speed_Detector)) AND ((@IsNull_Has_PCD = 1 AND [Has_PCD] IS NULL) OR ([Has_PCD] = @Original_Has_PCD)) AND ((@IsNull_Monitor_Date = 1 AND [Monitor_Date] IS NULL) OR ([Monitor_Date] = @Original_Monitor_Date)) AND ((@IsNull_Has_Phase_Data = 1 AND [Has_Phase_Data] IS NULL) OR ([Has_Phase_Data] = @Original_Has_Phase_Data)) AND ((@IsNull_Is_Overlap = 1 AND [Is_Overlap] IS NULL) OR ([Is_Overlap] = @Original_Is_Overlap)) AND ((@IsNull_Has_TMC = 1 AND [Has_TMC] IS NULL) OR ([Has_TMC] = @Original_Has_TMC)) AND ((@IsNull_TMC_Lane_Type = 1 AND [TMC_Lane_Type] IS NULL) OR ([TMC_Lane_Type] = @Original_TMC_Lane_Type)));
	
SELECT DetectorID, SignalID, Lane, Phase, Loops, Comments, Direction, Det_Channel, IPaddr, DistanceFromStopBar, Port, MPH, Decision_Point, Region, Movement_Delay, Min_Speed_Filter, Has_Speed_Detector, Has_PCD, Monitor_Date, Has_Phase_Data, Is_Overlap, Has_TMC, TMC_Lane_Type FROM Graph_Detectors WHERE (DetectorID = @DetectorID)
GO
/****** Object:  StoredProcedure [dbo].[sp_TMCVolume]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_TMCVolume]
@StartDate datetime,
@EndDate datetime,
@SignalId nvarchar(10),
@Phase int

AS

declare @Channels Table(channel int)
insert into @Channels  

Select Det_Channel 
from Graph_Detectors
Where SignalID = @SignalId
AND Phase = @Phase
AND Has_TMC= 1

select  Count(TimeStamp)
from dbo.Controller_Event_Log with (NOLOCK)
where TimeStamp between @StartDate and @EndDate
and SignalID = @SignalId
and EventParam in (select * from @Channels)
and EventCode = 82
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSignalPhaseDataByDateDevicePhase]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_SelectSignalPhaseDataByDateDevicePhase]
@StartDate datetime,
@EndDate datetime,
@SignalId nvarchar(10),
@EventData1 int

AS

declare @_StartDate datetime
declare @_EndDate datetime
declare @_SignalId nvarchar(10)
declare @_EventData1 int

set @_StartDate = @StartDate
set @_EndDate = @EndDate
set @_SignalId = @SignalId
set @_EventData1 = @EventData1

SELECT TimeStamp, EventCode, EventParam
FROM dbo.Controller_Event_Log with (NOLOCK)
WHERE (TimeStamp BETWEEN @_StartDate AND @_EndDate) 
AND (SignalId = @_SignalId) 
AND (EventParam = @_EventData1)
AND EventCode in (1,8,10)
ORDER BY TimeStamp
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSignalOverlapDataByDateDevicePhase]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_SelectSignalOverlapDataByDateDevicePhase]
@StartDate datetime,
@EndDate datetime,
@SignalId nvarchar(10),
@EventData1 int

AS

declare @_StartDate datetime
declare @_EndDate datetime
declare @_SignalId nvarchar(10)
declare @_EventData1 int

set @_StartDate = @StartDate
set @_EndDate = @EndDate
set @_SignalId = @SignalId
set @_EventData1 = @EventData1

SELECT TimeStamp, EventCode, EventParam
FROM dbo.Controller_Event_Log with (NOLOCK)
WHERE (TimeStamp BETWEEN @_StartDate AND @_EndDate) 
AND (SignalId = @_SignalId) 
AND (EventParam = @_EventData1)
AND EventCode in (62,63,64)
ORDER BY TimeStamp
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPatternChangeV2]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectPatternChangeV2]
(
	@StartDate datetime,
	@EndDate datetime,
	@SignalId nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT TimeStamp as TimeStamp, EventParam
FROM dbo.Controller_Event_Log with (NOLOCK)
WHERE (TimeStamp BETWEEN @StartDate AND @EndDate)
AND (SignalID = @SignalId)
and EventCode in (131)
Order by Timestamp
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPatternChange]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectPatternChange]
(
	@StartDate datetime,
	@EndDate datetime,
	@SignalId  nvarchar(10)
)
AS
declare @_SignalID nvarchar(10)
declare	@_StartTime datetime
declare	@_EndTime datetime

set @_SignalID = @SignalID
set @_StartTime = @StartDate
set @_EndTime = @EndDate

	SET NOCOUNT ON;
SELECT TimeStamp as TimeStamp, EventParam
FROM dbo.Controller_Event_Log with (NOLOCK)
WHERE (TimeStamp BETWEEN @_StartTime AND @_EndTime)
AND (SignalID = @_SignalID)
and EventCode in (131)
Order by Timestamp
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDetectorOccupancyDataByDateDeviceChannel]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectDetectorOccupancyDataByDateDeviceChannel]
(
	@StartDate datetime,
	@EndDate datetime,
	@SignalID nvarchar(10),
	@Channel int
	
)
AS

declare @_StartDate datetime
declare	@_EndDate datetime
declare	@_SignalID nvarchar(10)
declare	@_Channel int

	
set @_StartDate = @StartDate
set @_EndDate = @EndDate
set @_SignalID = @SignalID
set @_Channel = @Channel

	SET NOCOUNT ON;
select TimeStamp, EventCode, EventParam
from dbo.Controller_Event_Log with (NOLOCK)
where TimeStamp >= @_StartDate and TimeStamp <= @_EndDate
and SignalID = @_SignalID
and EventParam = @_Channel
and EventCode in (81,82)
Order by timestamp
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDetectorDataByDateDeviceChannel]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectDetectorDataByDateDeviceChannel]
(
	@StartDate datetime,
	@EndDate datetime,
	@SignalID nvarchar(10),
	@Channel int,
	@Offset int
)
AS

declare @_StartDate datetime
declare	@_EndDate datetime
declare	@_SignalID nvarchar(10)
declare	@_Channel int
declare	@_Offset int
	
set @_StartDate = @StartDate
set @_EndDate = @EndDate
set @_SignalID = @SignalID
set @_Channel = @Channel
set @_Offset = @Offset

	SET NOCOUNT ON;
select DateAdd(MILLISECOND, @_Offset, Timestamp) as TimeStamp
from dbo.Controller_Event_Log with (NOLOCK)
where TimeStamp between @_StartDate and @_EndDate
and SignalID = @_SignalID
and EventParam = @_Channel
and EventCode = 82
GO
/****** Object:  StoredProcedure [dbo].[sp_RouteDetectorsSelectByRegion]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RouteDetectorsSelectByRegion]
(
	@Region int
)
AS
	SET NOCOUNT ON;
Select r.RouteId, rd.DetectorID, rd.RouteOrder
From Route r
Join Route_Detectors rd on r.RouteId = rd.RouteId
Where Region = @Region
GO
/****** Object:  StoredProcedure [dbo].[sp_RouteDetectorsInsert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RouteDetectorsInsert]
(
	@Route int,
	@Detector nvarchar(50),
	@RouteOrder int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Route_Detectors] ([DetectorID], [RouteID], [RouteOrder]) VALUES (@Detector, @Route,  @RouteOrder)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAlertAggregate]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Derek Lowe
-- Create date: 1/15/2013
-- Description:	Inserts data into Alert_Aggregate Table. 
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertAlertAggregate]
	@StartDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
Declare  @EndDate datetime;
Set @EndDate = DATEADD(DAY, 1, @StartDate);

Insert Into Alert_Aggregate (Detector_ID, Signal_ID, Det_Channel, Has_Speed_Detector,
Has_PCD, SpeedAVG, SpeedHitCount, PlanChangeCount, DetHitCount, DayType, Timestamp)
Select gd.Detector_ID, gd.Signal_ID, gd.det_channel , gd.Has_Speed_Detector, gd.Has_PCD,
 Avg(se.MPH) SpeedAVG, Count(se.DetectorId) SpeedHitCount, 
(select count(*) from Controller_Event_Log with (nolock) where gd.signal_id = signalid
and gd.det_channel = eventParam
and TimeStamp between @StartDate and @EndDate
and eventcode = 131) as PlanChange,

(select count(*) from Controller_Event_Log with (nolock) where gd.signal_id = signalid
and gd.det_channel = eventParam
and TimeStamp between @StartDate and @EndDate
and eventcode = 82) as DetHitCount,
datepart(dw, @StartDate)as Daytype,
@StartDate as TimeStamp

From Graph_Detectors gd with (nolock)
Left join Speed_Events se with (nolock)on Convert(varchar(8),gd.detector_Id) = se.DetectorId
and se.TimeStamp between @StartDate and @EndDate

Group by gd.Detector_ID, gd.Signal_ID, gd.det_channel, gd.Has_Speed_Detector, gd.Has_PCD
Order by gd.Detector_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GraphDetectorsSelectWithComment]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GraphDetectorsSelectWithComment]
AS
	SET NOCOUNT ON;
SELECT        gd.SignalID, 
sig.Primary_Name + ' ' + sig.Secondary_Name Location, 
gd.DetectorID, 
gd.Monitor_Date,
(SELECT        TOP (1) Comment
FROM            Detector_Comment
ORDER BY Date DESC) AS Comment, 
gd.Direction, 
gd.Lane, 
gd.Has_Speed_Detector, 
gd.Has_PCD, 
gd.IPaddr
FROM Graph_Detectors gd 
LEFT OUTER JOIN Signals sig on gd.SignalID = sig.SignalID
ORDER BY gd.SignalID
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertIntoController_Event_Log]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shane Johnson
-- Create date: August 22 2012
-- Description:	Inserts data into the controller_Event_Log Table
--				Used by the ProccessASC3logs program
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertIntoController_Event_Log]
(
	@SignalID nvarchar(10),
	@Timestamp datetime,
	@EventCode int,
	@EventParam int
)
AS
BEGIN
	
Insert Controller_Event_Log	(SignalID, Timestamp, EventCode, EventParam) 
	Values (@SignalID, @Timestamp, @EventCode, @EventParam)
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDetectorError]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertDetectorError]
(
	
	@DetectorID nvarchar(50),
	@ErrorType int
	
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Detector_Error] ( [DetectorID], [ErrorType]) VALUES ( @DetectorID, @ErrorType)
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Detector_Errors]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Get_Detector_Errors]
(
	@starttime datetime,
	@endtime datetime
)
AS
	SET NOCOUNT ON;
SELECT ErrorID, Timestamp, DetectorID, ErrorType
FROM  Detector_Error
WHERE (Timestamp BETWEEN @starttime AND @endtime)
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRouteNonMembers]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetRouteNonMembers]
(
	@RouteID int
)
AS
	SET NOCOUNT ON;
SELECT    Graph_Detectors.DetectorID, Graph_Detectors.SignalID, Graph_Detectors.Lane, Graph_Detectors.Phase, Graph_Detectors.Loops, Graph_Detectors.Comments, 
                      Graph_Detectors.Direction, Graph_Detectors.IPaddr, Graph_Detectors.DistanceFromStopBar, Graph_Detectors.Det_Channel, Graph_Detectors.Port, 
                      Graph_Detectors.MPH, Graph_Detectors.Decision_Point, Graph_Detectors.Region, Graph_Detectors.Min_Speed_Filter, Graph_Detectors.Movement_Delay, 
                      Graph_Detectors.Has_Speed_Detector, Graph_Detectors.Has_PCD, Graph_Detectors.Monitor_Date, Graph_Detectors.Is_Overlap, Graph_Detectors.Has_Phase_Data, 
                      Graph_Detectors.Has_TMC, Graph_Detectors.TMC_Lane_Type, 0 as RouteOrder
FROM         Graph_Detectors
WHERE    Graph_Detectors.Has_PCD = 1 AND (DetectorID NOT IN
                          (SELECT     DetectorID
                            FROM          Route_Detectors
                            WHERE      (RouteID = @RouteID)))
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRouteMembers]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetRouteMembers]
(
	@RouteID int
)
AS
	SET NOCOUNT ON;
SELECT     Graph_Detectors.DetectorID, Graph_Detectors.SignalID, Graph_Detectors.Lane, Graph_Detectors.Phase, Graph_Detectors.Loops, Graph_Detectors.Comments, 
                      Graph_Detectors.Direction, Graph_Detectors.IPaddr, Graph_Detectors.DistanceFromStopBar, Graph_Detectors.Det_Channel, Graph_Detectors.Port, 
                      Graph_Detectors.MPH, Graph_Detectors.Decision_Point, Graph_Detectors.Region, Graph_Detectors.Min_Speed_Filter, Graph_Detectors.Movement_Delay, 
                      Graph_Detectors.Has_Speed_Detector, Graph_Detectors.Has_PCD, Graph_Detectors.Monitor_Date, Graph_Detectors.Is_Overlap, Graph_Detectors.Has_Phase_Data, 
                      Graph_Detectors.Has_TMC, Graph_Detectors.TMC_Lane_Type, Route_Detectors.RouteOrder
FROM         Graph_Detectors INNER JOIN
                      Route_Detectors ON Graph_Detectors.DetectorID = Route_Detectors.DetectorID
WHERE     (Route_Detectors.RouteID = @RouteID)
ORDER BY Route_Detectors.RouteOrder
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPreviousPatternByDateV2]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetPreviousPatternByDateV2]
(
	@StartDate datetime,
	@SignalId nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT Top 1 EventParam
FROM dbo.Controller_Event_Log with (NOLOCK)
WHERE TimeStamp between DATEADD(day,-1,@StartDate) and @StartDate
AND (SignalID = @SignalId)
and EventCode in (131)
ORDER BY TimeStamp desc
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPreviousPatternByDate]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetPreviousPatternByDate]
(
	@StartDate datetime,
	@SignalID nvarchar(10)
)
AS
declare @_SignalID nvarchar(10)
declare	@_StartTime datetime
declare	@_EndTime datetime

set @_SignalID = @SignalID
set @_StartTime = @StartDate
set @_EndTime = DATEADD(day,-1,@_StartTime)
	SET NOCOUNT ON;
SELECT Top 1 EventParam
FROM dbo.Controller_Event_Log with (NOLOCK)
WHERE TimeStamp <= @_StartTime and Timestamp >= @_EndTime
AND (SignalID = @_SignalID)
and EventCode in (131)
ORDER BY TimeStamp desc
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPhaseTermination]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetPhaseTermination]
(
	@StartTime datetime,
	@EndTime datetime,
	@signalID nvarchar(10)
)
AS
declare @_StartTime datetime
declare	@_EndTime datetime
declare	@_signalID nvarchar(10)

Set @_StartTime = @StartTime
Set @_EndTime = @EndTime
Set @_signalID = @signalID
	
	SET NOCOUNT ON;
SELECT SignalID, Timestamp, EventCode, EventParam
FROM  Controller_Event_Log
WHERE (Timestamp BETWEEN @_StartTime AND @_EndTime) AND (SignalID = @_signalID) AND (EventCode IN (1,11,4, 5, 6, 21, 23))
Order by Timestamp
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDistinctAnalysisPhases]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetDistinctAnalysisPhases]
(
	@SignalID nvarchar(10),
	@StartTime datetime,
	@EndTime datetime
)
AS
declare @_SignalID nvarchar(10)
declare	@_StartTime datetime
declare	@_EndTime datetime

set @_SignalID = @SignalID
set @_StartTime = @StartTime
set @_EndTime = @EndTime

	SET NOCOUNT ON;
SELECT DISTINCT EventParam
FROM  Controller_Event_Log
WHERE (SignalID = @_SignalID) AND (Timestamp BETWEEN @_StartTime AND @_EndTime) AND (EventCode = 1)
ORDER BY EventParam
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCoordPatternValues]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCoordPatternValues]
(
	@signalID nvarchar(10),
	@startTime datetime

)
AS
	SET NOCOUNT ON;
SELECT SignalID, Timestamp, EventCode, EventParam
FROM  Controller_Event_Log
WHERE (SignalID = @signalID) AND (Timestamp BETWEEN @startTime AND DATEADD(second, 2, @starttime)) AND (EventCode > 130 AND EventCode < 150)
order by timestamp
GO
/****** Object:  StoredProcedure [dbo].[sp_DetectorErrorSelectByDetectorDate]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetectorErrorSelectByDetectorDate]
(
	@DetectorID nvarchar(50),
	@StartDate datetime,
	@EndDate datetime
)
AS
	SET NOCOUNT ON;
SELECT        de.Timestamp, de.ErrorID, de.DetectorID, et.ErrorDescription
FROM            Detector_Error AS de LEFT OUTER JOIN
                         Error_Types AS et ON de.ErrorType = et.ErrorType
Where de.DetectorID = @DetectorID
And de.Timestamp between @StartDate and @EndDate
GO
/****** Object:  StoredProcedure [dbo].[sp_DetectorErrorSelectByDateErrorType]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetectorErrorSelectByDateErrorType]
(
	@ErrorID int,
	@StartDate datetime,
	@EndDate datetime
)
AS
	SET NOCOUNT ON;
SELECT        de.Timestamp, de.ErrorID, de.Detector_ID, et.ErrorDescription
FROM            Detector_Error AS de LEFT OUTER JOIN
                         Error_Types AS et ON de.ErrorType = et.ErrorType
Where de.ErrorID = @ErrorID
And de.Timestamp between @StartDate and @EndDate
GO
/****** Object:  StoredProcedure [dbo].[sp_DetectorCommentSelectbySignalID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetectorCommentSelectbySignalID]
(
	@SignalID  nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT     CommentId, Date, Comment, DetectorID, SignalID
FROM         Detector_Comment
WHERE     (SignalID = @SignalID)
GO
/****** Object:  StoredProcedure [dbo].[sp_DetectorCommentSelectbyDetectorID]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetectorCommentSelectbyDetectorID]
(
	@DetectorID nvarchar(50)
)
AS
	SET NOCOUNT ON;
SELECT     CommentId, Date, Comment, DetectorID, SignalID
FROM         Detector_Comment
WHERE     (DetectorID = @DetectorID)
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRouteFromRouteDetectors]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRouteFromRouteDetectors]
(
	@Route_ID int
)
AS
	SET NOCOUNT OFF;
Delete from Route_Detectors where RouteID = @Route_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_CountDetectorHits]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Derek Lowe
-- Create date: 3/25/13
-- Description:	gets the count of detector hits for a time period
-- =============================================
CREATE PROCEDURE [dbo].[sp_CountDetectorHits](
	@SignalID nvarchar(10), 
	@Channel int,
	@Offset int,
	@StartDate datetime,
	@EndDate datetime)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select count(*)
from dbo.Controller_Event_Log
where DateAdd(MILLISECOND, @Offset, Timestamp) between @StartDate and @EndDate
and SignalID = @SignalID
and EventParam = @Channel
and EventCode = 82
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ControllerEventLogSelectRLMEvents]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ControllerEventLogSelectRLMEvents]
@StartDate datetime,
@EndDate datetime,
@SignalId nvarchar(10),
@EventData1 int

AS

Declare @_StartDate datetime
Declare @_EndDate datetime
Declare @_SignalId nvarchar(10)
Declare @_EventData1 int

Set @_StartDate = @StartDate
Set @_EndDate = @EndDate
Set @_SignalId = @SignalId
Set @_EventData1 = @EventData1


SELECT TimeStamp, EventCode, EventParam
FROM dbo.Controller_Event_Log with (NOLOCK)
WHERE (TimeStamp BETWEEN @_StartDate AND @_EndDate) 
AND (SignalId = @_SignalId) 
AND (EventParam = @_EventData1)
AND EventCode in (1,8,9,10,11)
ORDER BY TimeStamp
GO
/****** Object:  StoredProcedure [dbo].[SP_ControllerEventLog_SelectNextEventAfterPattern]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ControllerEventLog_SelectNextEventAfterPattern]
(
	@SignalID  nvarchar(10),
	@Phase int,
	@PatternEndTime datetime
)
AS
	SET NOCOUNT ON;
select top 1 Timestamp, EventCode, EventParam  from Controller_Event_Log where SignalID = @SignalID
and EventCode in (1,8,10)
and EventParam = @Phase
and Timestamp > @PatternEndTime
order by timestamp
GO
/****** Object:  StoredProcedure [dbo].[SP_ControllerEventLog_SelectMostRecentEventForSignal]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ControllerEventLog_SelectMostRecentEventForSignal]
(
	@SignalID  nvarchar(10)

)
AS
	SET NOCOUNT ON;
	

select top 1 Timestamp, EventParam, EventCode  
from Controller_Event_Log with (nolock)
where 
SignalID = @SignalID
order by timestamp desc
GO
/****** Object:  StoredProcedure [dbo].[SP_ControllerEventLog_SelectEventBeforePattern]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ControllerEventLog_SelectEventBeforePattern]
(
	@SignalID nvarchar(10),
	@Phase int,
	@PatternStartTime datetime
)
AS

Declare @_SignalID nvarchar(10)
Declare	@_Phase int
Declare	@_PatternStartTime datetime

	set @_SignalID = @SignalID
	set @_Phase = @Phase
	set @_PatternStartTime = @PatternStartTime
	
	SET NOCOUNT ON;
	
Declare @_startDate datetime = dateadd(day, -1,@_PatternStartTime);
select top 1 Timestamp, EventParam, EventCode  
from Controller_Event_Log with (nolock)
where Timestamp between @_startDate and @_PatternStartTime
and SignalID = @_SignalID
and EventParam = @_Phase
and EventCode in (1,8,10)
order by timestamp desc
GO
/****** Object:  StoredProcedure [dbo].[sp_Action_Log_Metrics_Select_All]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Action_Log_Metrics_Select_All]
AS
	SET NOCOUNT ON;
SELECT        Id, Action_Log_Id, Metrics_Id
FROM            Action_Log_Metrics
GO
/****** Object:  StoredProcedure [dbo].[sp_Action_Log_Metrics_Insert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Action_Log_Metrics_Insert]
(
	@Action_Log_Id int,
	@Metrics_Id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Action_Log_Metrics] ([Action_Log_Id], [Metric_Id]) VALUES (@Action_Log_Id, @Metrics_Id)
GO
/****** Object:  StoredProcedure [dbo].[sp_Action_Log_Actions_Insert]    Script Date: 10/26/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Action_Log_Actions_Insert]
(
	@Action_Log_Id int,
	@Action_Id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Action_Log_Actions] ([Action_Log_Id], [Action_Id]) VALUES (@Action_Log_Id, @Action_Id)
GO
/****** Object:  Default [DF_Table_1_Timestamp]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Detector_Error] ADD  CONSTRAINT [DF_Table_1_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
/****** Object:  Default [DF__DownloadA__Agree__5CF6C6BC]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[DownloadAgreements] ADD  CONSTRAINT [DF__DownloadA__Agree__5CF6C6BC]  DEFAULT ('1900-01-01T00:00:00.000') FOR [AgreementDate]
GO
/****** Object:  Default [DF_Program_Message_Timestamp]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Program_Message] ADD  CONSTRAINT [DF_Program_Message_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
/****** Object:  Default [DF_SPM_Error_TimeStamp]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[SPM_Error] ADD  CONSTRAINT [DF_SPM_Error_TimeStamp]  DEFAULT (getdate()) FOR [TimeStamp]
GO
/****** Object:  ForeignKey [FK_Action_Log_Agency_List]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Action_Log]  WITH CHECK ADD  CONSTRAINT [FK_Action_Log_Agency_List] FOREIGN KEY([Agency])
REFERENCES [dbo].[Action_Log_Agency_List] ([ID])
GO
ALTER TABLE [dbo].[Action_Log] CHECK CONSTRAINT [FK_Action_Log_Agency_List]
GO
/****** Object:  ForeignKey [FK_Action_Log_Signals]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Action_Log]  WITH CHECK ADD  CONSTRAINT [FK_Action_Log_Signals] FOREIGN KEY([SignalID])
REFERENCES [dbo].[Signals] ([SignalID])
GO
ALTER TABLE [dbo].[Action_Log] CHECK CONSTRAINT [FK_Action_Log_Signals]
GO
/****** Object:  ForeignKey [FK_Action_Log_Actions]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Action_Log_Actions]  WITH CHECK ADD  CONSTRAINT [FK_Action_Log_Actions] FOREIGN KEY([Action_Id])
REFERENCES [dbo].[Action_Log_Action_List] ([ID])
GO
ALTER TABLE [dbo].[Action_Log_Actions] CHECK CONSTRAINT [FK_Action_Log_Actions]
GO
/****** Object:  ForeignKey [FK_Action_Log_Actions_Action_Log]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Action_Log_Actions]  WITH CHECK ADD  CONSTRAINT [FK_Action_Log_Actions_Action_Log] FOREIGN KEY([Action_Log_Id])
REFERENCES [dbo].[Action_Log] ([ID])
GO
ALTER TABLE [dbo].[Action_Log_Actions] CHECK CONSTRAINT [FK_Action_Log_Actions_Action_Log]
GO
/****** Object:  ForeignKey [FK_Action_Log_Metrics_Action_Log]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Action_Log_Metrics]  WITH CHECK ADD  CONSTRAINT [FK_Action_Log_Metrics_Action_Log] FOREIGN KEY([Action_Log_Id])
REFERENCES [dbo].[Action_Log] ([ID])
GO
ALTER TABLE [dbo].[Action_Log_Metrics] CHECK CONSTRAINT [FK_Action_Log_Metrics_Action_Log]
GO
/****** Object:  ForeignKey [FK_Action_Log_Metrics_Action_Log_Metrics_List]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Action_Log_Metrics]  WITH CHECK ADD  CONSTRAINT [FK_Action_Log_Metrics_Action_Log_Metrics_List] FOREIGN KEY([Metric_Id])
REFERENCES [dbo].[Action_Log_Metric_List] ([ID])
GO
ALTER TABLE [dbo].[Action_Log_Metrics] CHECK CONSTRAINT [FK_Action_Log_Metrics_Action_Log_Metrics_List]
GO
/****** Object:  ForeignKey [FK_ApproachRouteDetail_Signals]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[ApproachRouteDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApproachRouteDetail_Signals] FOREIGN KEY([SignalID])
REFERENCES [dbo].[Signals] ([SignalID])
GO
ALTER TABLE [dbo].[ApproachRouteDetail] CHECK CONSTRAINT [FK_ApproachRouteDetail_Signals]
GO
/****** Object:  ForeignKey [FK_dbo.ApproachRouteDetail_dbo.ApproachRoute_ApproachRouteId]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[ApproachRouteDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApproachRouteDetail_dbo.ApproachRoute_ApproachRouteId] FOREIGN KEY([ApproachRouteId])
REFERENCES [dbo].[ApproachRoute] ([ApproachRouteId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApproachRouteDetail] CHECK CONSTRAINT [FK_dbo.ApproachRouteDetail_dbo.ApproachRoute_ApproachRouteId]
GO
/****** Object:  ForeignKey [FK_Detector_Comment_Graph_Detectors]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Detector_Comment]  WITH CHECK ADD  CONSTRAINT [FK_Detector_Comment_Graph_Detectors] FOREIGN KEY([DetectorID])
REFERENCES [dbo].[Graph_Detectors] ([DetectorID])
GO
ALTER TABLE [dbo].[Detector_Comment] CHECK CONSTRAINT [FK_Detector_Comment_Graph_Detectors]
GO
/****** Object:  ForeignKey [FK_Detector_Error_Graph_Detectors]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Detector_Error]  WITH CHECK ADD  CONSTRAINT [FK_Detector_Error_Graph_Detectors] FOREIGN KEY([DetectorID])
REFERENCES [dbo].[Graph_Detectors] ([DetectorID])
GO
ALTER TABLE [dbo].[Detector_Error] CHECK CONSTRAINT [FK_Detector_Error_Graph_Detectors]
GO
/****** Object:  ForeignKey [FK_Graph_Detectors_Signals]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Graph_Detectors]  WITH CHECK ADD  CONSTRAINT [FK_Graph_Detectors_Signals] FOREIGN KEY([SignalID])
REFERENCES [dbo].[Signals] ([SignalID])
GO
ALTER TABLE [dbo].[Graph_Detectors] CHECK CONSTRAINT [FK_Graph_Detectors_Signals]
GO
/****** Object:  ForeignKey [FK_Lastupdate_Signals]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Lastupdate]  WITH CHECK ADD  CONSTRAINT [FK_Lastupdate_Signals] FOREIGN KEY([SignalID])
REFERENCES [dbo].[Signals] ([SignalID])
GO
ALTER TABLE [dbo].[Lastupdate] CHECK CONSTRAINT [FK_Lastupdate_Signals]
GO
/****** Object:  ForeignKey [FK_Route_Detectors_Graph_Detectors]    Script Date: 10/26/2016 10:29:50 ******/
ALTER TABLE [dbo].[Route_Detectors]  WITH CHECK ADD  CONSTRAINT [FK_Route_Detectors_Graph_Detectors] FOREIGN KEY([DetectorID])
REFERENCES [dbo].[Graph_Detectors] ([DetectorID])
GO
ALTER TABLE [dbo].[Route_Detectors] CHECK CONSTRAINT [FK_Route_Detectors_Graph_Detectors]
GO

/*transfer data*/

USE [MOE_ORIG]

/*insert into __MigrationHistory select * from SRWTCMOE.MOE.dbo.__MigrationHistory*/

insert into signals select * from SRWTCMOE.MOE.dbo.signals

insert into Graph_Detectors select* from SRWTCMOE.MOE.dbo.Graph_Detectors

insert into Accordian select AccHeader, AccContent, AccOrder, Application from SRWTCMOE.MOE.dbo.Accordian

Set IDENTITY_INSERT Action_Log_Agency_List ON
insert into Action_Log_Agency_List (ID, Description)select ID, Description from SRWTCMOE.MOE.dbo.Action_Log_Agency_List
Set IDENTITY_INSERT Action_Log_Agency_List Off

insert into Action_Log_Action_List select Description from SRWTCMOE.MOE.dbo.Action_Log_Action_List

insert into Action_Log_Actions select Action_Log_ID, Action_ID from SRWTCMOE.MOE.dbo.Action_Log_Actions

insert into Action_Log_Metrics select Action_Log_ID, Metric_ID from SRWTCMOE.MOE.dbo.Action_Log_Metrics

insert into Action_Log select DATE, Agency, Comment, signalID, Name from SRWTCMOE.MOE.dbo.Action_Log



insert into Alert_Day_Types select * from SRWTCMOE.MOE.dbo.Alert_Day_Types


insert into Alert_Recipients select USERID, AlertID from SRWTCMOE.MOE.dbo.Alert_Recipients



insert into Alert_Types select AlertID, Alert_Description from SRWTCMOE.MOE.dbo.Alert_Types



insert into ApproachDirection select DirectionID, DirectionName from SRWTCMOE.MOE.dbo.ApproachDirection


SET IDENTITY_INSERT ApproachRoute ON 
insert into ApproachRoute(ApproachRouteId, RouteName) select ApproachRouteId, RouteName from SRWTCMOE.MOE.dbo.ApproachRoute
SET IDENTITY_INSERT ApproachRoute Off



insert into ApproachRouteDetail select * from SRWTCMOE.MOE.dbo.ApproachRouteDetail



insert into Archived_Metrics select top 10000 * from SRWTCMOE.MOE.dbo.Archived_Metrics



insert into Controller_Event_Log select  top 10000 * from SRWTCMOE.MOE.dbo.Controller_Event_Log



insert into Controller_Type select* from SRWTCMOE.MOE.dbo.Controller_Type



insert into Detector_Comment select Date, Comment, DetectorID, SignalID from SRWTCMOE.MOE.dbo.Detector_Comment



insert into Detector_Error select TimeStamp, DetectorID, ErrorType, Phase from SRWTCMOE.MOE.dbo.Detector_Error



insert into DownloadAgreements select CompanyName, Address, PhoneNumber, EmailAddress, Acknowledged, AgreementDate from SRWTCMOE.MOE.dbo.DownloadAgreements



insert into Error_Types select* from SRWTCMOE.MOE.dbo.Error_Types



insert into Menu(MenuId, MenuName, MenuLocation, ParentId, Application, DisplayOrder) select MenuId, MenuName, MenuLocation, ParentId, Application, DisplayOrder from SRWTCMOE.MOE.dbo.Menu



insert into MOE_Users(ID, Name, Email, Password, ReceiveAlerts) select ID, Name, Email, Password, ReceiveAlerts from SRWTCMOE.MOE.dbo.MOE_Users



insert into Program_Message select top 10000 Priority, Program, Message, Timestamp from SRWTCMOE.MOE.dbo.Program_Message



insert into Program_Settings select top 10000 * from SRWTCMOE.MOE.dbo.Program_Settings



insert into Region (id, Description) select ID, Description from SRWTCMOE.MOE.dbo.Region


SET IDENTITY_INSERT Route ON
insert into Route (RouteID, Description, Region, Name) select  RouteID, Description, Region, Name from SRWTCMOE.MOE.dbo.Route
SET IDENTITY_INSERT Route OFF


insert into Route_Detectors (DetectorID, RouteID, RouteOrder) select DetectorID, RouteID, RouteOrder from SRWTCMOE.MOE.dbo.Route_Detectors


insert into Speed_Events select  top 10000 * from SRWTCMOE.MOE.dbo.Speed_Events



insert into SPM_Comment select  top 10000 timestamp, entity, Charttype, Comment, EntityType from SRWTCMOE.MOE.dbo.SPM_Comment



insert into SPM_Error select  top 10000 timestamp, errortype, param1, param2 from SRWTCMOE.MOE.dbo.SPM_Error



