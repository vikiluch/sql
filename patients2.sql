select *
from public.encounters
where encounterclass in ('outpatient', 'ambulatory')
and stop between '2023-01-01 00:00' and '2023-12-31 23:59'




select description, 
      count(*) as count_of_cond
from public.conditions
where description !='Body Mass Index 30.0-30.9, adult' 
group by description
having count(*) > 2000
order by count(*) desc





select *
from public.patients
where city='Boston'



select * 
from public.conditions
where code in ('585.1', '585.2', '585.3', '585.4')




select * from public.patients
---------------------------------------------
--this query, gives me the count 
--of all patients from their city of residence
----------------------------------------------
/*
ther must have been at least 50 patients
*/

select city, count(*)
from public.patients
where city!='Boston'
group by city
having count(*) >=50
order by count(*) desc






select tab1.*, 
       tab2.first, 
       tab2.last, 
       tab2.birthdate
from public.immunizations as tab1
left join public.patients as tab2
on tab1.patient = tab2.id



select pat.id, 
imm.patient, pat.first, pat.last,imm.description
from patients as pat
left join immunizations as imm
on pat.id=imm.patient
and pat.first='Vicky'
--we are not able to see any rows which match id 'Vicki', 
--id has to be matched in imm table
--and we have an error like repetitive rows
--its call 'one to many relationship'






