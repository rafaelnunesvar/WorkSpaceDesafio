USE [master]
GO

/****** Object:  Database [BD_BANCO]    Script Date: 14/06/2023 14:15:22 ******/
CREATE DATABASE [BD_BANCO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_BANCO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BD_BANCO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_BANCO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BD_BANCO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_BANCO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BD_BANCO] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BD_BANCO] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BD_BANCO] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BD_BANCO] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BD_BANCO] SET ARITHABORT OFF 
GO

ALTER DATABASE [BD_BANCO] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [BD_BANCO] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BD_BANCO] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BD_BANCO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BD_BANCO] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BD_BANCO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BD_BANCO] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BD_BANCO] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BD_BANCO] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BD_BANCO] SET  ENABLE_BROKER 
GO

ALTER DATABASE [BD_BANCO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BD_BANCO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BD_BANCO] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BD_BANCO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BD_BANCO] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BD_BANCO] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [BD_BANCO] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [BD_BANCO] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [BD_BANCO] SET  MULTI_USER 
GO

ALTER DATABASE [BD_BANCO] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BD_BANCO] SET DB_CHAINING OFF 
GO

ALTER DATABASE [BD_BANCO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [BD_BANCO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [BD_BANCO] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [BD_BANCO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [BD_BANCO] SET QUERY_STORE = ON
GO

ALTER DATABASE [BD_BANCO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [BD_BANCO] SET  READ_WRITE 
GO













/* script Tab_contaCorrente*/

USE [BD_BANCO]
GO

/****** Object:  Table [dbo].[Tab_contaCorrente]    Script Date: 14/06/2023 14:19:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tab_contaCorrente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Agencia] [int] NOT NULL,
	[Conta] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO









/* script tab_pessoa */

USE [BD_BANCO]
GO

/****** Object:  Table [dbo].[Tab_pessoa]    Script Date: 14/06/2023 14:21:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tab_pessoa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Sobrenome] [varchar](50) NOT NULL,
	[contaCorrente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tab_pessoa]  WITH CHECK ADD FOREIGN KEY([contaCorrente])
REFERENCES [dbo].[Tab_contaCorrente] ([id])
GO





/* script tab_saldo */

USE [BD_BANCO]
GO

/****** Object:  Table [dbo].[Tab_saldo]    Script Date: 14/06/2023 14:23:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tab_saldo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Saldo] [decimal](10, 2) NOT NULL,
	[contaCorrente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tab_saldo]  WITH CHECK ADD FOREIGN KEY([contaCorrente])
REFERENCES [dbo].[Tab_contaCorrente] ([id])
GO







/* script tab_cartao */

USE [BD_BANCO]
GO

/****** Object:  Table [dbo].[Tab_cartao]    Script Date: 14/06/2023 14:23:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tab_cartao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Car] [varchar](19) NOT NULL,
	[Data_vali] [date] NOT NULL,
	[CVV] [int] NOT NULL,
	[contaCorrente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tab_cartao]  WITH CHECK ADD FOREIGN KEY([contaCorrente])
REFERENCES [dbo].[Tab_contaCorrente] ([id])
GO










/* script historico_transacao */

USE [BD_BANCO]
GO

/****** Object:  Table [dbo].[Historico_transacao]    Script Date: 14/06/2023 14:24:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Historico_transacao](
	[id] [int] IDENTITY(1,10) NOT NULL,
	[DataTransacao] [date] NOT NULL,
	[statusTransacao] [varchar](200) NOT NULL,
	[contaCorrente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Historico_transacao]  WITH CHECK ADD FOREIGN KEY([contaCorrente])
REFERENCES [dbo].[Tab_contaCorrente] ([id])
GO


