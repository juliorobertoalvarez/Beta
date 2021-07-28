/**** crear la base de datos con todos los requerimientos necesarios para su implementacion ****/
USE [master]
GO
CREATE DATABASE [MonosabioDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MonosabioDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MonosabioDB.mdf' , SIZE = 5072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MonosabioDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MonosabioDB_log.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MonosabioDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MonosabioDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MonosabioDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MonosabioDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MonosabioDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MonosabioDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MonosabioDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MonosabioDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MonosabioDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MonosabioDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MonosabioDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MonosabioDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MonosabioDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MonosabioDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MonosabioDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MonosabioDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MonosabioDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MonosabioDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MonosabioDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MonosabioDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MonosabioDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MonosabioDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MonosabioDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MonosabioDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MonosabioDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MonosabioDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MonosabioDB] SET  MULTI_USER 
GO
ALTER DATABASE [MonosabioDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MonosabioDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MonosabioDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MonosabioDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MonosabioDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO


/**** Crear las tablas con sus relaciones ****/

CREATE TABLE [tbl_cuidad]
(
 [idciudad] Int IDENTITY(1,1) NOT NULL,
 [nombreciudad] Nvarchar(1000) NULL,
 [tamano] Nvarchar(1000) NULL,
 [indice] Nvarchar(100) NULL,
 [ingreso] Nvarchar(1000) NULL
)
go

-- Add keys for table tbl_cuidad

ALTER TABLE [tbl_cuidad] ADD CONSTRAINT [PK_tbl_cuidad] PRIMARY KEY ([idciudad])
go

-- Table tbl_cliente

CREATE TABLE [tbl_cliente]
(
 [idcliente] Int IDENTITY(1,1) NOT NULL,
 [nit] Varchar(25) NULL,
 [nombrecliente] Varchar(1000) NULL,
 [direccion] Nvarchar(1000) NULL,
 [telefono] Nvarchar(15) NULL,
 [fecha] Date NULL,
 [idciudad] Int NOT NULL
)
go

-- Agrega las llaves --

ALTER TABLE [tbl_cliente] ADD CONSTRAINT [PK_tbl_cliente] PRIMARY KEY ([idcliente],[idciudad])
go

-- Crea la llave foranea --


ALTER TABLE [tbl_cliente] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([idciudad]) REFERENCES [tbl_cuidad] ([idciudad]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

-- Crea la tabla de ususarios para el login --
CREATE TABLE [dbo].[Usuarios](
 [idUsuario] [bigint] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [usuario] [varchar](25) NULL,
 [contrasena] [varchar](25) NULL,
 [email] [varchar](100) NULL,
 [telefono] [bigint] NULL)

 -- Crea  un procedimiento almacenado para proper login--
CREATE PROCEDURE [dbo].[spValidaUsuario]
@usuario VARCHAR(20),
@contrasena VARCHAR(20)
AS BEGIN
SELECT usuario,contrasena
  FROM Usuarios
 WHERE usuario=@usuario AND contrasena=@contrasena
 END


select * from tbl_cliente


