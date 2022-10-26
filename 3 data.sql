use ShaitelMacherDB
go

delete Appointments
go

insert Appointments(FirstName, LastName, DateAndTime, NewShaitel, AppointmentType, ShaitelPrice, Profit, Cancelation)
select 'Tzippy', 'Berger', '2022-12-12 12:30:00', 1, 'TheWigCo', 1200, 300, 0
union select 'Sarah', 'Blau', '2022-10-12 13:30:00', 0, 'Style', 0, 40, 0
union select 'Gitty', 'Gold', '2022-10-13 11:00:00', 0,'Style', 0, 80, 0
union select 'Gitty', 'Gold', '2022-10-13 11:00:00', 0,'Style', 0, 80, 0
union select 'Zahava', 'Green', '2022-10-13 12:00:00', 1, 'LuckyMe', 1300, 300, 0
union select 'Chumi', 'Schwartz', '2022-10-14 9:00:00', 0, 'Style', 0, 0, 1
union select 'Leah', 'Roth', '2022-10-14 10:00:00', 1, 'TheWigCo', 1100, 300, 0

