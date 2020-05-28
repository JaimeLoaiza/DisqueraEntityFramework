USE [master]
GO
/****** Object:  Database [DBDisQuera]    Script Date: 17/05/2020 6:47:11 p. m. ******/
CREATE DATABASE [DBDisQuera]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBDisQuera', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBDisQuera.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBDisQuera_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBDisQuera_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBDisQuera] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBDisQuera].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBDisQuera] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBDisQuera] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBDisQuera] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBDisQuera] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBDisQuera] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBDisQuera] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBDisQuera] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBDisQuera] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBDisQuera] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBDisQuera] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBDisQuera] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBDisQuera] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBDisQuera] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBDisQuera] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBDisQuera] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBDisQuera] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBDisQuera] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBDisQuera] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBDisQuera] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBDisQuera] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBDisQuera] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBDisQuera] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBDisQuera] SET RECOVERY FULL 
GO
ALTER DATABASE [DBDisQuera] SET  MULTI_USER 
GO
ALTER DATABASE [DBDisQuera] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBDisQuera] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBDisQuera] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBDisQuera] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBDisQuera] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBDisQuera', N'ON'
GO
ALTER DATABASE [DBDisQuera] SET QUERY_STORE = OFF
GO
USE [DBDisQuera]
GO
/****** Object:  Table [dbo].[Cancion]    Script Date: 17/05/2020 6:47:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancion](
	[IdCancion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Duracion] [int] NOT NULL,
	[Genero] [varchar](20) NOT NULL,
	[Descripcion] [varchar](30) NULL,
 CONSTRAINT [PK_Cancion] PRIMARY KEY CLUSTERED 
(
	[IdCancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Composicion]    Script Date: 17/05/2020 6:47:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Composicion](
	[IdCompositor] [int] NOT NULL,
	[IdCancion] [int] NOT NULL,
	[FechaComposicion] [date] NOT NULL,
 CONSTRAINT [PK_Composicion] PRIMARY KEY CLUSTERED 
(
	[IdCompositor] ASC,
	[IdCancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compositor]    Script Date: 17/05/2020 6:47:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compositor](
	[IdCompositor] [int] NOT NULL,
	[Nombres] [varchar](30) NOT NULL,
	[Apellidos] [varchar](30) NOT NULL,
	[Celular] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Estado] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Compositor] PRIMARY KEY CLUSTERED 
(
	[IdCompositor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cancion] ON 

INSERT [dbo].[Cancion] ([IdCancion], [Nombre], [Duracion], [Genero], [Descripcion]) VALUES (3, N'Drive', 4, N'Balada', N'Excelente')
INSERT [dbo].[Cancion] ([IdCancion], [Nombre], [Duracion], [Genero], [Descripcion]) VALUES (4, N'Eye The Tiger', 5, N'Rock', N'La Mejor')
SET IDENTITY_INSERT [dbo].[Cancion] OFF
GO
INSERT [dbo].[Composicion] ([IdCompositor], [IdCancion], [FechaComposicion]) VALUES (1000, 3, CAST(N'1984-02-16' AS Date))
INSERT [dbo].[Composicion] ([IdCompositor], [IdCancion], [FechaComposicion]) VALUES (1010, 4, CAST(N'1983-12-22' AS Date))
GO
INSERT [dbo].[Compositor] ([IdCompositor], [Nombres], [Apellidos], [Celular], [FechaNacimiento], [Estado]) VALUES (1000, N'The', N'Cars', 310, CAST(N'1984-02-16' AS Date), N'1')
INSERT [dbo].[Compositor] ([IdCompositor], [Nombres], [Apellidos], [Celular], [FechaNacimiento], [Estado]) VALUES (1010, N'Jimmy', N'Loaiza', 318, CAST(N'1983-12-22' AS Date), N'2')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cancion]    Script Date: 17/05/2020 6:47:12 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Cancion] ON [dbo].[Cancion]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Composicion]  WITH CHECK ADD  CONSTRAINT [FK_Composicion_Cancion] FOREIGN KEY([IdCancion])
REFERENCES [dbo].[Cancion] ([IdCancion])
GO
ALTER TABLE [dbo].[Composicion] CHECK CONSTRAINT [FK_Composicion_Cancion]
GO
ALTER TABLE [dbo].[Composicion]  WITH CHECK ADD  CONSTRAINT [FK_Composicion_Compositor] FOREIGN KEY([IdCompositor])
REFERENCES [dbo].[Compositor] ([IdCompositor])
GO
ALTER TABLE [dbo].[Composicion] CHECK CONSTRAINT [FK_Composicion_Compositor]
GO
ALTER TABLE [dbo].[Cancion]  WITH CHECK ADD  CONSTRAINT [CK_Cancion] CHECK  (([Duracion]>=(2) AND [Duracion]<=(6)))
GO
ALTER TABLE [dbo].[Cancion] CHECK CONSTRAINT [CK_Cancion]
GO
USE [master]
GO
ALTER DATABASE [DBDisQuera] SET  READ_WRITE 
GO
