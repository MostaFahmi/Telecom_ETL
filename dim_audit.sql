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
