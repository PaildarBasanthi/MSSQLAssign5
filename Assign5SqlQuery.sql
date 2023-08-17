create database Assesment5Db
use Assesment5Db
create schema Bank
Create table Bank.Customer
(CId int  identity(1000,1) Primary Key,
CName nvarchar(50) not null,
CEmail nvarchar(50) not null unique,
Contact varchar(10) not null unique,
CPwd as 
right(CName, 2) + cast(CId as nvarchar(10)) + left(Contact, 2)
persisted
)
create table Bank.MailInfo 
( MailTo nvarchar(100),
MailDate date default getdate(),
MailMessage nvarchar(255)
)

create trigger mail
on Bank.Customer
after insert
as
insert into Bank.MailInfo (MailTo, MailMessage)
select i.CEmail, 'Your net banking Password is : ' + i.CPwd + '. It is valid up to 2 days only. Update it.'
from inserted i;

insert into bank.Customer values ('Seetha', 'Seetha@yahoo.com', '9876543789')
insert into bank.Customer values( 'Ram', 'Ram@mail.com', '8989898908');


select * from bank.MailInfo
select* from Bank.Customer