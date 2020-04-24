/*
* Create Statements:-
*/
create table DOCTORS (
     D_ID int, 
     D_NAME varchar(45), 
     D_GENDER varchar(2), 
     D_AGE int, 
     D_SPECIALIZATION varchar(45),
     D_YEARS_OF_EXPERIENCE int, 
     D_CONTACT varchar(45), 
     D_STREET varchar(45), 
     D_CITY varchar(45),
     primary key(D_ID));

     
     
    create table PATIENTS (
     P_ID int, 
     P_NAME varchar(45), 
     P_GENDER varchar(2), 
     P_AGE int, 
     P_DISEASE varchar(45), 
     P_CONTACT varchar(45),
     P_STREET varchar(45), 
     P_CITY varchar(45),
     primary key(P_ID));
     
     
     create table NURSES (
        N_ID int, 
        N_NAME varchar(45), 
        N_SPECIALIZATION varchar(45), 
        N_STREET varchar(45), 
        N_CITY varchar(45),
        primary key(N_ID));   
        
    create table P_ASSIGNMENT (
        P_ID int, 
        D_ID int,
        primary key(P_ID,D_ID),
        CONSTRAINT FK_PATIENTS FOREIGN KEY (P_ID) REFERENCES PATIENTS(P_ID),
        CONSTRAINT FK_DOCTORS FOREIGN KEY (D_ID) REFERENCES DOCTORS(D_ID));    
        
    create table N_ASSISTS (
        N_ID int, 
        D_ID int,
        primary key(N_ID,D_ID),
        CONSTRAINT FK_NURSES FOREIGN KEY (N_ID) REFERENCES NURSES(N_ID),
        CONSTRAINT FK_DOCTORS_ASSISTS FOREIGN KEY (D_ID) REFERENCES DOCTORS(D_ID));
        
    create table TESTS (
        T_ID int, 
        T_NAME varchar(45), 
        P_ID int, 
        D_ID int, 
        T_DATE varchar(45),
        T_RESULT varchar(45),
        primary key(T_ID),
        CONSTRAINT FK_TESTS_PATIENTS FOREIGN KEY (P_ID) REFERENCES PATIENTS(P_ID),
        CONSTRAINT FK_TESTS_DOCTORS FOREIGN KEY (D_ID) REFERENCES DOCTORS(D_ID));   
