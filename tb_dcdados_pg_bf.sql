
BEGIN;
CREATE SCHEMA IF NOT EXISTS "sgbd";
CREATE SCHEMA IF NOT EXISTS "serverhost";
CREATE SCHEMA IF NOT EXISTS "app";
CREATE SCHEMA IF NOT EXISTS "auditing";


CREATE TABLE "public"."parametro"( 
	"idparametro" int NOT NULL,
	"parametro" varchar,
	"valor" varchar,
	"tipovalor" varchar(20),
	"sigla" varchar(20),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "public"."testeconexao"( 
	"version" varchar,
	"data" timestamp,
	"host" varchar(50),
	"ip" char(100),
	"instancia" char(100),
	"porta" char(100),
	"sgbd" char(100),
	"trilha" char(100));

CREATE TABLE "public"."trilha"( 
	"idtrilha" int NOT NULL,
	"trilha" varchar(50),
	"sigla" varchar(3));

CREATE TABLE "public"."unidade"( 
	"idunidade" int NOT NULL,
	"regiao" varchar(50),
	"dep" varchar(50),
	"adsite" varchar(50),
	"subnet" varchar(255));

CREATE TABLE "auditing"."alteracoes"( 
	"idalteracoes" int NOT NULL,
	"tabela" varchar(30),
	"idregistro" int,
	"acao" varchar(10),
	"valoranterior" text,
	"valordepois" text,
	"dhcriacao" timestamp);

CREATE TABLE "auditing"."log"( 
	"idlog" int NOT NULL,
	"idinstancia" int,
	"porta" int,
	"hostname" varchar,
	"instancia" varchar,
	"datatimer" timestamp,
	"status" char(10),
	"trilha" char(100),
	"sgbd" varchar(50));

CREATE TABLE "auditing"."logerror"( 
	"idlogerro" int NOT NULL,
	"errorobjeto" varchar,
	"errornumber" int,
	"errormessage" varchar,
	"errorseverity" varchar,
	"errorstate" int,
	"errorline" varchar,
	"datatimer" timestamp);

CREATE TABLE "auditing"."logjob"( 
	"id_job" int,
	"channel_id" varchar(255),
	"jobname" varchar(255),
	"status" varchar(15),
	"lines_read" bigint,
	"lines_written" bigint,
	"lines_updated" bigint,
	"lines_input" bigint,
	"lines_output" bigint,
	"lines_rejected" bigint,
	"errors" bigint,
	"startdate" timestamp,
	"enddate" timestamp,
	"logdate" timestamp,
	"depdate" timestamp,
	"replaydate" timestamp,
	"log_field" text,
	"executing_server" varchar(255),
	"executing_user" varchar(255),
	"start_job_entry" varchar(255),
	"client" varchar(255));

CREATE TABLE "auditing"."logstep"( 
	"id_batch" int,
	"channel_id" varchar(255),
	"log_date" timestamp,
	"transname" varchar(255),
	"stepname" varchar(255),
	"step_copy" int,
	"lines_read" bigint,
	"lines_written" bigint,
	"lines_updated" bigint,
	"lines_input" bigint,
	"lines_output" bigint,
	"lines_rejected" bigint,
	"errors" bigint,
	"log_field" text);

CREATE TABLE "auditing"."logtransformacoes"( 
	"id_batch" int,
	"channel_id" varchar(255),
	"transname" varchar(255),
	"status" varchar(15),
	"lines_read" bigint,
	"lines_written" bigint,
	"lines_updated" bigint,
	"lines_input" bigint,
	"lines_output" bigint,
	"lines_rejected" bigint,
	"errors" bigint,
	"startdate" timestamp,
	"enddate" timestamp,
	"logdate" timestamp,
	"depdate" timestamp,
	"replaydate" timestamp,
	"log_field" text,
	"executing_server" varchar(255),
	"executing_user" varchar(255),
	"client" varchar(255));

CREATE TABLE "sgbd"."bdmysql"( 
	"idbdmysql" int NOT NULL,
	"idbasededados" int NOT NULL,
	"default_character_set_name" varchar(100),
	"default_collation_name" varchar(100),
	"basededados" varchar(150),
	"sql_path" varchar(100),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."bdoracle"( 
	"iddboracle" int NOT NULL,
	"idbasededados" int NOT NULL,
	"idbdoracletipo" int,
	"basededados" varchar(150),
	"db_owner" varchar(100),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."bdoracletipo"( 
	"idbdoracletipo" int NOT NULL,
	"tipoinstancia" varchar(100));

CREATE TABLE "sgbd"."bdpostgres"( 
	"idbdpostgres" int NOT NULL,
	"idbasededados" int NOT NULL,
	"oid" int,
	"basededados" varchar(150),
	"dbowner" varchar(100),
	"dbencoding" varchar(50),
	"dbtablespace" varchar(255),
	"dbcollation" varchar(50),
	"dbcharactertype" varchar(50),
	"connectionlimit" int,
	"template" boolean,
	"allowconnection" boolean,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."bdsqlserver"( 
	"idbdsqlserver" int NOT NULL,
	"idbasededados" int NOT NULL,
	"owner" varchar(30),
	"basededados" varchar(150),
	"onlineoffline" varchar(30),
	"restrictaccess" varchar(15),
	"recovery_model" varchar(30),
	"collation" varchar(30),
	"compatibility_level" varchar(30),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."bdtabela"( 
	"idbdtabela" int NOT NULL,
	"idbasededados" int NOT NULL,
	"schema_name" varchar(128),
	"table_name" varchar(128),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."bdtamanho"( 
	"idbdtamanho" int NOT NULL,
	"idbasededados" int NOT NULL,
	"tamanho" real,
	"datatimer" timestamp);

CREATE TABLE "sgbd"."loginsqlserver"( 
	"idloginsqlserver" int NOT NULL,
	"idinstancia" int NOT NULL,
	"nameuser" varchar(128),
	"loginname" varchar(128),
	"isntname" int,
	"sysadmin" int,
	"securityadmin" int,
	"serveradmin" int,
	"setupadmin" int,
	"processadmin" int,
	"diskadmin" int,
	"dbcreator" int,
	"bulkadmin" int,
	"sid" bytea,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "sgbd"."rolemembrosqlserver"( 
	"idrolemembrosqlserver" int NOT NULL,
	"idbasededados" int NOT NULL,
	"rolenome" varchar(255),
	"rolesid" bytea,
	"loginname" varchar(255),
	"loginsid" bytea,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."tbcoluna"( 
	"idtbcoluna" int NOT NULL,
	"idbdtabela" int NOT NULL,
	"colunn_name" varchar(128),
	"ordenal_positon" int,
	"data_type" varchar(128),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."tbindex"( 
	"idtbindex" int NOT NULL,
	"idbdtabela" int NOT NULL,
	"index_name" varchar(255),
	"filegroup" varchar(255),
	"type_desc" varchar(255),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."tbindexfrag"( 
	"idtbindexfrag" int NOT NULL,
	"idtbindex" int NOT NULL,
	"avg_frag" varchar(128),
	"sumline" int,
	"datatimer" timestamp);

CREATE TABLE "sgbd"."tbindexstats"( 
	"idtbindexstats" int NOT NULL,
	"idtbindex" int NOT NULL,
	"index_id" int,
	"scanwrites" real,
	"scanreads" real,
	"indexsizekb" real,
	"row_count" int,
	"datatimer" timestamp);

CREATE TABLE "sgbd"."tbstarts"( 
	"idtbstarts" int NOT NULL,
	"idbdtabela" int NOT NULL,
	"reservedkb" real,
	"datakb" real,
	"indiceskb" real,
	"sumline" int,
	"datatimer" timestamp);

CREATE TABLE "sgbd"."vm_tbindex"( 
	"idinstancia" int NOT NULL,
	"idbasededados" int NOT NULL,
	"idbdtabela" int NOT NULL,
	"idtbindex" int NOT NULL,
	"servidor" varchar(327),
	"basededados" varchar(150),
	"schema_name" varchar(128),
	"table_name" varchar(128),
	"index_name" varchar(255));

CREATE TABLE "sgbd"."vm_tbindexfrag"( 
	"idtbindex" int NOT NULL,
	"avg_frag" varchar(128),
	"sumline" int,
	"datatimer" timestamp);

CREATE TABLE "sgbd"."vm_tbindexstats"( 
	"idtbindex" int NOT NULL,
	"index_id" int,
	"scanwrites" real,
	"scanreads" real,
	"indexsizekb" real,
	"row_count" int,
	"datatimer" timestamp);

CREATE TABLE "sgbd"."vm_tbstarts"( 
	"idbdtabela" int NOT NULL,
	"reservedkb" real,
	"datakb" real,
	"indiceskb" real,
	"sumline" int,
	"datatimer" timestamp);

CREATE TABLE "sgbd"."basededados"( 
	"idbasededados" int NOT NULL,
	"idinstancia" int NOT NULL,
	"idtrilha" int NOT NULL,
	"basededados" varchar(150),
	"descricao" varchar(255),
	"created" timestamp,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean,
	"bdid" int);

CREATE TABLE "sgbd"."cluster"( 
	"idcluster" int NOT NULL,
	"idclustertipo" int,
	"clustername" varchar(60),
	"ip" varchar(50),
	"ativo" boolean,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "sgbd"."clusterno"( 
	"idclusterno" int NOT NULL,
	"idshservidor" int NOT NULL,
	"idcluster" int NOT NULL,
	"ativo" boolean);

CREATE TABLE "sgbd"."clustertipo"( 
	"idclustertipo" int NOT NULL,
	"tipo" varchar(50));

CREATE TABLE "sgbd"."instancia"( 
	"idinstancia" int NOT NULL,
	"idshservidor" int NOT NULL,
	"idtrilha" int NOT NULL,
	"idcluster" int,
	"instancia" varchar(255),
	"sgbd" varchar(30),
	"ip" varchar(255),
	"regiao" varchar(255),
	"dependencia" varchar(255),
	"adsite" varchar(255),
	"conectstring" varchar(255),
	"porta" real,
	"cluster" boolean,
	"versao" varchar(255),
	"productversion" varchar(255),
	"descricao" varchar(255),
	"funcaoserver" char(100),
	"sobreadministracao" char(100),
	"memoryconfig" numeric(18, 2),
	"cpu" int,
	"estanciaativo" boolean,
	"startinstancia" timestamp,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean,
	"status_bd" varchar(50));

CREATE TABLE "sgbd"."instancia_mysql"( 
	"idinstancia" int NOT NULL,
	"idshservidor" int NOT NULL,
	"idtrilha" int NOT NULL,
	"idcluster" int,
	"instancia" varchar(255),
	"sgbd" varchar(30),
	"ip" varchar(255),
	"regiao" varchar(255),
	"dependencia" varchar(255),
	"adsite" varchar(255),
	"conectstring" varchar(255),
	"porta" real,
	"cluster" boolean,
	"versao" varchar(255),
	"productversion" varchar(255),
	"descricao" varchar(255),
	"funcaoserver" char(100),
	"sobreadministracao" char(100),
	"memoryconfig" int,
	"cpu" int,
	"estanciaativo" boolean,
	"startinstancia" timestamp,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "sgbd"."instancia_oracle"( 
	"idinstancia" int NOT NULL,
	"idshservidor" int NOT NULL,
	"idtrilha" int NOT NULL,
	"idcluster" int,
	"instancia" varchar(255),
	"sgbd" varchar(30),
	"ip" varchar(255),
	"regiao" varchar(255),
	"dependencia" varchar(255),
	"adsite" varchar(255),
	"conectstring" varchar(255),
	"porta" real,
	"cluster" boolean,
	"versao" varchar(255),
	"productversion" varchar(255),
	"descricao" varchar(255),
	"funcaoserver" char(100),
	"sobreadministracao" char(100),
	"memoryconfig" int,
	"cpu" int,
	"estanciaativo" boolean,
	"startinstancia" timestamp,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "sgbd"."instancia_sqlserver"( 
	"idinstancia" int NOT NULL,
	"idshservidor" int NOT NULL,
	"idtrilha" int NOT NULL,
	"idcluster" int,
	"instancia" varchar(255),
	"sgbd" varchar(30),
	"ip" varchar(255),
	"regiao" varchar(255),
	"dependencia" varchar(255),
	"adsite" varchar(255),
	"conectstring" varchar(255),
	"porta" real,
	"cluster" boolean,
	"versao" varchar(255),
	"productversion" varchar(255),
	"descricao" varchar(255),
	"funcaoserver" char(100),
	"sobreadministracao" char(100),
	"memoryconfig" int,
	"cpu" int,
	"estanciaativo" boolean,
	"startinstancia" timestamp,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "sgbd"."instancia_postgresql"( 
	"idinstancia" int NOT NULL,
	"idshservidor" int NOT NULL,
	"idtrilha" int NOT NULL,
	"idcluster" int,
	"instancia" varchar(255),
	"sgbd" varchar(30),
	"ip" varchar(255),
	"regiao" varchar(255),
	"dependencia" varchar(255),
	"adsite" varchar(255),
	"conectstring" varchar(255),
	"porta" real,
	"cluster" boolean,
	"versao" varchar(255),
	"productversion" varchar(255),
	"descricao" varchar(255),
	"funcaoserver" char(100),
	"sobreadministracao" char(100),
	"memoryconfig" int,
	"cpu" int,
	"estanciaativo" boolean,
	"startinstancia" timestamp,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "serverhost"."disk"( 
	"iddisk" int NOT NULL,
	"idshservidor" int NOT NULL,
	"unidade" varchar(100),
	"volumename" varchar(100),
	"filesystem" varchar(100),
	"description" varchar(255),
	"volumedirty" varchar(100),
	"drivetype" int,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp);

CREATE TABLE "serverhost"."disktamanho"( 
	"iddisktamanho" int NOT NULL,
	"iddisk" int NOT NULL,
	"freespace" int,
	"totalsize" int,
	"datatimer" timestamp);

CREATE TABLE "serverhost"."servidor"( 
	"idshservidor" int NOT NULL,
	"idtrilha" int NOT NULL,
	"hostname" varchar(60),
	"fisicovm" varchar(20),
	"sistemaoperaciona" varchar(50),
	"ipaddress" varchar(50),
	"portconect" varchar(10),
	"descricao" varchar,
	"versao" varchar(350),
	"cpu" int,
	"memoryram" int,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean,
	"status" varchar(10));

CREATE TABLE "app"."aplicativo"( 
	"idaplicativo" int NOT NULL,
	"appname" varchar(255),
	"descricao" varchar,
	"responsavel" varchar(50),
	"resemail" varchar(100),
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "app"."appambiente"( 
	"idappambiente" int NOT NULL,
	"idaplicativo" int NOT NULL,
	"idshservidor" int NOT NULL,
	"idtrilha" int NOT NULL,
	"urlinterna" varchar,
	"urlexterna" varchar,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "app"."appstringconect"( 
	"idappstringconect" int NOT NULL,
	"idappambiente" int NOT NULL,
	"stringconect" varchar,
	"nomedoarquivo" varchar,
	"diretoriodoarquivo" varchar,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

CREATE TABLE "app"."stbasededados"( 
	"idstbasededados" int NOT NULL,
	"idappstringconect" int NOT NULL,
	"idbasededados" int NOT NULL,
	"dhcriacao" timestamp,
	"dhalteracao" timestamp,
	"ativo" boolean);

ALTER TABLE "sgbd"."loginsqlserver" ADD CHECK (octet_length("sid") <= 85);
ALTER TABLE "sgbd"."rolemembrosqlserver" ADD CHECK (octet_length("rolesid") <= 85);
ALTER TABLE "sgbd"."rolemembrosqlserver" ADD CHECK (octet_length("loginsid") <= 85);
COMMIT;
