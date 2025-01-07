CREATE DATABASE Temp

--Student Table 

CREATE TABLE Student( 
s_id VARCHAR(20), 
s_name VARCHAR(20) NOT NULL DEFAULT '', 
s_birth VARCHAR(20) NOT NULL DEFAULT '', 
s_sex VARCHAR(10) NOT NULL DEFAULT '', 
PRIMARY KEY(s_id) 
); 

--Course Table 

CREATE TABLE Course( 
c_id VARCHAR(20), 
c_name VARCHAR(20) NOT NULL DEFAULT '', 
t_id VARCHAR(20) NOT NULL, 
PRIMARY KEY(c_id) 
); 

--Teacher Table 

CREATE TABLE Teacher( 
t_id VARCHAR(20), 
t_name VARCHAR(20) NOT NULL DEFAULT '', 
PRIMARY KEY(t_id) 
); 

 

--Score Table 
CREATE TABLE Score( 
s_id VARCHAR(20), 
c_id VARCHAR(20), 
s_score INT, 
PRIMARY KEY(s_id,c_id) 
);
 

--Insert test data into Student Table 

insert into Student values('01' , 'Zhao Lei' , '1990-01-01' , 'Male'); 

insert into Student values('02' , 'Qian Dian' , '1990-12-21' , 'Male'); 

insert into Student values('03' , 'Sun Feng' , '1990-05-20' , 'Male'); 

insert into Student values('04' , 'Li Yun' , '1990-08-06' , 'Male'); 

insert into Student values('05' , 'Zhou Mei' , '1991-12-01' , 'Female'); 

insert into Student values('06' , 'Wu Lan' , '1992-03-01' , 'Female'); 

insert into Student values('07' , 'Zheng Zhu' , '1989-07-01' , 'Female'); 

insert into Student values('08' , 'Wang Ju' , '1990-01-20' , 'Female'); 

 

--Insert test data into Course  Table 

insert into Course values('01' , 'Mandarin' , '02'); 

insert into Course values('02' , 'Maths' , '01'); 

insert into Course values('03' , 'English' , '03'); 

 

--Insert test data into Teacher Table 

insert into Teacher values('01' , 'Chang San'); 

insert into Teacher values('02' , 'Li Si'); 

insert into Teacher values('03' , 'Wang Wu'); 

 

 

--Insert test data into Score Table 

insert into Score values('01' , '01' , 80); 

insert into Score values('01' , '02' , 90); 

insert into Score values('01' , '03' , 99); 

insert into Score values('02' , '01' , 70); 

insert into Score values('02' , '02' , 60); 

insert into Score values('02' , '03' , 80); 

insert into Score values('03' , '01' , 80); 

insert into Score values('03' , '02' , 80); 

insert into Score values('03' , '03' , 80); 

insert into Score values('04' , '01' , 50); 

insert into Score values('04' , '02' , 30); 

insert into Score values('04' , '03' , 20); 

insert into Score values('05' , '01' , 76); 

insert into Score values('05' , '02' , 87); 

insert into Score values('06' , '01' , 31); 

insert into Score values('06' , '03' , 34); 

insert into Score values('07' , '02' , 89); 

insert into Score values('07' , '03' , 98); 