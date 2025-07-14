USE [LLM]
GO

/****** Object:  Table [dbo].[Reps]    Script Date: 13-Jul-25 9:51:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reps](
	[RepID] [bigint] NOT NULL,
	[RepText] [nvarchar](max) NULL,
	[PrimaryICD10] [varchar](255) NULL,
	[OtherICD10] [varchar](255) NULL,
	[ICD10] [varchar](255) NULL,
	[Support] [varchar](255) NULL,
	[Test] [varchar](255) NULL,
	[Exp2] [int] NULL,
	[Tokenized] [nvarchar](max) NULL,
	[PrimaryICD10_Full] [varchar](255) NULL,
	[OtherICD10_Full] [varchar](255) NULL,
	[Act_Pri_L9] [varchar](max) NULL,
	[Act_Sec_L9] [varchar](max) NULL,
	[Act_All_L9] [varchar](max) NULL,
 CONSTRAINT [PK_Reps] PRIMARY KEY CLUSTERED 
(
	[RepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reps] ADD  CONSTRAINT [DF_Reps_Exp2]  DEFAULT ((0)) FOR [Exp2]
GO



USE [LLM]
GO

/****** Object:  Table [dbo].[Tags]    Script Date: 13-Jul-25 9:51:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tags](
	[iID] [bigint] IDENTITY(1,1) NOT NULL,
	[DT] [datetime] NULL,
	[RepID] [bigint] NULL,
	[Tag] [nvarchar](255) NULL,
	[xmiID] [nvarchar](255) NULL,
	[iBegin] [nvarchar](255) NULL,
	[iEnd] [nvarchar](255) NULL,
	[Confidence] [nvarchar](255) NULL,
	[Polarity] [nvarchar](255) NULL,
	[Uncertainty] [nvarchar](255) NULL,
	[Conditional] [nvarchar](255) NULL,
	[Generic] [nvarchar](255) NULL,
	[HistoryOf] [nvarchar](255) NULL,
	[CodingScheme] [nvarchar](800) NULL,
	[Code] [nvarchar](800) NULL,
	[CUI] [nvarchar](800) NULL,
	[TUI] [nvarchar](800) NULL,
	[PreferredText] [nvarchar](800) NULL,
	[ValueBegin] [nvarchar](255) NULL,
	[ValueEnd] [nvarchar](255) NULL,
	[Value] [nvarchar](4000) NULL,
	[Deleted] [int] NULL,
	[sKey] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY NONCLUSTERED 
(
	[iID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_DT]  DEFAULT (getdate()) FOR [DT]
GO

ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

USE [LLM2]
GO

/****** Object:  Table [dbo].[GPT]    Script Date: 13-Jul-25 9:53:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GPT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RepID] [bigint] NULL,
	[Model] [varchar](max) NULL,
	[Match_All_L1] [varchar](max) NULL,
	[Match_All_L2] [varchar](max) NULL,
	[Match_All_L3] [varchar](max) NULL,
	[Match_All_L4] [varchar](max) NULL,
	[Match_All_L9] [varchar](max) NULL,
	[Match_Pri_L1] [varchar](max) NULL,
	[Match_Pri_L2] [varchar](max) NULL,
	[Match_Pri_L3] [varchar](max) NULL,
	[Match_Pri_L4] [varchar](max) NULL,
	[Match_Pri_L9] [varchar](max) NULL,
	[Match_Sec_L1] [varchar](max) NULL,
	[Match_Sec_L2] [varchar](max) NULL,
	[Match_Sec_L3] [varchar](max) NULL,
	[Match_Sec_L4] [varchar](max) NULL,
	[Match_Sec_L9] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [LLM2]
GO

/****** Object:  Table [dbo].[GPT_T4]    Script Date: 13-Jul-25 9:55:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GPT_T4](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RepID] [bigint] NULL,
	[Model] [varchar](max) NULL,
	[Match_All_L3_Count] [int] NULL,
	[Match_All_L4_Count] [int] NULL,
	[Match_All_L9_Count] [int] NULL,
	[Match_Pri_L3_Count] [int] NULL,
	[Match_Pri_L4_Count] [int] NULL,
	[Match_Pri_L9_Count] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




