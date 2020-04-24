select D_NAME from DOCTORS where D_CONTACT like '978%';

select D_NAME from DOCTORS,P_ASSIGNMENT,PATIENTS where DOCTORS.D_ID = P_ASSIGNMENT.D_ID and PATIENTS.P_ID = P_ASSIGNMENT.P_ID and P_NAME = 'RICHARD MILLER';

select p.P_NAME,p.P_DISEASE,t.T_RESULT from PATIENTS p,TESTS t where t.P_ID=p.P_ID and p.P_DISEASE like '%Cancer%';

select P_NAME from PATIENTS where (p_STREET,P_CITY) in (select D_STREET , D_CITY from DOCTORS where D_NAME = 'JAMES SMITH');

select N_NAME from NURSES where N_ID in (select N1.N_ID from N_ASSISTS N1,N_ASSISTS N2 where  N1.N_ID = N2.N_ID and N1.D_ID <> N2.D_ID);

select N_NAME from NURSES where N_ID in  (select N1.N_ID from N_ASSISTS N1,N_ASSISTS N2 where N1.N_ID = N2.N_ID and N1.D_ID <> N2.D_ID group by N1.N_ID having count(*) = 2);

select AVG(D_YEARS_OF_EXPERIENCE) from DOCTORS;

select P_NAME from PATIENTS where P_ID in (select P_ID from P_ASSIGNMENT where D_ID in (select D_ID from DOCTORS where D_SPECIALIZATION='Neurology') group by P_ID having count(D_ID) = (select count(D_ID) from DOCTORS where D_SPECIALIZATION='Neurology'));

select D_NAME from DOCTORS where D_ID in (select D_ID from TESTS where T_RESULT='Positive' group by D_ID having count(T_RESULT) >= ALL (select count(T_RESULT) from TESTS where T_RESULT='Positive' group by D_ID));

select (select D_NAME from DOCTORS where D_ID=d.D_ID) ,count(na.N_ID) from DOCTORS d, N_ASSISTS na where d.D_ID=na.D_ID group by d.D_ID order by count(na.N_ID) desc;

select D_SPECIALIZATION,avg(D_YEARS_OF_EXPERIENCE) from DOCTORS group by D_SPECIALIZATION having avg(D_YEARS_OF_EXPERIENCE) >= ALL (select avg(D_YEARS_OF_EXPERIENCE) from DOCTORS group by D_SPECIALIZATION);

select D_NAME from DOCTORS where D_ID in (select D.D_ID from DOCTORS D,P_ASSIGNMENT PA,PATIENTS P where P.P_ID=PA.P_ID and D.D_ID=PA.D_ID group by D.D_ID,P.P_DISEASE having count(P.P_ID)>=ALL(select max(count(P.P_ID)) from DOCTORS D,P_ASSIGNMENT PA,PATIENTS P where P.P_ID=PA.P_ID and D.D_ID=PA.D_ID group by D.D_ID,P.P_DISEASE));

SELECT A.CITY,A.Count FROM ( SELECT Combine.CITY, sum(Combine.Count) Count FROM( SELECT D_CITY CITY , count(D_CITY) Count FROM   DOCTORS GROUP BY D_CITY UNION SELECT N_CITY CITY, count(N_CITY) Count FROM   NURSES GROUP BY N_CITY) Combine GROUP BY Combine.CITY) A WHERE  A.Count >= ALL(SELECT sum(Combine.Count) Count FROM ( SELECT D_CITY CITY, count(D_CITY) Count FROM   DOCTORS GROUP BY D_CITY UNION SELECT N_CITY CITY, count(N_CITY) Count FROM   NURSES GROUP BY N_CITY) Combine GROUP BY Combine.CITY);

update DOCTORS set D_YEARS_OF_EXPERIENCE = D_YEARS_OF_EXPERIENCE +1;

delete from TESTS where T_RESULT = 'Negative';
