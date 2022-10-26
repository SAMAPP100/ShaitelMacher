use ShaitelMacherDB
go

drop table if exists Appointments 
go

create table dbo.Appointments(
    FirstName varchar(25) not null constraint ck_Appointments_FirstName_cannot_be_blank check(FirstName <> ''),
    LastName varchar(25) not null constraint ck_Appointments_LastName_cannot_be_blank check(LastName <> ''),
    DateAndTime datetime not null 
        constraint ck_Appointments_DateAndTime_must_be_between_9_and_5 check(datepart(hour, DateAndTime) between 9 and 17),
        constraint ck_Appointments_DateAndTime_must_be_on_the_half_hour check(datepart(minute, DateAndTime) in(0, 30)),
    NewShaitel bit not null default 0,
    AppointmentType varchar(100) not null constraint ck_Appointments_AppointmentType_cannot_be_blank check(AppointmentType <> ''),
    ShaitelPrice decimal(6,2) not null default 0,
    Profit int not null constraint ck_Appointments_Profit_must_be_at_least_40 check(Profit >= 40)
)
go
