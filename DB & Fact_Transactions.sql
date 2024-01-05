USE master
go

if exists (select * from sys.databases where name = 'Telecom')
drop database Telecom
go

create database Telecom
go

if exists (select * from sys.tables where name = 'Fact_Transaction' and type = 'U')
drop table Fact_Transaction
go
Create Table Fact_Transaction
(
ID int identity(1,1),
Transaction_id int not null,
IMSI varchar(9) not null,
subscriber_id int null,
TAC varchar(8) not null,
SNR varchar(6) not null,
IMEI varchar(14) null,
CELL int not null,
LAC int not null,
EVENT_TYPE varchar(2) null,
EVENT_TS datetime not null,
audit_id int not null default (-1)


constraint pk_Fact_Transaction_id primary key(ID)
)


-- Create audit table 

if exists (select * from sys.tables where name = 'dim_audit' and type = 'U')
drop table dim_audit
go
Create Table dim_audit
(
audit_id int identity(1,1) primary key,
batch_id int,
package_name nvarchar(255) not null,
file_name nvarchar(255) not null,
rows_extracted int, --rows in the source file
rows_inserted int, -- in fact_transactions
--rows_updated int,
rows_rejected int,
created_at datetime default(getdate()),
updated_at datetime default(getdate()),
SuccessfulProcessingInd nchar(1) not null default 'N'
)

alter table [errors audit] add audit_id int not null default(-1);
go
alter table [source Errors] add audit_id int not null default(-1);

