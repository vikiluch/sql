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





insert into public.immunizations (date, patient, encounter, code,description)
values ('2024-05-11 12:32:05', 'cc53e99a-6715-603f-b074-may24fe05e11', 'ac02e16e-618c-e24a-b1d8-d4287111m111', '5302', 'Seasonal Flue Vaccine');

--checking our input
select *
from public.immunizations
order by date desc

--one more input
insert into public.immunizations (date, patient, encounter, code,description)
values ('2024-05-11 12:46:06', 'cc53e99a-6715-603f-b074-may24fe05e12', 'ac02e16e-618c-e24a-b1d8-d4287111m112', '5308', 'Adult Heptatitis A Vaccine');

--deleting one extra input
DELETE FROM public.immunizations
WHERE date = '2024-05-11 12:32:05';


--updating the info of the patient
update public.immunizations set 
encounter ='ea16937f-712c-44c3-93f4-13a431064a7a'
where encounter ='ac02e16e-618c-e24a-b1d8-d4287111m111';

--one more updating with different condition
update public.immunizations set 
encounter ='62674e35-7c5d-4381-f285-73b570956379'
where date ='2024-05-11 12:46:06';

--how to get the certain data and ignoring the time by
--convert the datetime value to a date-only format
SELECT date, code
FROM public.immunizations
WHERE DATE(date) = '2023-06-07';
--or 
SELECT date, code
FROM public.immunizations
WHERE date::date = '2023-06-07';

--cteating a new table
CREATE TABLE public.side_effects( 
	id BIGINT NOT NULL PRIMARY KEY,
    side_effects VARCHAR(50) NOT NULL,
	created_at TIMESTAMP DEFAULT now(),
	patient_id VARCHAR(50) NOT NULL,

    CONSTRAINT patient_id_fk FOREIGN KEY (patient_id) REFERENCES immunizations (patient)
);

select *
from public.side_effects

--adding data to a new table side_effects


INSERT INTO public.side_effects (id, side_effects, created_at, patient_id)
VALUES ('1', 'fever 101', '2024-05-14', 'cc53e99a-6715-603f-b074-may24fe05e12');



