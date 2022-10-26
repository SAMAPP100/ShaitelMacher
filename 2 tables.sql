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
        constraint ck_Appointments_DateAndTime_must_be_booked_within_at_least_48_hours check(datediff(hour, getdate(), DateAndTime) >= 48),
        constraint ck_Appointments_DateAndTime_must_be_booked_within_at_most_6_months check(datediff(month, getdate(), DateAndTime) <= 6),
    NewShaitel bit not null default 0,
    AppointmentType varchar(100) not null constraint ck_Appointments_AppointmentType_cannot_be_blank check(AppointmentType <> ''),
    ShaitelPrice decimal(6,2) not null default 0,
    Profit int not null,
    Cancelation bit not null default 0,
    constraint ck_Appointments_if_canceled_within_24_hours_has_a_charge_of_40_dollars check(Profit = case when ((Cancelation = 1) and (datediff(hour, getdate(), DateAndTime) <= 24)) then 40 else Profit end)
)
go
