--1) A list of all appointments for the day, in the following format
   -- Row for the day
    --Time, First name, Last name, If they're buying a new sheitel, How much they need to pay
select a.FirstName, a.LastName, NewShaitel  = case when a.NewShaitel = 1 then 'New' else 'Old' end, Payment = case when a.NewShaitel = 1 then a.ShaitelPrice else a.Profit end
from Appointments a
--2) A report with the profit for every week/month
select Profit = sum(a.Profit), Month = datepart(month, a.DateAndTime)
from Appointments a
group by datepart(month, a.DateAndTime)

select Profit = sum(a.Profit), Month = datepart(week, a.DateAndTime)
from Appointments a
group by datepart(week, a.DateAndTime)
--3) A report with the profit on sales, and for appointments separately
select ProfitOnSales = sum(a.Profit)
from Appointments a 
where a.NewShaitel = 1

select ProfitOnAppointments = sum(a.Profit)
from Appointments a 
where a.NewShaitel = 0
--4) I need a report of profit per sheitel brand
select ProfitPerBrand = sum(a.Profit), a.AppointmentType
from Appointments a 
where a.NewShaitel = 1
group by a.AppointmentType
--5) How much I need to pay all the sheitel suppliers
select OweSuppliers = sum(a.ShaitelPrice - a.Profit), a.AppointmentType
from Appointments a 
where a.NewShaitel = 1
group by a.AppointmentType
