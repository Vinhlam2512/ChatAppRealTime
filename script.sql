USE [ChatApp]
GO
/****** Object:  Table [dbo].[GROUP]    Script Date: 3/23/2023 9:29:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP](
	[ID] [int] NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[CREATED_BY] [int] NOT NULL,
	[CREATED_AT] [datetime] NOT NULL,
 CONSTRAINT [PK_GROUP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUP_MEMBERS]    Script Date: 3/23/2023 9:29:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP_MEMBERS](
	[ID] [int] NOT NULL,
	[GROUP_ID] [int] NOT NULL,
	[USER_ID] [int] NOT NULL,
	[JOINED_AT] [datetime] NOT NULL,
 CONSTRAINT [PK_GROUP_MEMBERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MESSAGE]    Script Date: 3/23/2023 9:29:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESSAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FROM_USER] [int] NOT NULL,
	[TO_USER] [int] NULL,
	[MESSAGE] [text] NOT NULL,
	[CREATE_DATE] [datetime] NOT NULL,
	[GROUP_ID] [int] NULL,
 CONSTRAINT [PK_MESSAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 3/23/2023 9:29:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IMG] [varchar](255) NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[PASS_WORD] [varchar](50) NOT NULL,
	[IS_ONLINE] [bit] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MESSAGE] ON 

INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (1, 1, 3, N'test', CAST(N'2023-03-23T00:21:10.600' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (2, 1, 3, N'test', CAST(N'2023-03-23T00:22:10.117' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (3, 3, 1, N'ok', CAST(N'2023-03-23T00:35:09.190' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (4, 1, 3, N'l', CAST(N'2023-03-23T00:47:59.797' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (5, 1, 2, N'ok', CAST(N'2023-03-23T00:49:18.997' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (6, 1, 2, N'asddas', CAST(N'2023-03-23T00:49:29.613' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (7, 1, 3, N'adads', CAST(N'2023-03-23T01:05:40.127' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (8, 1, 3, N'd', CAST(N'2023-03-23T01:05:43.097' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (10, 1, 3, N'ad', CAST(N'2023-03-23T01:06:05.613' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (11, 1, 3, N'd', CAST(N'2023-03-23T01:06:11.613' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (12, 1, 3, N'w', CAST(N'2023-03-23T01:06:14.483' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (13, 1, 3, N'e', CAST(N'2023-03-23T01:06:55.417' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (14, 1, 3, N'd', CAST(N'2023-03-23T01:10:18.600' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (15, 1, 3, N'a', CAST(N'2023-03-23T01:10:23.057' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (16, 1, 3, N'd', CAST(N'2023-03-23T01:14:26.013' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (17, 1, 3, N'd', CAST(N'2023-03-23T01:30:46.967' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (18, 1, 3, N'a', CAST(N'2023-03-23T01:30:59.193' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (19, 1, 3, N'1', CAST(N'2023-03-23T01:32:24.470' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (20, 1, 3, N'2', CAST(N'2023-03-23T01:32:27.283' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (21, 1, 3, N'asdasd', CAST(N'2023-03-23T01:34:40.047' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (22, 3, 1, N'adsaada', CAST(N'2023-03-23T01:36:19.607' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (23, 3, 1, N'123123', CAST(N'2023-03-23T01:36:33.820' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (24, 1, 3, N'hello', CAST(N'2023-03-23T01:37:26.883' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (25, 3, 1, N'hi', CAST(N'2023-03-23T01:37:47.030' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (26, 1, 3, N'd', CAST(N'2023-03-23T01:43:53.090' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (27, 3, 1, N'1', CAST(N'2023-03-23T01:44:25.067' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (28, 3, 1, N'2', CAST(N'2023-03-23T01:44:32.763' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (29, 3, 1, N';', CAST(N'2023-03-23T01:45:39.490' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (30, 3, 1, N'1', CAST(N'2023-03-23T01:45:47.613' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (31, 1, 3, N'1213123', CAST(N'2023-03-23T01:46:31.850' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (32, 1, 3, N'll', CAST(N'2023-03-23T01:47:01.947' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (33, 1, 2, N'aaaaa', CAST(N'2023-03-23T01:50:29.867' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (34, 3, 1, N'2', CAST(N'2023-03-23T02:10:13.790' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (35, 1, 1, N'l', CAST(N'2023-03-23T02:12:10.680' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (36, 3, 1, N'1111111111111111111', CAST(N'2023-03-23T02:12:20.530' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (37, 1, 3, N'123213', CAST(N'2023-03-23T02:19:40.517' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (38, 3, 2, N'd', CAST(N'2023-03-23T02:19:50.267' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (39, 1, 3, N'1', CAST(N'2023-03-23T02:21:49.627' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (40, 3, 2, N'asd', CAST(N'2023-03-23T02:23:31.357' AS DateTime), NULL)
INSERT [dbo].[MESSAGE] ([ID], [FROM_USER], [TO_USER], [MESSAGE], [CREATE_DATE], [GROUP_ID]) VALUES (41, 1, 3, N'aaaaaaaaaaaaa', CAST(N'2023-03-23T02:24:38.597' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MESSAGE] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([ID], [IMG], [USER_NAME], [PASS_WORD], [IS_ONLINE]) VALUES (1, N'./Image/user.png', N'vinhlq', N'vinhlq', 1)
INSERT [dbo].[USER] ([ID], [IMG], [USER_NAME], [PASS_WORD], [IS_ONLINE]) VALUES (2, N'./Image/user.png', N'vinh1', N'vinh1', 1)
INSERT [dbo].[USER] ([ID], [IMG], [USER_NAME], [PASS_WORD], [IS_ONLINE]) VALUES (3, N'./Image/user.png', N'vinh2', N'vinh2', 1)
SET IDENTITY_INSERT [dbo].[USER] OFF
GO
ALTER TABLE [dbo].[GROUP_MEMBERS]  WITH CHECK ADD  CONSTRAINT [FK_GROUP_MEMBERS_GROUP] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[GROUP] ([ID])
GO
ALTER TABLE [dbo].[GROUP_MEMBERS] CHECK CONSTRAINT [FK_GROUP_MEMBERS_GROUP]
GO
ALTER TABLE [dbo].[GROUP_MEMBERS]  WITH CHECK ADD  CONSTRAINT [FK_GROUP_MEMBERS_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[GROUP_MEMBERS] CHECK CONSTRAINT [FK_GROUP_MEMBERS_USER]
GO
ALTER TABLE [dbo].[MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK_MESSAGE_GROUP_MEMBERS] FOREIGN KEY([GROUP_ID])
REFERENCES [dbo].[GROUP_MEMBERS] ([ID])
GO
ALTER TABLE [dbo].[MESSAGE] CHECK CONSTRAINT [FK_MESSAGE_GROUP_MEMBERS]
GO
ALTER TABLE [dbo].[MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK_MESSAGE_USER2] FOREIGN KEY([FROM_USER])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[MESSAGE] CHECK CONSTRAINT [FK_MESSAGE_USER2]
GO
ALTER TABLE [dbo].[MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK_MESSAGE_USER3] FOREIGN KEY([TO_USER])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[MESSAGE] CHECK CONSTRAINT [FK_MESSAGE_USER3]
GO
