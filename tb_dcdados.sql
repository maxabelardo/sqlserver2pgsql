USE [dcdados]
GO
/****** Object:  Table [app].[Aplicativo]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [app].[Aplicativo](
	[idAplicativo] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [nvarchar](255) NULL,
	[Descricao] [nvarchar](max) NULL,
	[Responsavel] [nvarchar](50) NULL,
	[ResEmail] [nvarchar](100) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_Aplicativo_idAplicativo] PRIMARY KEY CLUSTERED 
(
	[idAplicativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [SECOND]
GO
/****** Object:  Table [app].[AppAmbiente]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [app].[AppAmbiente](
	[idAppAmbiente] [int] IDENTITY(1,1) NOT NULL,
	[idAplicativo] [int] NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[URLinterna] [nvarchar](max) NULL,
	[URLexterna] [nvarchar](max) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_AppAmbiente_idAppAmbiente] PRIMARY KEY CLUSTERED 
(
	[idAppAmbiente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [SECOND]
GO
/****** Object:  Table [app].[AppStringConect]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [app].[AppStringConect](
	[idAppStringConect] [int] IDENTITY(1,1) NOT NULL,
	[idAppAmbiente] [int] NOT NULL,
	[StringConect] [nvarchar](max) NULL,
	[NomeDoArquivo] [nvarchar](max) NULL,
	[DiretorioDoArquivo] [nvarchar](max) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_AppStringConect_idAppStringConect] PRIMARY KEY CLUSTERED 
(
	[idAppStringConect] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECOND]
) ON [SECOND] TEXTIMAGE_ON [SECOND]
GO
/****** Object:  Table [app].[StBasededados]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [app].[StBasededados](
	[idStBasededados] [int] IDENTITY(1,1) NOT NULL,
	[idAppStringConect] [int] NOT NULL,
	[idbasededados] [int] NOT NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_StBasededados_idStBasededados] PRIMARY KEY CLUSTERED 
(
	[idStBasededados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECOND]
) ON [SECOND]
GO
/****** Object:  Table [auditing].[alteracoes]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditing].[alteracoes](
	[idalteracoes] [int] IDENTITY(1,1) NOT NULL,
	[Tabela] [nvarchar](30) NULL,
	[idRegistro] [int] NULL,
	[acao] [nvarchar](10) NULL,
	[valorAnterior] [text] NULL,
	[valorDepois] [text] NULL,
	[dhcriacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idalteracoes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [AUDITING]
) ON [AUDITING] TEXTIMAGE_ON [AUDITING]
GO
/****** Object:  Table [auditing].[log]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditing].[log](
	[idlog] [int] IDENTITY(1,1) NOT NULL,
	[idinstancia] [int] NULL,
	[porta] [int] NULL,
	[hostname] [nvarchar](max) NULL,
	[instancia] [nvarchar](max) NULL,
	[datatimer] [datetime] NULL,
	[status] [nchar](10) NULL,
	[Trilha] [nchar](100) NULL,
	[SGBD] [nvarchar](50) NULL
) ON [AUDITING] TEXTIMAGE_ON [AUDITING]
GO
/****** Object:  Table [auditing].[logerror]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditing].[logerror](
	[idlogerro] [int] IDENTITY(1,1) NOT NULL,
	[errorobjeto] [nvarchar](max) NULL,
	[errornumber] [int] NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ErrorSeverity] [nvarchar](max) NULL,
	[ErrorState] [int] NULL,
	[ErrorLine] [nvarchar](max) NULL,
	[datatimer] [datetime] NULL
) ON [AUDITING] TEXTIMAGE_ON [AUDITING]
GO
/****** Object:  Table [auditing].[logjob]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditing].[logjob](
	[ID_JOB] [int] NULL,
	[CHANNEL_ID] [varchar](255) NULL,
	[JOBNAME] [varchar](255) NULL,
	[STATUS] [varchar](15) NULL,
	[LINES_READ] [bigint] NULL,
	[LINES_WRITTEN] [bigint] NULL,
	[LINES_UPDATED] [bigint] NULL,
	[LINES_INPUT] [bigint] NULL,
	[LINES_OUTPUT] [bigint] NULL,
	[LINES_REJECTED] [bigint] NULL,
	[ERRORS] [bigint] NULL,
	[STARTDATE] [datetime] NULL,
	[ENDDATE] [datetime] NULL,
	[LOGDATE] [datetime] NULL,
	[DEPDATE] [datetime] NULL,
	[REPLAYDATE] [datetime] NULL,
	[LOG_FIELD] [text] NULL,
	[EXECUTING_SERVER] [varchar](255) NULL,
	[EXECUTING_USER] [varchar](255) NULL,
	[START_JOB_ENTRY] [varchar](255) NULL,
	[CLIENT] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [auditing].[logstep]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditing].[logstep](
	[ID_BATCH] [int] NULL,
	[CHANNEL_ID] [varchar](255) NULL,
	[LOG_DATE] [datetime] NULL,
	[TRANSNAME] [varchar](255) NULL,
	[STEPNAME] [varchar](255) NULL,
	[STEP_COPY] [int] NULL,
	[LINES_READ] [bigint] NULL,
	[LINES_WRITTEN] [bigint] NULL,
	[LINES_UPDATED] [bigint] NULL,
	[LINES_INPUT] [bigint] NULL,
	[LINES_OUTPUT] [bigint] NULL,
	[LINES_REJECTED] [bigint] NULL,
	[ERRORS] [bigint] NULL,
	[LOG_FIELD] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [auditing].[logtransformacoes]    Script Date: 17/11/2023 14:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditing].[logtransformacoes](
	[ID_BATCH] [int] NULL,
	[CHANNEL_ID] [varchar](255) NULL,
	[TRANSNAME] [varchar](255) NULL,
	[STATUS] [varchar](15) NULL,
	[LINES_READ] [bigint] NULL,
	[LINES_WRITTEN] [bigint] NULL,
	[LINES_UPDATED] [bigint] NULL,
	[LINES_INPUT] [bigint] NULL,
	[LINES_OUTPUT] [bigint] NULL,
	[LINES_REJECTED] [bigint] NULL,
	[ERRORS] [bigint] NULL,
	[STARTDATE] [datetime] NULL,
	[ENDDATE] [datetime] NULL,
	[LOGDATE] [datetime] NULL,
	[DEPDATE] [datetime] NULL,
	[REPLAYDATE] [datetime] NULL,
	[LOG_FIELD] [text] NULL,
	[EXECUTING_SERVER] [varchar](255) NULL,
	[EXECUTING_USER] [varchar](255) NULL,
	[CLIENT] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametro](
	[idParametro] [int] IDENTITY(1,1) NOT NULL,
	[Parametro] [nvarchar](max) NULL,
	[Valor] [nvarchar](max) NULL,
	[TipoValor] [nvarchar](20) NULL,
	[Sigla] [nvarchar](20) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
 CONSTRAINT [PK_idParametro] PRIMARY KEY CLUSTERED 
(
	[idParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [AUDITING]
GO
/****** Object:  Table [dbo].[TesteConexao]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TesteConexao](
	[version] [nvarchar](max) NULL,
	[data] [datetime2](7) NULL,
	[HOST] [nvarchar](50) NULL,
	[IP] [nchar](100) NULL,
	[INSTANCIA] [nchar](100) NULL,
	[PORTA] [nchar](100) NULL,
	[SGBD] [nchar](100) NULL,
	[TRILHA] [nchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trilha]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trilha](
	[idTrilha] [int] IDENTITY(1,1) NOT NULL,
	[Trilha] [nvarchar](50) NULL,
	[Sigla] [nvarchar](3) NULL,
 CONSTRAINT [PK_Trilha] PRIMARY KEY CLUSTERED 
(
	[idTrilha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unidade]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidade](
	[idUnidade] [int] IDENTITY(1,1) NOT NULL,
	[Regiao] [nvarchar](50) NULL,
	[Dep] [nvarchar](50) NULL,
	[ADSite] [nvarchar](50) NULL,
	[SubNet] [nvarchar](255) NULL,
 CONSTRAINT [PK_Unidade] PRIMARY KEY CLUSTERED 
(
	[idUnidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ServerHost].[Disk]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ServerHost].[Disk](
	[idDisk] [int] IDENTITY(1,1) NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[Unidade] [varchar](100) NULL,
	[VolumeName] [varchar](100) NULL,
	[FileSystem] [varchar](100) NULL,
	[Description] [varchar](255) NULL,
	[VolumeDirty] [varchar](100) NULL,
	[DriveType] [int] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDisk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ServerHost].[DiskTamanho]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ServerHost].[DiskTamanho](
	[idDiskTamanho] [int] IDENTITY(1,1) NOT NULL,
	[idDisk] [int] NOT NULL,
	[FreeSpace] [int] NULL,
	[TotalSize] [int] NULL,
	[DataTimer] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDiskTamanho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ServerHost].[Servidor]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ServerHost].[Servidor](
	[idSHServidor] [int] IDENTITY(1,1) NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[HostName] [varchar](60) NULL,
	[FisicoVM] [varchar](20) NULL,
	[SistemaOperaciona] [varchar](50) NULL,
	[IPaddress] [varchar](50) NULL,
	[PortConect] [varchar](10) NULL,
	[Descricao] [varchar](max) NULL,
	[Versao] [varchar](350) NULL,
	[cpu] [int] NULL,
	[MemoryRam] [int] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_Servidor_idServidor] PRIMARY KEY CLUSTERED 
(
	[idSHServidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[basededados]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[basededados](
	[idbasededados] [int] IDENTITY(1,1) NOT NULL,
	[idInstancia] [int] NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[BasedeDados] [varchar](150) NULL,
	[Descricao] [varchar](255) NULL,
	[created] [datetime] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[ativo] [bit] NULL,
	[BDID] [int] NULL,
 CONSTRAINT [PK_basededados_idbasededados] PRIMARY KEY CLUSTERED 
(
	[idbasededados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[BDMySQL]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[BDMySQL](
	[idBDMySQL] [int] IDENTITY(1,1) NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[default_character_set_name] [varchar](100) NULL,
	[default_collation_name] [varchar](100) NULL,
	[BasedeDados] [varchar](150) NULL,
	[sql_path] [varchar](100) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
 CONSTRAINT [PK_BDMySQL_idBDMySQL] PRIMARY KEY CLUSTERED 
(
	[idBDMySQL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[BDOracle]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[BDOracle](
	[idDBOracle] [int] IDENTITY(1,1) NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[idBDOracleTipo] [int] NULL,
	[BasedeDados] [varchar](150) NULL,
	[db_owner] [varchar](100) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
 CONSTRAINT [PK_BDOracle_idDBOracle] PRIMARY KEY CLUSTERED 
(
	[idDBOracle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[BDOracleTipo]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[BDOracleTipo](
	[idBDOracleTipo] [int] IDENTITY(1,1) NOT NULL,
	[TipoInstancia] [varchar](100) NULL,
 CONSTRAINT [pk_DBOracleTipo_idDBOracleTipo] PRIMARY KEY CLUSTERED 
(
	[idBDOracleTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[BDPostgres]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[BDPostgres](
	[idBDPostgres] [int] IDENTITY(1,1) NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[oid] [int] NULL,
	[BasedeDados] [varchar](150) NULL,
	[dbowner] [varchar](100) NULL,
	[dbencoding] [varchar](50) NULL,
	[dbtablespace] [varchar](255) NULL,
	[dbcollation] [varchar](50) NULL,
	[dbcharactertype] [varchar](50) NULL,
	[connectionlimit] [int] NULL,
	[template] [bit] NULL,
	[allowconnection] [bit] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
 CONSTRAINT [PK_BDPostgres_idBDPostgres] PRIMARY KEY CLUSTERED 
(
	[idBDPostgres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[BDSQLServer]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[BDSQLServer](
	[idBDSQLServer] [int] IDENTITY(1,1) NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[owner] [varchar](30) NULL,
	[BasedeDados] [varchar](150) NULL,
	[OnlineOffline] [varchar](30) NULL,
	[RestrictAccess] [varchar](15) NULL,
	[recovery_model] [varchar](30) NULL,
	[collation] [varchar](30) NULL,
	[compatibility_level] [varchar](30) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
 CONSTRAINT [PK_BDSQLServer_idBDSQLServer] PRIMARY KEY CLUSTERED 
(
	[idBDSQLServer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[BDTabela]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[BDTabela](
	[idBDTabela] [int] IDENTITY(1,1) NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[schema_name] [varchar](128) NULL,
	[table_name] [varchar](128) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
 CONSTRAINT [PK_BDTabela_idBDTabela] PRIMARY KEY CLUSTERED 
(
	[idBDTabela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[BDTamanho]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[BDTamanho](
	[idBDTamanho] [int] IDENTITY(1,1) NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[Tamanho] [real] NULL,
	[DataTimer] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBDTamanho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[cluster]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[cluster](
	[idcluster] [int] IDENTITY(1,1) NOT NULL,
	[idclustertipo] [int] NULL,
	[clustername] [varchar](60) NULL,
	[ip] [varchar](50) NULL,
	[Ativo] [bit] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
 CONSTRAINT [pk_sdcluster_idcluster] PRIMARY KEY CLUSTERED 
(
	[idcluster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[clusterno]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[clusterno](
	[idclusterno] [int] IDENTITY(1,1) NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[idcluster] [int] NOT NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_clusterno_idclusterno] PRIMARY KEY CLUSTERED 
(
	[idclusterno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[clustertipo]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[clustertipo](
	[idclustertipo] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NULL,
 CONSTRAINT [pk_clustertipo_idclustertipo] PRIMARY KEY CLUSTERED 
(
	[idclustertipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[instancia]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[instancia](
	[idInstancia] [int] IDENTITY(1,1) NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[idcluster] [int] NULL,
	[Instancia] [varchar](255) NULL,
	[SGBD] [varchar](30) NULL,
	[IP] [varchar](255) NULL,
	[Regiao] [varchar](255) NULL,
	[dependencia] [varchar](255) NULL,
	[AdSite] [varchar](255) NULL,
	[conectstring] [varchar](255) NULL,
	[Porta] [real] NULL,
	[Cluster] [bit] NULL,
	[Versao] [varchar](255) NULL,
	[ProductVersion] [varchar](255) NULL,
	[Descricao] [varchar](255) NULL,
	[FuncaoServer] [char](100) NULL,
	[SobreAdministracao] [char](100) NULL,
	[MemoryConfig] [decimal](18, 2) NULL,
	[CPU] [int] NULL,
	[EstanciaAtivo] [bit] NULL,
	[StartInstancia] [datetime] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL,
	[Status_BD] [varchar](50) NULL,
 CONSTRAINT [PK_instancia_idDBinstancia] PRIMARY KEY CLUSTERED 
(
	[idInstancia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[instancia_MySql]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[instancia_MySql](
	[idInstancia] [int] IDENTITY(1,1) NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[idcluster] [int] NULL,
	[Instancia] [varchar](255) NULL,
	[SGBD] [varchar](30) NULL,
	[IP] [varchar](255) NULL,
	[Regiao] [varchar](255) NULL,
	[dependencia] [varchar](255) NULL,
	[AdSite] [varchar](255) NULL,
	[conectstring] [varchar](255) NULL,
	[Porta] [real] NULL,
	[Cluster] [bit] NULL,
	[Versao] [varchar](255) NULL,
	[ProductVersion] [varchar](255) NULL,
	[Descricao] [varchar](255) NULL,
	[FuncaoServer] [char](100) NULL,
	[SobreAdministracao] [char](100) NULL,
	[MemoryConfig] [int] NULL,
	[CPU] [int] NULL,
	[EstanciaAtivo] [bit] NULL,
	[StartInstancia] [datetime] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[instancia_Oracle]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[instancia_Oracle](
	[idInstancia] [int] IDENTITY(1,1) NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[idcluster] [int] NULL,
	[Instancia] [varchar](255) NULL,
	[SGBD] [varchar](30) NULL,
	[IP] [varchar](255) NULL,
	[Regiao] [varchar](255) NULL,
	[dependencia] [varchar](255) NULL,
	[AdSite] [varchar](255) NULL,
	[conectstring] [varchar](255) NULL,
	[Porta] [real] NULL,
	[Cluster] [bit] NULL,
	[Versao] [varchar](255) NULL,
	[ProductVersion] [varchar](255) NULL,
	[Descricao] [varchar](255) NULL,
	[FuncaoServer] [char](100) NULL,
	[SobreAdministracao] [char](100) NULL,
	[MemoryConfig] [int] NULL,
	[CPU] [int] NULL,
	[EstanciaAtivo] [bit] NULL,
	[StartInstancia] [datetime] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[instancia_postgreSQL]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[instancia_postgreSQL](
	[idInstancia] [int] IDENTITY(1,1) NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[idcluster] [int] NULL,
	[Instancia] [varchar](255) NULL,
	[SGBD] [varchar](30) NULL,
	[IP] [varchar](255) NULL,
	[Regiao] [varchar](255) NULL,
	[dependencia] [varchar](255) NULL,
	[AdSite] [varchar](255) NULL,
	[conectstring] [varchar](255) NULL,
	[Porta] [real] NULL,
	[Cluster] [bit] NULL,
	[Versao] [varchar](255) NULL,
	[ProductVersion] [varchar](255) NULL,
	[Descricao] [varchar](255) NULL,
	[FuncaoServer] [char](100) NULL,
	[SobreAdministracao] [char](100) NULL,
	[MemoryConfig] [int] NULL,
	[CPU] [int] NULL,
	[EstanciaAtivo] [bit] NULL,
	[StartInstancia] [datetime] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[instancia_SQLServer]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[instancia_SQLServer](
	[idInstancia] [int] IDENTITY(1,1) NOT NULL,
	[idSHServidor] [int] NOT NULL,
	[IdTrilha] [int] NOT NULL,
	[idcluster] [int] NULL,
	[Instancia] [varchar](255) NULL,
	[SGBD] [varchar](30) NULL,
	[IP] [varchar](255) NULL,
	[Regiao] [varchar](255) NULL,
	[dependencia] [varchar](255) NULL,
	[AdSite] [varchar](255) NULL,
	[conectstring] [varchar](255) NULL,
	[Porta] [real] NULL,
	[Cluster] [bit] NULL,
	[Versao] [varchar](255) NULL,
	[ProductVersion] [varchar](255) NULL,
	[Descricao] [varchar](255) NULL,
	[FuncaoServer] [char](100) NULL,
	[SobreAdministracao] [char](100) NULL,
	[MemoryConfig] [int] NULL,
	[CPU] [int] NULL,
	[EstanciaAtivo] [bit] NULL,
	[StartInstancia] [datetime] NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[LoginSQLServer]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[LoginSQLServer](
	[idLoginSQLServer] [int] IDENTITY(1,1) NOT NULL,
	[idInstancia] [int] NOT NULL,
	[nameUser] [varchar](128) NULL,
	[loginname] [varchar](128) NULL,
	[isntname] [int] NULL,
	[sysadmin] [int] NULL,
	[securityadmin] [int] NULL,
	[serveradmin] [int] NULL,
	[setupadmin] [int] NULL,
	[processadmin] [int] NULL,
	[diskadmin] [int] NULL,
	[dbcreator] [int] NULL,
	[bulkadmin] [int] NULL,
	[sid] [varbinary](85) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
	[Ativo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoginSQLServer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[RoleMembroSQLServer]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[RoleMembroSQLServer](
	[idRoleMembroSQLServer] [int] IDENTITY(1,1) NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[RoleNome] [varchar](255) NULL,
	[RoleSid] [varbinary](85) NULL,
	[LoginName] [varchar](255) NULL,
	[LoginSid] [varbinary](85) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRoleMembroSQLServer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[TBColuna]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[TBColuna](
	[idTBColuna] [int] IDENTITY(1,1) NOT NULL,
	[idBDTabela] [int] NOT NULL,
	[colunn_name] [varchar](128) NULL,
	[ordenal_positon] [int] NULL,
	[data_type] [varchar](128) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTBColuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[TBIndex]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[TBIndex](
	[idTBIndex] [int] IDENTITY(1,1) NOT NULL,
	[idBDTabela] [int] NOT NULL,
	[Index_name] [varchar](255) NULL,
	[FileGroup] [varchar](255) NULL,
	[type_desc] [varchar](255) NULL,
	[dhcriacao] [datetime] NULL,
	[dhalteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTBIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[TBIndexFrag]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[TBIndexFrag](
	[idTBIndexFrag] [int] IDENTITY(1,1) NOT NULL,
	[idTBIndex] [int] NOT NULL,
	[Avg_frag] [varchar](128) NULL,
	[Sumline] [int] NULL,
	[DataTimer] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTBIndexFrag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[TBIndexStats]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[TBIndexStats](
	[idTBIndexStats] [int] IDENTITY(1,1) NOT NULL,
	[idTBIndex] [int] NOT NULL,
	[index_id] [int] NULL,
	[ScanWrites] [real] NULL,
	[ScanReads] [real] NULL,
	[IndexSizeKB] [real] NULL,
	[Row_count] [int] NULL,
	[DataTimer] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTBIndexStats] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Fato01]
) ON [Fato01]
GO
/****** Object:  Table [SGBD].[TBStarts]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[TBStarts](
	[idTBStarts] [int] IDENTITY(1,1) NOT NULL,
	[idBDTabela] [int] NOT NULL,
	[reservedkb] [real] NULL,
	[datakb] [real] NULL,
	[Indiceskb] [real] NULL,
	[sumline] [int] NULL,
	[DataTimer] [datetime] NULL,
 CONSTRAINT [PK_TBStarts_idBDTabela] PRIMARY KEY CLUSTERED 
(
	[idTBStarts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Fato01]
) ON [Fato01]
GO
/****** Object:  Table [SGBD].[VM_TBIndex]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[VM_TBIndex](
	[idInstancia] [int] NOT NULL,
	[idBaseDeDados] [int] NOT NULL,
	[idBDTabela] [int] NOT NULL,
	[idTBIndex] [int] NOT NULL,
	[Servidor] [nvarchar](327) NULL,
	[BasedeDados] [varchar](150) NULL,
	[schema_name] [varchar](128) NULL,
	[table_name] [varchar](128) NULL,
	[Index_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTBIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Fato03]
) ON [Fato03]
GO
/****** Object:  Table [SGBD].[VM_TBIndexFrag]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[VM_TBIndexFrag](
	[idTBIndex] [int] NOT NULL,
	[Avg_frag] [varchar](128) NULL,
	[Sumline] [int] NULL,
	[DataTimer] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTBIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SGBD].[VM_TBIndexStats]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[VM_TBIndexStats](
	[idTBIndex] [int] NOT NULL,
	[index_id] [int] NULL,
	[ScanWrites] [real] NULL,
	[ScanReads] [real] NULL,
	[IndexSizeKB] [real] NULL,
	[Row_count] [int] NULL,
	[DataTimer] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTBIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Fato03]
) ON [Fato03]
GO
/****** Object:  Table [SGBD].[VM_TBStarts]    Script Date: 17/11/2023 14:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SGBD].[VM_TBStarts](
	[idBDTabela] [int] NOT NULL,
	[reservedkb] [real] NULL,
	[datakb] [real] NULL,
	[Indiceskb] [real] NULL,
	[sumline] [int] NULL,
	[DataTimer] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBDTabela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Fato02]
) ON [Fato02]
GO
ALTER TABLE [app].[Aplicativo] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [app].[Aplicativo] ADD  CONSTRAINT [DF_Aplicativo_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [app].[AppAmbiente] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [app].[AppAmbiente] ADD  CONSTRAINT [DF_AppAmbiente_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [app].[AppStringConect] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [app].[AppStringConect] ADD  CONSTRAINT [DF_AppStringConect_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [app].[StBasededados] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [app].[StBasededados] ADD  CONSTRAINT [DF_StBasededados_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [auditing].[alteracoes] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [auditing].[log] ADD  CONSTRAINT [DF__log__datati__22AA2996]  DEFAULT (getdate()) FOR [datatimer]
GO
ALTER TABLE [auditing].[logerror] ADD  CONSTRAINT [DF__logerror__datati__22AA2996]  DEFAULT (getdate()) FOR [datatimer]
GO
ALTER TABLE [dbo].[Parametro] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [ServerHost].[Disk] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [ServerHost].[DiskTamanho] ADD  DEFAULT (getdate()) FOR [DataTimer]
GO
ALTER TABLE [ServerHost].[Servidor] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [ServerHost].[Servidor] ADD  CONSTRAINT [DF_ServerHost_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [SGBD].[basededados] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[basededados] ADD  CONSTRAINT [DF_basededados_ativo]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [SGBD].[BDMySQL] ADD  CONSTRAINT [DF__BDMySQL__dhcriac__7F2BE32F]  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[BDOracle] ADD  CONSTRAINT [DF__BDOracle__dhcria__00200768]  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[BDPostgres] ADD  CONSTRAINT [DF__BDPostgre__dhcri__01142BA1]  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[BDSQLServer] ADD  CONSTRAINT [DF__BDSQLServ__dhcri__02084FDA]  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[BDTabela] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[BDTamanho] ADD  DEFAULT (getdate()) FOR [DataTimer]
GO
ALTER TABLE [SGBD].[cluster] ADD  CONSTRAINT [cluster_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [SGBD].[cluster] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[clusterno] ADD  CONSTRAINT [Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [SGBD].[instancia] ADD  CONSTRAINT [DF_SGBD_Cluster]  DEFAULT ((0)) FOR [Cluster]
GO
ALTER TABLE [SGBD].[instancia] ADD  CONSTRAINT [DF_EstanciaAtivo]  DEFAULT ((1)) FOR [EstanciaAtivo]
GO
ALTER TABLE [SGBD].[instancia] ADD  CONSTRAINT [DF__instancia__dhcri__09A971A2]  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[instancia] ADD  CONSTRAINT [DF_SGBD_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [SGBD].[LoginSQLServer] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[LoginSQLServer] ADD  CONSTRAINT [ct_ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [SGBD].[RoleMembroSQLServer] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[TBColuna] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[TBIndex] ADD  DEFAULT (getdate()) FOR [dhcriacao]
GO
ALTER TABLE [SGBD].[TBIndexFrag] ADD  DEFAULT (getdate()) FOR [DataTimer]
GO
ALTER TABLE [SGBD].[TBIndexStats] ADD  DEFAULT (getdate()) FOR [DataTimer]
GO
ALTER TABLE [SGBD].[TBStarts] ADD  DEFAULT (getdate()) FOR [DataTimer]
GO
ALTER TABLE [app].[AppAmbiente]  WITH CHECK ADD  CONSTRAINT [FK_AppAmbiente_Aplicativo] FOREIGN KEY([idAplicativo])
REFERENCES [app].[Aplicativo] ([idAplicativo])
GO
ALTER TABLE [app].[AppAmbiente] CHECK CONSTRAINT [FK_AppAmbiente_Aplicativo]
GO
ALTER TABLE [app].[AppAmbiente]  WITH CHECK ADD  CONSTRAINT [FK_AppAmbiente_ServerHost] FOREIGN KEY([idSHServidor])
REFERENCES [ServerHost].[Servidor] ([idSHServidor])
GO
ALTER TABLE [app].[AppAmbiente] CHECK CONSTRAINT [FK_AppAmbiente_ServerHost]
GO
ALTER TABLE [app].[AppAmbiente]  WITH CHECK ADD  CONSTRAINT [FK_AppAmbiente_Trilha] FOREIGN KEY([IdTrilha])
REFERENCES [dbo].[Trilha] ([idTrilha])
GO
ALTER TABLE [app].[AppAmbiente] CHECK CONSTRAINT [FK_AppAmbiente_Trilha]
GO
ALTER TABLE [app].[AppStringConect]  WITH CHECK ADD  CONSTRAINT [FK_AppAmbiente_AppStringConect] FOREIGN KEY([idAppAmbiente])
REFERENCES [app].[AppAmbiente] ([idAppAmbiente])
GO
ALTER TABLE [app].[AppStringConect] CHECK CONSTRAINT [FK_AppAmbiente_AppStringConect]
GO
ALTER TABLE [app].[StBasededados]  WITH CHECK ADD  CONSTRAINT [FK_StBasededados_AppStringConect] FOREIGN KEY([idAppStringConect])
REFERENCES [app].[AppStringConect] ([idAppStringConect])
GO
ALTER TABLE [app].[StBasededados] CHECK CONSTRAINT [FK_StBasededados_AppStringConect]
GO
ALTER TABLE [app].[StBasededados]  WITH CHECK ADD  CONSTRAINT [FK_StBasededados_basededados] FOREIGN KEY([idbasededados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [app].[StBasededados] CHECK CONSTRAINT [FK_StBasededados_basededados]
GO
ALTER TABLE [ServerHost].[Disk]  WITH CHECK ADD  CONSTRAINT [FK_LDisk_Servidor] FOREIGN KEY([idSHServidor])
REFERENCES [ServerHost].[Servidor] ([idSHServidor])
GO
ALTER TABLE [ServerHost].[Disk] CHECK CONSTRAINT [FK_LDisk_Servidor]
GO
ALTER TABLE [ServerHost].[DiskTamanho]  WITH CHECK ADD  CONSTRAINT [FK_LDisk_DiskTamanho] FOREIGN KEY([idDisk])
REFERENCES [ServerHost].[Disk] ([idDisk])
GO
ALTER TABLE [ServerHost].[DiskTamanho] CHECK CONSTRAINT [FK_LDisk_DiskTamanho]
GO
ALTER TABLE [ServerHost].[Servidor]  WITH CHECK ADD  CONSTRAINT [FK_ServerHost_Trilha] FOREIGN KEY([IdTrilha])
REFERENCES [dbo].[Trilha] ([idTrilha])
GO
ALTER TABLE [ServerHost].[Servidor] CHECK CONSTRAINT [FK_ServerHost_Trilha]
GO
ALTER TABLE [SGBD].[basededados]  WITH CHECK ADD  CONSTRAINT [FK_basededados_Trilha] FOREIGN KEY([IdTrilha])
REFERENCES [dbo].[Trilha] ([idTrilha])
GO
ALTER TABLE [SGBD].[basededados] CHECK CONSTRAINT [FK_basededados_Trilha]
GO
ALTER TABLE [SGBD].[basededados]  WITH CHECK ADD  CONSTRAINT [FK_Servidor_basededados] FOREIGN KEY([idInstancia])
REFERENCES [SGBD].[instancia] ([idInstancia])
GO
ALTER TABLE [SGBD].[basededados] CHECK CONSTRAINT [FK_Servidor_basededados]
GO
ALTER TABLE [SGBD].[BDMySQL]  WITH CHECK ADD  CONSTRAINT [FK_BDMySQL_BaseDeDados] FOREIGN KEY([idBaseDeDados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [SGBD].[BDMySQL] CHECK CONSTRAINT [FK_BDMySQL_BaseDeDados]
GO
ALTER TABLE [SGBD].[BDOracle]  WITH CHECK ADD  CONSTRAINT [FK_BDOracle_BaseDeDados] FOREIGN KEY([idBaseDeDados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [SGBD].[BDOracle] CHECK CONSTRAINT [FK_BDOracle_BaseDeDados]
GO
ALTER TABLE [SGBD].[BDOracle]  WITH CHECK ADD  CONSTRAINT [FK_DBOracleTipo_BaseDeDados] FOREIGN KEY([idBDOracleTipo])
REFERENCES [SGBD].[BDOracleTipo] ([idBDOracleTipo])
GO
ALTER TABLE [SGBD].[BDOracle] CHECK CONSTRAINT [FK_DBOracleTipo_BaseDeDados]
GO
ALTER TABLE [SGBD].[BDPostgres]  WITH CHECK ADD  CONSTRAINT [FK_BDPostgres_BaseDeDados] FOREIGN KEY([idBaseDeDados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [SGBD].[BDPostgres] CHECK CONSTRAINT [FK_BDPostgres_BaseDeDados]
GO
ALTER TABLE [SGBD].[BDSQLServer]  WITH CHECK ADD  CONSTRAINT [FK_BDSQLServer_BaseDeDados] FOREIGN KEY([idBaseDeDados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [SGBD].[BDSQLServer] CHECK CONSTRAINT [FK_BDSQLServer_BaseDeDados]
GO
ALTER TABLE [SGBD].[BDTabela]  WITH CHECK ADD  CONSTRAINT [FK_BDTabela_BaseDeDados] FOREIGN KEY([idBaseDeDados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [SGBD].[BDTabela] CHECK CONSTRAINT [FK_BDTabela_BaseDeDados]
GO
ALTER TABLE [SGBD].[BDTamanho]  WITH CHECK ADD  CONSTRAINT [FK_BaseDeDados_idBaseDeDados] FOREIGN KEY([idBaseDeDados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [SGBD].[BDTamanho] CHECK CONSTRAINT [FK_BaseDeDados_idBaseDeDados]
GO
ALTER TABLE [SGBD].[cluster]  WITH CHECK ADD  CONSTRAINT [FK_cluster_idclustertipo] FOREIGN KEY([idclustertipo])
REFERENCES [SGBD].[clustertipo] ([idclustertipo])
GO
ALTER TABLE [SGBD].[cluster] CHECK CONSTRAINT [FK_cluster_idclustertipo]
GO
ALTER TABLE [SGBD].[clusterno]  WITH CHECK ADD  CONSTRAINT [FK_clusterno_cluster] FOREIGN KEY([idcluster])
REFERENCES [SGBD].[cluster] ([idcluster])
GO
ALTER TABLE [SGBD].[clusterno] CHECK CONSTRAINT [FK_clusterno_cluster]
GO
ALTER TABLE [SGBD].[clusterno]  WITH CHECK ADD  CONSTRAINT [FK_clusterno_Servidor] FOREIGN KEY([idSHServidor])
REFERENCES [ServerHost].[Servidor] ([idSHServidor])
GO
ALTER TABLE [SGBD].[clusterno] CHECK CONSTRAINT [FK_clusterno_Servidor]
GO
ALTER TABLE [SGBD].[instancia]  WITH CHECK ADD  CONSTRAINT [FK_instancia_cluster] FOREIGN KEY([idcluster])
REFERENCES [SGBD].[cluster] ([idcluster])
GO
ALTER TABLE [SGBD].[instancia] CHECK CONSTRAINT [FK_instancia_cluster]
GO
ALTER TABLE [SGBD].[instancia]  WITH CHECK ADD  CONSTRAINT [FK_instancia_Servidor] FOREIGN KEY([idSHServidor])
REFERENCES [ServerHost].[Servidor] ([idSHServidor])
GO
ALTER TABLE [SGBD].[instancia] CHECK CONSTRAINT [FK_instancia_Servidor]
GO
ALTER TABLE [SGBD].[instancia]  WITH CHECK ADD  CONSTRAINT [FK_instancia_Trilha] FOREIGN KEY([IdTrilha])
REFERENCES [dbo].[Trilha] ([idTrilha])
GO
ALTER TABLE [SGBD].[instancia] CHECK CONSTRAINT [FK_instancia_Trilha]
GO
ALTER TABLE [SGBD].[LoginSQLServer]  WITH CHECK ADD  CONSTRAINT [FK_LoginSQLServer_instancia ] FOREIGN KEY([idInstancia])
REFERENCES [SGBD].[instancia] ([idInstancia])
GO
ALTER TABLE [SGBD].[LoginSQLServer] CHECK CONSTRAINT [FK_LoginSQLServer_instancia ]
GO
ALTER TABLE [SGBD].[RoleMembroSQLServer]  WITH CHECK ADD  CONSTRAINT [FK_RoleMembroSQLServer_basededados] FOREIGN KEY([idBaseDeDados])
REFERENCES [SGBD].[basededados] ([idbasededados])
GO
ALTER TABLE [SGBD].[RoleMembroSQLServer] CHECK CONSTRAINT [FK_RoleMembroSQLServer_basededados]
GO
ALTER TABLE [SGBD].[TBColuna]  WITH CHECK ADD  CONSTRAINT [FK_TBColuna_BDTabela] FOREIGN KEY([idBDTabela])
REFERENCES [SGBD].[BDTabela] ([idBDTabela])
GO
ALTER TABLE [SGBD].[TBColuna] CHECK CONSTRAINT [FK_TBColuna_BDTabela]
GO
ALTER TABLE [SGBD].[TBIndex]  WITH CHECK ADD  CONSTRAINT [FK_TBIndex_BDTabela] FOREIGN KEY([idBDTabela])
REFERENCES [SGBD].[BDTabela] ([idBDTabela])
GO
ALTER TABLE [SGBD].[TBIndex] CHECK CONSTRAINT [FK_TBIndex_BDTabela]
GO
ALTER TABLE [SGBD].[TBIndexFrag]  WITH CHECK ADD  CONSTRAINT [FK_TBIndexFrag_TBIndex] FOREIGN KEY([idTBIndex])
REFERENCES [SGBD].[TBIndex] ([idTBIndex])
GO
ALTER TABLE [SGBD].[TBIndexFrag] CHECK CONSTRAINT [FK_TBIndexFrag_TBIndex]
GO
ALTER TABLE [SGBD].[TBIndexStats]  WITH CHECK ADD  CONSTRAINT [FK_TBIndexStats_TBIndex] FOREIGN KEY([idTBIndex])
REFERENCES [SGBD].[TBIndex] ([idTBIndex])
GO
ALTER TABLE [SGBD].[TBIndexStats] CHECK CONSTRAINT [FK_TBIndexStats_TBIndex]
GO
ALTER TABLE [SGBD].[TBStarts]  WITH CHECK ADD  CONSTRAINT [FK_TBStarts_BDTabela] FOREIGN KEY([idBDTabela])
REFERENCES [SGBD].[BDTabela] ([idBDTabela])
GO
ALTER TABLE [SGBD].[TBStarts] CHECK CONSTRAINT [FK_TBStarts_BDTabela]
GO
