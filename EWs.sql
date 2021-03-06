USE [EWs]
GO
/****** Object:  Table [dbo].[customer_line]    Script Date: 2/7/2020 10:53:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_line](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[LineId] [int] NOT NULL,
 CONSTRAINT [PK_customer_line] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/7/2020 10:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data]    Script Date: 2/7/2020 10:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Program] [nvarchar](50) NOT NULL,
	[TesterId] [int] NOT NULL,
	[Event] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_data] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[line_line]    Script Date: 2/7/2020 10:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[line_line](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[ChildId] [int] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_line_line] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lines]    Script Date: 2/7/2020 10:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_lines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tester_line]    Script Date: 2/7/2020 10:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tester_line](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TesterId] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[Avtive] [bit] NOT NULL,
 CONSTRAINT [PK_tester_line] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testers]    Script Date: 2/7/2020 10:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_testers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customer_line]  WITH CHECK ADD  CONSTRAINT [FK_customer_line_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[customer_line] CHECK CONSTRAINT [FK_customer_line_Customers]
GO
ALTER TABLE [dbo].[customer_line]  WITH CHECK ADD  CONSTRAINT [FK_customer_line_lines] FOREIGN KEY([LineId])
REFERENCES [dbo].[lines] ([Id])
GO
ALTER TABLE [dbo].[customer_line] CHECK CONSTRAINT [FK_customer_line_lines]
GO
ALTER TABLE [dbo].[data]  WITH CHECK ADD  CONSTRAINT [FK_data_testers] FOREIGN KEY([TesterId])
REFERENCES [dbo].[testers] ([Id])
GO
ALTER TABLE [dbo].[data] CHECK CONSTRAINT [FK_data_testers]
GO
ALTER TABLE [dbo].[line_line]  WITH CHECK ADD  CONSTRAINT [FK_line_line_lines] FOREIGN KEY([ParentId])
REFERENCES [dbo].[lines] ([Id])
GO
ALTER TABLE [dbo].[line_line] CHECK CONSTRAINT [FK_line_line_lines]
GO
ALTER TABLE [dbo].[line_line]  WITH CHECK ADD  CONSTRAINT [FK_line_line_lines1] FOREIGN KEY([ChildId])
REFERENCES [dbo].[lines] ([Id])
GO
ALTER TABLE [dbo].[line_line] CHECK CONSTRAINT [FK_line_line_lines1]
GO
ALTER TABLE [dbo].[tester_line]  WITH CHECK ADD  CONSTRAINT [FK_tester_line_lines] FOREIGN KEY([LineID])
REFERENCES [dbo].[lines] ([Id])
GO
ALTER TABLE [dbo].[tester_line] CHECK CONSTRAINT [FK_tester_line_lines]
GO
ALTER TABLE [dbo].[tester_line]  WITH CHECK ADD  CONSTRAINT [FK_tester_line_testers] FOREIGN KEY([TesterId])
REFERENCES [dbo].[testers] ([Id])
GO
ALTER TABLE [dbo].[tester_line] CHECK CONSTRAINT [FK_tester_line_testers]
GO
