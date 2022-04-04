-- final project of INS2080-01 1/2022
-- lecture Tran Thi Oanh

drop database if exists Residence_Management_System;
create database Residence_Management_System;
use Residence_Management_System;

drop table if exists PAYPERSON;
drop table if exists OWNERR;
drop table if exists APARTMENT;
drop table if exists LIVING_RESIDENT;
drop table if exists ENT_SERVICE;
drop table if exists ELEC_WATER_SERVICE;
drop table if exists PARKING_SERVICE;
drop table if exists ENT_SERVICES_LINE;
drop table if exists PARKING_SERVICE_LINE;
drop table if exists ELEC_WATER_SERVICE_LINE;

create table PAYPERSON(
fullname	 varchar(50),
phone	 varchar(50) primary key
);

create table OWNERR(
id	numeric(10) primary key,
fullname	varchar(50),
gender	varchar(1) check ( gender in ('M','F','I')), 
age	 numeric(3),
phone varchar(50)
);

create table APARTMENT(
aprtID varchar(4) primary key,
area numeric(2), 
numberOfBedRoom	numeric(1),
id	numeric(10),
phone	varchar(50),
foreign key (id) references OWNERR (id),
foreign key (phone) references PAYPERSON (phone)
);

create table LIVING_RESIDENT(
id	varchar(50) primary key,
fullname varchar(50),
gender	varchar(1) check ( gender in ('M','F','I')),
age	numeric(3),
phone	varchar(50),
aprtID	varchar(4),
foreign key (aprtID) references APARTMENT (aprtID)
);

create table ENT_SERVICE(
entID	numeric(1) primary key,
title	varchar(50) unique
);

create table ELEC_WATER_SERVICE (
ewID	numeric(1) primary key,
title	varchar(50) unique,
price	numeric(20)
);

create table PARKING_SERVICE(
pID	numeric(1) primary key,
title	varchar(50) unique,
price	numeric(10) 
);

CREATE TABLE ENT_SERVICES_LINE (
entID NUMERIC (1) REFERENCES ENT_SERVICE (entID), 
SUBCR_TIME numeric(8),
id varchar(12) REFERENCES LIVING_RESIDENT (id),
primary key (entID,SUBCR_TIME,id)
);

CREATE TABLE PARKING_SERVICE_LINE (
LicensePLate varchar (8),
SUBCR_TIME numeric(8), 
TypeOfVehicle varchar(50) REFERENCES PARKING_SERVICE (title),
Apartment VARCHAR(4) REFERENCES APARTMENT (aprtID)
);
ALTER TABLE PARKING_SERVICE_LINE ADD PRIMARY KEY (LicensePLate,SUBCR_TIME);
CREATE TABLE ELEC_WATER_SERVICE_LINE (
SUBCR_TIME numeric(5),
TypeOfServices varchar(50) REFERENCES ELEC_WATER_SERVICE (title),
Apartment numeric(4) REFERENCES APARTMENT (aprtID),
Quantity numeric (10),
CostPerUnit numeric (50) REFERENCES ELEC_WATER_SERVICE (price),
TotalCost numeric(50),
primary key (TypeOfServices,SUBCR_TIME,Apartment)
);
SET SQL_SAFE_UPDATES = 0;
UPDATE ELEC_WATER_SERVICE_LINE SET TotalCost=Quantity*CostPerUnit;
SET SQL_SAFE_UPDATES = 1;

insert into PAYPERSON (fullname, phone) values ('Danica Leyland','474-416-5066');
insert into PAYPERSON (fullname, phone) values ('Carmine Crowcombe','743-764-1914');
insert into PAYPERSON (fullname, phone) values ('Christel Hampson','757-701-9637');
insert into PAYPERSON (fullname, phone) values ('Putnem Dolbey','988-992-3168');
insert into PAYPERSON (fullname, phone) values ('Link Lind','835-619-5431');
insert into PAYPERSON (fullname, phone) values ('Lammond Tattershaw','540-739-7918');
insert into PAYPERSON (fullname, phone) values ('Steffane Marney','610-538-7806');
insert into PAYPERSON (fullname, phone) values ('Harmonia Balaisot','348-869-5392');
insert into PAYPERSON (fullname, phone) values ('Dukie Warfield','547-865-3410');
insert into PAYPERSON (fullname, phone) values ('Velvet Konneke','573-269-7380');
insert into PAYPERSON (fullname, phone) values ('Cathee Pressey','778-189-8867');
insert into PAYPERSON (fullname, phone) values ('Hildagard Sloey','529-896-5631');
insert into PAYPERSON (fullname, phone) values ('Aura Sawl','484-941-1694');
insert into PAYPERSON (fullname, phone) values ('Orland Megahey','320-810-4352');
insert into PAYPERSON (fullname, phone) values ('Mariele Harbidge','392-957-2195');
insert into PAYPERSON (fullname, phone) values ('Meg Bumpas','972-427-8443');
insert into PAYPERSON (fullname, phone) values ('Alissa Peyto','577-222-2493');
insert into PAYPERSON (fullname, phone) values ('Feliks Renac','710-891-8735');
insert into PAYPERSON (fullname, phone) values ('Nikaniki Pedroni','208-859-2731');
insert into PAYPERSON (fullname, phone) values ('Loralee Cowthard','975-704-3597');
insert into PAYPERSON (fullname, phone) values ('Adaline Hamblington','881-604-8462');
insert into PAYPERSON (fullname, phone) values ('Brigg Peer','686-281-9605');
insert into PAYPERSON (fullname, phone) values ('Essa Lavington','844-504-3889');
insert into PAYPERSON (fullname, phone) values ('Frasco Thayre','934-888-4925');
insert into PAYPERSON (fullname, phone) values ('Randolph Tye','412-773-9702');
insert into PAYPERSON (fullname, phone) values ('Hedy Raft', '191-123-1982');
insert into PAYPERSON (fullname, phone) values ('Dara Goublier','699-186-9099');
insert into PAYPERSON (fullname, phone) values ('Norton Avramov','376-210-4013');
insert into PAYPERSON (fullname, phone) values ('Hanni Lander','188-802-9945');
insert into PAYPERSON (fullname, phone) values ('Trip Defrain','292-753-2501');
insert into PAYPERSON (fullname, phone) values ('Zachariah Walcar','249-129-3171');
insert into PAYPERSON (fullname, phone) values ('Ward Mouat','303-547-3813');
insert into PAYPERSON (fullname, phone) values ('Kristofor Cobb','719-338-2043');
insert into PAYPERSON (fullname, phone) values ('Grete Mattedi','894-411-0096');
insert into PAYPERSON (fullname, phone) values ('Libby Bourthouloume','160-875-3498');
insert into PAYPERSON (fullname, phone) values ('Egor Petrakov','729-107-1587');
insert into PAYPERSON (fullname, phone) values ('Filmer Eckery','153-549-6434');
insert into PAYPERSON (fullname, phone) values ('Wendall Brickner','361-372-7586');
insert into PAYPERSON (fullname, phone) values ('Lynde Devons','435-980-2329');
insert into PAYPERSON (fullname, phone) values ('Parrnell Golbourn','149-943-4137');
insert into PAYPERSON (fullname, phone) values ('Ingaborg Learned','826-379-7121');
insert into PAYPERSON (fullname, phone) values ('Ulberto Bearcock','688-172-0148');
insert into PAYPERSON (fullname, phone) values ('Stavro Amyes','332-743-0431');
insert into PAYPERSON (fullname, phone) values ('Virginia Glyne','597-240-2442');
insert into PAYPERSON (fullname, phone) values ('Stillman Terram','451-772-2401');
insert into PAYPERSON (fullname, phone) values ('Tobie Shuttleworth','154-720-3820');
insert into PAYPERSON (fullname, phone) values ('Carrissa McMorran','233-896-8802');
insert into PAYPERSON (fullname, phone) values ('Andriana Rackham','666-145-8391');
insert into PAYPERSON (fullname, phone) values ('Domeniga McLanachan','602-170-5484');
insert into PAYPERSON (fullname, phone) values ('Huntley Moakson','736-378-9019');
insert into PAYPERSON (fullname, phone) values ('Cissiee Whettleton','441-768-4946');
insert into PAYPERSON (fullname, phone) values ('Mellisa Goudman','918-291-4075');
insert into PAYPERSON (fullname, phone) values ('Tyrus Sainte Paul','570-486-2443');
insert into PAYPERSON (fullname, phone) values ('Lenard Trenbey','914-901-6218');
insert into PAYPERSON (fullname, phone) values ('Carlie Quipp','188-297-1778');
insert into PAYPERSON (fullname, phone) values ('Aurie Skingley','444-672-9027');
insert into PAYPERSON (fullname, phone) values ('Jeni Prier','127-164-7029');
insert into PAYPERSON (fullname, phone) values ('Tarrance Squibbes','518-784-5152');
insert into PAYPERSON (fullname, phone) values ('Sheila Ellif','983-862-9015');
insert into PAYPERSON (fullname, phone) values ('Kelwin Cherrett','767-730-1285');
insert into PAYPERSON (fullname, phone) values ('Zeb Tigwell','449-634-4370');
insert into PAYPERSON (fullname, phone) values ('Augustina McKea','420-442-3340');
insert into PAYPERSON (fullname, phone) values ('Avrom Knell','842-866-7010');
insert into PAYPERSON (fullname, phone) values ('Vidovic Chaplyn','377-393-1739');
insert into PAYPERSON (fullname, phone) values ('Melodie Gummary','123-870-3883');
insert into PAYPERSON (fullname, phone) values ('Marcus Sail','754-188-2426');
insert into PAYPERSON (fullname, phone) values ('Antonin Beardshaw','935-728-8598');
insert into PAYPERSON (fullname, phone) values ('Bobby Hughson','412-450-9527');
insert into PAYPERSON (fullname, phone) values ('Tessa O''Corren','147-716-5491');
insert into PAYPERSON (fullname, phone) values ('Hadrian Gurnett','138-719-3151');


insert into OWNERR (id, fullname, gender, age, phone) values (3262293884, 'Danica Leyland', 'F', 46, '474-416-5066');
insert into OWNERR (id, fullname, gender, age, phone) values (6319348086, 'Carmine Crowcombe', 'F', 51, '743-764-1914');
insert into OWNERR (id, fullname, gender, age, phone) values (7386659616, 'Christel Hampson', 'F', 55, '757-701-9637');
insert into OWNERR (id, fullname, gender, age, phone) values (6709231847, 'Putnem Dolbey', 'M', 21, '988-992-3168');
insert into OWNERR (id, fullname, gender, age, phone) values (3264777533, 'Link Lind', 'M', 49, '835-619-5431');
insert into OWNERR (id, fullname, gender, age, phone) values (1228718605, 'Lammond Tattershaw', 'M', 41, '540-739-7918');
insert into OWNERR (id, fullname, gender, age, phone) values (1122442658, 'Steffane Marney', 'F', 40, '610-538-7806');
insert into OWNERR (id, fullname, gender, age, phone) values (8865968921, 'Harmonia Balaisot', 'F', 25, '348-869-5392');
insert into OWNERR (id, fullname, gender, age, phone) values (6033522248, 'Dukie Warfield', 'M', 36, '547-865-3410');
insert into OWNERR (id, fullname, gender, age, phone) values (7189265028, 'Velvet Konneke', 'F', 61, '573-269-7380');
insert into OWNERR (id, fullname, gender, age, phone) values (7508265512, 'Cathee Pressey', 'F', 49, '778-189-8867');
insert into OWNERR (id, fullname, gender, age, phone) values (1632813744, 'Hildagard Sloey', 'F', 37, '529-896-5631');
insert into OWNERR (id, fullname, gender, age, phone) values (7852352061, 'Aura Sawl', 'F', 51, '484-941-1694');
insert into OWNERR (id, fullname, gender, age, phone) values (9436734771, 'Orland Megahey', 'M', 33, '320-810-4352');
insert into OWNERR (id, fullname, gender, age, phone) values (7174445754, 'Mariele Harbidge', 'F', 74, '392-957-2195');
insert into OWNERR (id, fullname, gender, age, phone) values (4765249261, 'Meg Bumpas', 'F', 46, '972-427-8443');
insert into OWNERR (id, fullname, gender, age, phone) values (4781138743, 'Alissa Peyto', 'F', 32, '577-222-2493');
insert into OWNERR (id, fullname, gender, age, phone) values (5654922522, 'Feliks Renac', 'M', 27, '710-891-8735');
insert into OWNERR (id, fullname, gender, age, phone) values (7271743248, 'Nikaniki Pedroni', 'F', 64, '208-859-2731');
insert into OWNERR (id, fullname, gender, age, phone) values (7901182213, 'Loralee Cowthard', 'F', 35, '975-704-3597');
insert into OWNERR (id, fullname, gender, age, phone) values (4164511482, 'Adaline Hamblington', 'F', 54, '881-604-8462');
insert into OWNERR (id, fullname, gender, age, phone) values (5098761626, 'Brigg Peer', 'M', 78, '686-281-9605');
insert into OWNERR (id, fullname, gender, age, phone) values (6275829822, 'Essa Lavington', 'F', 44, '844-504-3889');
insert into OWNERR (id, fullname, gender, age, phone) values (3794899787, 'Frasco Thayre', 'M', 22, '934-888-4925');
insert into OWNERR (id, fullname, gender, age, phone) values (5467705891, 'Randolph Tye', 'M', 80, '412-773-9702');
insert into OWNERR (id, fullname, gender, age, phone) values (3487270027, 'Hedy Raft', 'F', 78, '191-123-1982');
insert into OWNERR (id, fullname, gender, age, phone) values (2219819795, 'Dara Goublier', 'F', 74, '699-186-9099');
insert into OWNERR (id, fullname, gender, age, phone) values (6955599430, 'Norton Avramov', 'M', 45, '376-210-4013');
insert into OWNERR (id, fullname, gender, age, phone) values (8408964239, 'Hanni Lander', 'F', 46, '188-802-9945');
insert into OWNERR (id, fullname, gender, age, phone) values (3140352990, 'Trip Defrain', 'M', 60, '292-753-2501');
insert into OWNERR (id, fullname, gender, age, phone) values (5174262251, 'Zachariah Walcar', 'M', 72, '249-129-3171');
insert into OWNERR (id, fullname, gender, age, phone) values (4092620512, 'Ward Mouat', 'M', 77, '303-547-3813');
insert into OWNERR (id, fullname, gender, age, phone) values (2600628099, 'Kristofor Cobb', 'M', 70, '719-338-2043');
insert into OWNERR (id, fullname, gender, age, phone) values (1362694342, 'Grete Mattedi', 'F', 71, '894-411-0096');
insert into OWNERR (id, fullname, gender, age, phone) values (3154725366, 'Libby Bourthouloume', 'F', 38, '160-875-3498');
insert into OWNERR (id, fullname, gender, age, phone) values (4766673894, 'Kelvin Stonham', 'M', 38, '476-569-5502');
insert into OWNERR (id, fullname, gender, age, phone) values (1935459206, 'Nickolaus Urwen', 'M', 66, '681-152-4021');
insert into OWNERR (id, fullname, gender, age, phone) values (9095012207, 'Tyrus Hanwright', 'M', 30, '847-157-8165');
insert into OWNERR (id, fullname, gender, age, phone) values (8869799686, 'Addy Williscroft', 'F', 76, '929-750-8686');
insert into OWNERR (id, fullname, gender, age, phone) values (7836934110, 'Nevsa Iacomo', 'F', 21, '697-973-9807');
insert into OWNERR (id, fullname, gender, age, phone) values (5023366877, 'Torrey Girkin', 'M', 70, '488-528-3144');
insert into OWNERR (id, fullname, gender, age, phone) values (7245179542, 'Felipa Santon', 'F', 23, '457-175-0159');
insert into OWNERR (id, fullname, gender, age, phone) values (8130029012, 'Gregory Barrable', 'M', 69, '185-890-4939');
insert into OWNERR (id, fullname, gender, age, phone) values (1217874213, 'Arin Inott', 'M', 25, '765-309-3587');
insert into OWNERR (id, fullname, gender, age, phone) values (7865498877, 'Tabby MacScherie', 'F', 62, '881-569-5180');
insert into OWNERR (id, fullname, gender, age, phone) values (9686191264, 'Doralynn Murrison', 'F', 72, '102-685-0732');
insert into OWNERR (id, fullname, gender, age, phone) values (4295874443, 'Otis Garlinge', 'M', 18, '159-909-1949');
insert into OWNERR (id, fullname, gender, age, phone) values (9950258307, 'Zitella Toffolini', 'F', 30, '977-238-4984');
insert into OWNERR (id, fullname, gender, age, phone) values (5491367208, 'Mirilla Abbys', 'F', 32, '185-844-1041');
insert into OWNERR (id, fullname, gender, age, phone) values (8019366550, 'Dante Clapson', 'M', 30, '399-329-9249');

insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0101, 35, 1, 6709231847,'988-992-3168');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0201, 35, 1, 4766673894,'420-442-3340');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0301, 35, 1,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0401, 35, 1, 1935459206,'233-896-8802');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0501, 35, 1, 4295874443,'826-379-7121');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0601, 35, 1,null,null); 
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0701, 35, 1, 7901182213,'975-704-3597'); 
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0801, 35, 1, 8865968921,'348-869-5392');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0901, 35, 1, 5654922522,'710-891-8735');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1001, 35, 1, 6275829822,'844-504-3889');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0102, 35, 1, 4295874443,'147-716-5491');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0202, 35, 1, 4766673894,'449-634-4370');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0302, 35, 1, 4295874443,'914-901-6218');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0402, 35, 1, 7245179542,'154-720-3820');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0502, 35, 1, 3794899787,'149-943-4137');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0602, 35, 1, 3794899787,'934-888-4925');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0702, 35, 1, 9436734771,'320-810-4352');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0802, 35, 1,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0902, 35, 1, 4781138743,'577-222-2493');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1002, 35, 1, 6955599430,'376-210-4013');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0103, 55, 2, 4781138743,'412-450-9527');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0203, 55, 2, 7245179542,'767-730-1285');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0303, 55, 2, 5098761626,'570-486-2443');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0403, 55, 2,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0503, 55, 2, 8130029012,'435-980-2329');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0603, 55, 2, 1362694342,'894-411-0096');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0703, 55, 2, 1362694342,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0803, 55, 2, 1228718605,'540-739-7918');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0903, 55, 2, 4164511482,'881-604-8462');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1003, 55, 2, 5467705891,'412-773-9702');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0104, 55, 2, 7245179542,'935-728-8598');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0204, 55, 2, 9686191264,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0304, 55, 2, 9686191264,'918-291-4075');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0404, 55, 2, 8130029012,'451-772-2401');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0504, 55, 2,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0604, 55, 2, 2600628099,'719-338-2043');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0704, 55, 2, 7271743248,'208-859-2731');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0804, 55, 2, 1122442658,'610-538-7806');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0904, 55, 2, 3262293884,'474-416-5066');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1004, 55, 2, 5098761626,'686-281-9605');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0105, 55, 2,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0205, 55, 2, 8130029012,'983-862-9015');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0305, 55, 2, 1217874213,'441-768-4946');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0405, 55, 2, 1217874213,'597-240-2442');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0505, 55, 2, 4765249261,'361-372-7586');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0605, 55, 2, 4092620512,'303-547-3813'); 
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0705, 55, 2, 4765249261,'972-427-8443');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0805, 55, 2, 6033522248,'547-865-3410');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0905, 55, 2,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1005, 55, 2,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0106, 75, 3, 1632813744,'529-896-5631');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0206, 75, 3, 7836934110,'518-784-5152');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0306, 75, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0406, 75, 3, 9950258307,'332-743-0431');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0506, 75, 3, 9950258307,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0606, 75, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0706, 75, 3, 7852352061,'484-941-1694');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0806, 75, 3, 7174445754,'392-957-2195');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0906, 75, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1006, 75, 3, 7836934110,'138-719-3151');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0107, 75, 3, 7852352061,'123-870-3883');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0207, 75, 3, 5023366877,'127-164-7029');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0307, 75, 3, 5023366877,'736-378-9019');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0407, 75, 3, 5491367208,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0507, 75, 3, 5491367208,'153-549-6434');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0607, 75, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0707, 75, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0807, 75, 3, 3487270027,'191-123-1982');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0907, 75, 3, 6319348086,'743-764-1914');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1007, 75, 3, 2219819795,'754-188-2426');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0108, 75, 3, 8019366550,'377-393-1739');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0208, 75, 3, 7865498877,'444-672-9027');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0308, 75, 3, 7865498877,'602-170-5484');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0408, 75, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0508, 75, 3, 9095012207,'729-107-1587');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0608, 75, 3, 5174262251,'249-129-3171');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0708, 75, 3, 9095012207,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0808, 75, 3, 2219819795,'699-186-9099');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0908, 75, 3, 7386659616,'757-701-9637');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1008, 75, 3, 9686191264,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0109, 95, 3, 9686191264,'842-866-7010');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0209, 95, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0309, 95, 3, 9095012207,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0409, 95, 3, 9095012207,'688-172-0148');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0509, 95, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0609, 95, 3, 3140352990,'292-753-2501');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0709, 95, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0809, 95, 3, 8408964239,'188-802-9945');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0909, 95, 3, 2219819795,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1009, 95, 3, 7508265512,'778-189-8867');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0110, 95, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0210, 95, 3, 9095012207,'188-297-1778');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0310, 95, 3, 8869799686,'666-145-8391'); 
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0410, 95, 3, 9095012207,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0510, 95, 3, 3154725366,'160-875-3498');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0610, 95, 3, 8408964239,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0710, 95, 3, 7189265028,'573-269-7380');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0810, 95, 3,null,null);
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (0910, 95, 3, 3264777533,'835-619-5431');
insert into APARTMENT (aprtID, area, numberOfBedRoom, id, phone) value (1010, 95, 3,null,null);



insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4481423578, 'Dinnie Allridge', 'F', 10, null,0208);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8753397540, 'Sheilah Spellsworth', 'F', 4, null,0307);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1716767279, 'Dov Meynell', 'M', 12, null,0103);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4401434412, 'Carroll Bathow', 'F', 6, null,0202);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5058369668, 'Heidie Warmington', 'F', 9, null,0305);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3739458491, 'Moses Malkinson', 'M', 11, null,0310);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6553621321, 'Cesar Wadley', 'M', 1, null,0406);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5126814296, 'Terry Dymocke', 'M', 5, null,0208);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2595609731, 'Florinda Ebbers', 'F', 14, null,0404);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8736213731, 'Roanne Searchwell', 'F', 2, null,0602);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1220157015, 'Menard Chesters', 'M', 12, null,0106);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8766758089, 'Phillipe Spreull', 'M', 14, null,0604);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6614288972, 'Riane Margrem', 'F', 1, null,0305);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3630221353, 'Wade Stollery', 'M', 12, null,0404);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7324549330, 'Goober Jermin', 'M', 5, null,0704);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7144137491, 'Rriocard Standish-Brooks', 'M', 8, null,0705);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2535401985, 'Rebecca Vedikhov', 'F', 14, null,0404);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5072111313, 'Stace Ridoutt', 'F', 3, null,0803);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5047664761, 'Jayme Aulton', 'F', 15, null,0508);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5796697499, 'Camille Stoven', 'F', 6, null,0210);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2520280595, 'Bryna Eynaud', 'F', 1, null,0808);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7271201287, 'Lewiss Gammade', 'M', 8, null,0804);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8082649443, 'Sheila-kathryn Phethean', 'F', 9, null,0805);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6363860133, 'Emmet Southernwood', 'M', 5, null,0904);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7267437423, 'Thaine Garthshore', 'M', 1, null,0503);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1882392179, 'Velma Radden', 'F', 15, null,0505);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5148150230, 'Hedwiga Berfoot', 'F', 4, null,0510);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6116025431, 'Abagail Gradwell', 'F', 3, null,0809);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7357620602, 'Arlin Skillern', 'M', 14, null,0405);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1617936492, 'Stevie Philipsson', 'M', 3, null,0804);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5077913730, 'Arnie Hedan', 'M', 14, null,0605);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8307825180, 'Roslyn Bosdet', 'F', 1, null,0409);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7136848551, 'Ernesto Antoni', 'M', 6, null,0107);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5462607138, 'Lamar Tookey', 'M', 1, null,0609);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7822092923, 'Orran Cadle', 'M', 2, null,0907);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4505532666, 'Becca Beentjes', 'F', 2, null,1003);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3507685606, 'Viki Elner', 'F', 4, null,0203);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9437796974, 'Vance Disney', 'M', 10, null,0109);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4488287935, 'Carmon Johncey', 'F', 5, null,1007);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9818156691, 'Hermon Rosini', 'M', 15, null,0806);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4368797578, 'Esme Cummings', 'F', 8, null,0806);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6624744426, 'Hyacinthia Peregrine', 'F', 9, null,0910);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7346150048, 'Annis Timoney', 'F', 4, null,0107);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4067146240, 'Delainey Murtimer', 'M', 7, null,0706);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8950899129, 'Quint Mansion', 'M', 8, null,1006);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6554110066, 'Starr Kasting', 'F', 20, '876-893-0549',0608);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6517379390, 'Jermayne Lanney', 'M', 17, '679-998-3872',0705);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9666506539, 'Fernandina Eastlake', 'F', 25, '977-845-4256',1004);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5536357242, 'Queenie Shalloo', 'F', 21, '776-763-4459',0404);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4806358413, 'Adan Clardge', 'F', 28, '294-867-6038',0202);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6297426457, 'Kordula Hearns', 'F', 28, '255-967-1673',0102);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5444205831, 'Janeen Lempke', 'F', 28, '888-987-8625',1009);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5071669859, 'Patin Chadbourne', 'M', 25, '751-639-0734',1009);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3963821594, 'Raynard Dyster', 'M', 21, '633-324-5281',0907);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9030202848, 'Phyllis Folca', 'F', 22, '491-903-3988',0603);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9281018183, 'Randolph Pauletti', 'M', 26, '733-719-3377',0902);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4213726709, 'Nada Valeri', 'F', 23, '970-784-2913',0101);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5798595615, 'Eadie Sackey', 'F', 27, '590-538-6449',0308);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5221887978, 'Rem Vidyapin', 'M', 26, '280-408-1475',0307);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4631337042, 'Giana OnullHeffernan', 'F', 22, '157-815-3330',0706);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7975747067, 'Elvira Osgorby', 'F', 26, '512-172-4395',0102);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5201096082, 'Claudina Camili', 'F', 30, '541-916-2010',0903);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3322366622, 'Zuzana Tooth', 'F', 25, '442-723-4549',0203);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5760563362, 'Pieter Fawdery', 'M', 30, '505-637-4103',1006);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1427640131, 'Oliviero Goldsbury', 'M', 30, '645-959-9169',0103);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1064780886, 'Elene Dowthwaite', 'F', 26, '536-755-1107',0505);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5313694078, 'Cozmo Bromehed', 'M', 28, '989-804-7988',0205);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3129025210, 'Heath Hessentaler', 'F', 27, '726-828-5516',0609);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6982689761, 'Bernie Clementi', 'M', 24, '877-722-3164',0103);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2981344840, 'Lynna Tuma', 'F', 23, '100-487-0033',0604);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9237384533, 'Trixie Jelks', 'F', 21, '854-757-9413',0809);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6129001944, 'Juan Gent', 'M', 30, '416-481-9073',0608);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8691983743, 'Walther Sprowles', 'M', 23, '170-634-7173',0801);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8472271705, 'Reese Crosfeld', 'M', 22, '982-850-4016',0109);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2483773845, 'Blayne Dufour', 'M', 24, '743-456-3607',0803);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7482174091, 'Kori Evans', 'F', 20, '163-470-1535',0405);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3311454254, 'Nolie Ibberson', 'F', 16, '414-248-1851',0807);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1258539885, 'Gleda Pidon', 'F', 29, '459-211-1275',0704);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4623288051, 'Hildy Buckel', 'F', 17, '191-380-7480',0908);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3607780607, 'Culley Le Brom', 'M', 25, '911-727-8274',0107);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3082742574, 'Guthry Spandley', 'M', 16, '864-238-1803',0710);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2773665743, 'Salvatore Arnaudin', 'M', 19, '266-864-1466',1007);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7696224562, 'Burnard Wedlake', 'M', 33, '626-751-4032',0510);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6944111283, 'Bryana Cunradi', 'F', 35, '870-571-2672',0205);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8491972856, 'Adler Lumsdon', 'M', 34, '288-884-6616',0406);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8391753373, 'Rosabella Ferry', 'F', 45, '774-479-5691',0808);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2186587137, 'Mal Barbery', 'M', 34, '576-607-7543',0908);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5672284501, 'Oralle Surmeyers', 'F', 45, '831-418-5911',0406);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6155602148, 'Igor Dollard', 'M', 49, '486-495-7063',0809);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1754470619, 'Gun Laroze', 'M', 46, '881-999-7077',0104);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3608564809, 'Lenee Lankham', 'F', 46, '512-917-3963',0305);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5873480005, 'Clerissa Guion', 'F', 50, '177-498-9668',0310);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3989050347, 'Silvia Bastock', 'F', 43, '280-953-0403',0206);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3919238210, 'Olivier Mulder', 'M', 49, '122-744-6294',0807);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9199651391, 'Meade Diviney', 'M', 50, '336-895-5485',0107);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7390920491, 'Nesta Kimmel', 'F', 42, '717-873-0912',0108);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6388043304, 'Zebulen Dumingo', 'M', 50, '849-593-0859',0507);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2453388023, 'Elsinore Antonignetti', 'F', 46, '263-821-9361',0206);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8860762032, 'Stevy Ennor', 'M', 38, '554-872-0045',0804);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7656232192, 'Doro Congreave', 'F', 35, '658-628-9264',0702);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9405586974, 'Jackie Foote', 'M', 45, '912-952-6725',0303);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2522140928, 'Alyse McKerrow', 'F', 45, '119-964-8078',0910);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2944561030, 'Welch Tabner', 'M', 33, '544-323-2299',0303);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8731983200, 'Yorgo Dobing', 'M', 31, '387-695-1891',0108);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9785474013, 'Emelita Aronov', 'F', 40, '744-487-3023',0508);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1769548214, 'Rusty Carlill', 'M', 41, '341-259-2990',0207);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6090438316, 'Allie Belliss', 'M', 32, '338-119-1774',0409);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7566002238, 'Mildrid Dohmer', 'F', 33, '544-486-2498',0502);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1360245791, 'Tove Hargate', 'F', 59, '762-319-4939',0207);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8343744049, 'Nolly Betke', 'M', 58, '109-292-7505',0710);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3731537244, 'Fremont Reddick', 'M', 51, '517-142-1269',0307);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9401070845, 'Lanie Golightly', 'F', 54, '602-974-0505',0503);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8132061234, 'Nonna Hardwell', 'F', 57, '580-408-6618',0109);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9877465469, 'Inger Barber', 'F', 58, '552-803-5842',0409);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6314364182, 'Morissa Ber', 'F', 54, '173-528-4794',0804);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4559146542, 'Patric Ritson', 'M', 57, '444-486-0106',0308);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7795527732, 'Saleem Morecomb', 'M', 52, '101-845-4066',0109);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3736746679, 'Ignatius Fountian', 'M', 60, '647-569-0394',0104);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9944623904, 'Clim Dowding', 'M', 59, '814-113-2514',0207);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7721755496, 'Jemmy Sidwick', 'F', 59, '791-341-9386',0106);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1566965596, 'Lilyan McNellis', 'F', 52, '880-741-8687',0310);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6178548540, 'Jesselyn Eliassen', 'F', 61, '994-768-1444',1007);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2439639976, 'Sherye Maase', 'F', 71, '793-523-4688',0304);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6940632605, 'Barron Cavanaugh', 'M', 72, '120-702-6347',0208);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2771349002, 'Antoinette Whipp', 'F', 74, '633-706-3956',0210);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7277718019, 'Pooh Jonas', 'M', 62, '796-450-7673',0710);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3819185996, 'Zora Revie', 'F', 77, '714-904-4831',0205);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6256983689, 'Tobit Danjoie', 'M', 64, '853-558-4890',0507);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4687022926, 'Maximo Wermerling', 'M', 61, '342-896-2610',1009);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4896951113, 'Egor Durtnel', 'M', 67, '300-456-8630',0507);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2108990530, 'Johanna Bergen', 'F', 75, '738-758-9628',0310);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3262293884, 'Danica Leyland', 'F', 46, '474-416-5066',0904);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6319348086, 'Carmine Crowcombe', 'F', 51, '743-764-1914',0907);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7386659616, 'Christel Hampson', 'F', 55, '757-701-9637',0908);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6709231847, 'Putnem Dolbey', 'M', 21, '988-992-3168',0101);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3264777533, 'Link Lind', 'M', 49, '835-619-5431',0910);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1228718605, 'Lammond Tattershaw', 'M', 41, '540-739-7918',0803);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1122442658, 'Steffane Marney', 'F', 40, '610-538-7806',0804);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8865968921, 'Harmonia Balaisot', 'F', 25, '348-869-5392',0801);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6033522248, 'Dukie Warfield', 'M', 36, '547-865-3410',0805);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7189265028, 'Velvet Konneke', 'F', 61, '573-269-7380',0710);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7508265512, 'Cathee Pressey', 'F', 49, '778-189-8867',1009);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1632813744, 'Hildagard Sloey', 'F', 37, '529-896-5631',0106);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7852352061, 'Aura Sawl', 'F', 51, '484-941-1694',0706);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9436734771, 'Orland Megahey', 'M', 33, '320-810-4352',0702);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7174445754, 'Mariele Harbidge', 'F', 74, '392-957-2195',0806);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4765249261, 'Meg Bumpas', 'F', 46, '972-427-8443',0705);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4781138743, 'Alissa Peyto', 'F', 32, '577-222-2493',0902);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5654922522, 'Feliks Renac', 'M', 27, '710-891-8735',0901);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7271743248, 'Nikaniki Pedroni', 'F', 64, '208-859-2731',0704);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (7901182213, 'Loralee Cowthard', 'F', 35, '975-704-3597',0701);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4164511482, 'Adaline Hamblington', 'F', 54, '881-604-8462',0903);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5098761626, 'Brigg Peer', 'M', 78, '686-281-9605',1004);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6275829822, 'Essa Lavington', 'F', 44, '844-504-3889',1001);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3794899787, 'Frasco Thayre', 'M', 22, '934-888-4925',0602);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5467705891, 'Randolph Tye', 'M', 80, '412-773-9702',1003);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3487270027, 'Hedy Raft', 'F', 78, '191-123-1982',0807);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2219819795, 'Dara Goublier', 'F', 74, '699-186-9099',0808);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6955599430, 'Norton Avramov', 'M', 45, '376-210-4013',1002);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8408964239, 'Hanni Lander', 'F', 46, '188-802-9945',0809);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3140352990, 'Trip Defrain', 'M', 60, '292-753-2501',0609);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5174262251, 'Zachariah Walcar', 'M', 72, '249-129-3171',0608);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4092620512, 'Ward Mouat', 'M', 77, '303-547-3813',0605);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2600628099, 'Kristofor Cobb', 'M', 70, '719-338-2043',0604);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1362694342, 'Grete Mattedi', 'F', 71, '894-411-0096',0603);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3154725366, 'Libby Bourthouloume', 'F', 38, '160-875-3498',0510);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5987525327, 'Egor Petrakov', 'M', 33, '729-107-1587',0508);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5117375771, 'Filmer Eckery', 'M', 43, '153-549-6434',0507);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5728304375, 'Wendall Brickner', 'M', 37, '361-372-7586',0505);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3611123403, 'Lynde Devons', 'F', 28, '435-980-2329',0503);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5706510051, 'Parrnell Golbourn', 'M', 44, '149-943-4137',0502);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3682427795, 'Ingaborg Learned', 'F', 34, '826-379-7121',0501);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4257403605, 'Ulberto Bearcock', 'M', 34, '688-172-0148',0409);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1919146860, 'Stavro Amyes', 'M', 25, '332-743-0431',0406);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1678472807, 'Virginia Glyne', 'F', 50, '597-240-2442',0405);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1865513603, 'Stillman Terram', 'M', 35, '451-772-2401',0404);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3992631005, 'Tobie Shuttleworth', 'M', 50, '154-720-3820',0402);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1384017078, 'Carrissa McMorran', 'F', 28, '233-896-8802',0401);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1285895944, 'Andriana Rackham', 'F', 55, '666-145-8391',0310);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6586003563, 'Domeniga McLanachan', 'F', 59, '602-170-5484',0308);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8854689685, 'Huntley Moakson', 'M', 59, '736-378-9019',0307);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6881517384, 'Cissiee Whettleton', 'F', 52, '441-768-4946',0305);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6576544056, 'Mellisa Goudman', 'F', 60, '918-291-4075',0304);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (4116356432, 'Tyrus Sainte Paul', 'M', 54, '570-486-2443',0303);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9760118048, 'Lenard Trenbey', 'M', 57, '914-901-6218',0302);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2980995665, 'Carlie Quipp', 'M', 56, '188-297-1778',0210);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5564473124, 'Aurie Skingley', 'F', 60, '444-672-9027',0208);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (8244675422, 'Jeni Prier', 'F', 58, '127-164-7029',0207);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9091132944, 'Tarrance Squibbes', 'M', 53, '518-784-5152',0206);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2237139211, 'Sheila Ellif', 'F', 60, '983-862-9015',0205);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3130469878, 'Kelwin Cherrett', 'M', 57, '767-730-1285',0203);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5686807398, 'Zeb Tigwell', 'M', 21, '449-634-4370',0202);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6271289600, 'Augustina McKea', 'F', 19, '420-442-3340',0201);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (3491249108, 'Avrom Knell', 'M', 19, '842-866-7010',0109);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (9656197395, 'Vidovic Chaplyn', 'M', 25, '377-393-1739',0108);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (6873198918, 'Melodie Gummary', 'F', 24, '123-870-3883',0107);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1045877795, 'Marcus Sail', 'M', 18, '754-188-2426',1007);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (1475724042, 'Antonin Beardshaw', 'M', 20, '935-728-8598',0104);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (2029672649, 'Bobby Hughson', 'F', 24, '412-450-9527',0103);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5144711703, 'Tessa OnullCorren', 'F', 29, '147-716-5491',0102);
insert into LIVING_RESIDENT (id, fullname, gender, age, phone, aprtID) values (5731342782, 'Hadrian Gurnett', 'M', 25, '138-719-3151',1006);

insert into ENT_SERVICE (entID, title) value (1,'swimming pool');
insert into ENT_SERVICE (entID, title) value (2,'tennis');
insert into ENT_SERVICE (entID, title) value (3,'badminton');
insert into ENT_SERVICE (entID, title) value (4,'volleyball');
insert into ENT_SERVICE (entID, title) value (5,'basketball');
insert into ENT_SERVICE (entID, title) value (6,'table tennis');


insert into ELEC_WATER_SERVICE (ewID, title, price) value (1,'electricity','2000');
insert into ELEC_WATER_SERVICE (ewID, title, price) value (2,'water','17000');

insert into PARKING_SERVICE (pID, title, price) value (1,'motobike',100000);
insert into PARKING_SERVICE (pID, title, price) value (2,'car',500000);
insert into PARKING_SERVICE (pID, title, price) value (3,'bicycle',50000);

insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0101', 344, 2000, null); 
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0101', 8, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0201', 350, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0201', 7, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0401', 336, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0401', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0501', 322, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0501', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0701', 349, 2000, null); 
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0701', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0801', 373, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0801', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0901', 395, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0901', 6, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','1001', 324, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','1001', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0102', 276, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0102', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0202',10, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0202', 8, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0302', 350, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0302', 7, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0402', 300, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0402', 6, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0502', 365, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0502', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0602', 390, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0602', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0702', 345, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0702', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0902', 376, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0902', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','1002', 382, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','1002', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0103', 534, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0103', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0203', 546, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0203', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0303', 510, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0303', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0503', 522, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0503', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0603', 590, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0603', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0803', 587, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0803', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0903', 522, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0903', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','1003', 566, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','1003', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0104', 533, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0104', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0304', 513, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0304', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0404', 587, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0404', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0604', 523, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0604', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0704', 598, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0704', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0804', 581, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0804', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0904', 584, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0904', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','1004', 501, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','1004', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0205', 562, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0205', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0305', 583, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0305', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0405', 509, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0405', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0505', 593, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0505', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0605', 560, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0605', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0705', 601, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0705', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0805', 632, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0805', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0106', 700, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0106', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0206', 739, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0206', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0406', 765, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0406', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0706', 763, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0706', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0806', 711, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0806', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','1006', 720, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','1006', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0107', 745, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0107', 18, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0207', 710, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0207', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0307', 800, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0307', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0507', 850, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0507', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0807', 622, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0807', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0907', 640, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0907', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','1007', 743, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','1007', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0108', 777, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0108', 19, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0208', 794, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0208', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0308', 740, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0308', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0508', 729, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0508', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0608', 720, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0608', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0808', 756, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0808', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0908', 650, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0908', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0109', 850, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0109', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0409', 899, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0409', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0609', 854, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0609', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0809', 948, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0809', 18, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','1009', 928, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','1009', 19, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0210', 972, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0210', 20, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0310', 920, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0310', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0510', 1002, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0510', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0710', 1103, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0710', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'electricity','0910', 982, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (11, 'water','0910', 18, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0101', 378, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0101', 7, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0201', 321, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0201', 8, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0401', 386, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0401', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0501', 310, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0501', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0701', 365, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0701', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0801', 301, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0801', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0901', 314, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0901', 7, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','1001', 312, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','1001', 8, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0102', 365, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0102', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0202', 300, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0202', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0302', 366, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0302', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0402', 377, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0402', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0502', 398, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0502', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0602', 376, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0602', 8, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0702', 346, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0702', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0902', 347, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0902', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','1002', 397, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','1002', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0103', 529, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0103', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0203', 574, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0203', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0303', 578, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0303', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0503', 518, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0503', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0603', 526, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0603', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0803', 539, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0803', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0903', 517, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0903', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','1003', 510, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','1003', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0104', 529, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0104', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0304', 607, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0304', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0404', 456, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0404', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0604', 499, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0604', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0704', 230, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0704', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0804', 510, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0804', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0904', 533, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0904', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','1004', 470, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','1004', 9, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0205', 420, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0205', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0305', 460, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0305', 11, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0405', 500, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0405', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0505', 479, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0505', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0605', 592, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0605', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0705', 548, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0705', 10, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0805', 521, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0805', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0106', 700, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0106', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0206', 650, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0206', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0406', 782, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0406', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0706', 790, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0706', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0806', 803, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0806', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','1006', 762, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','1006', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0107', 709, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0107', 18, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0207', 745, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0207', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0307', 763, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0307', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0507', 719, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0507', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0807', 790, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0807', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0907', 743, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0907', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','1007', 803, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','1007', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0108', 796, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0108', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0208', 710, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0208', 13, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0308', 739, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0308', 14, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0508', 752, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0508', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0608', 792, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0608', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0808', 678, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0808', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0908', 691, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0908', 12, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0109', 670, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0109', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0409', 890, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0409', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0609', 862, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0609', 15, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0809', 947, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0809', 16, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','1009', 928, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','1009', 19, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0210', 980, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0210', 17, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0310', 953, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0310', 18, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0510', 1045, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0510', 19, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0710', 962, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0710', 20, 17000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'electricity','0910', 1009, 2000, null);
insert into ELEC_WATER_SERVICE_LINE (SUBCR_TIME, typeOfServices, Apartment, Quantity, CostPerUnit, TotalCost) value (12, 'water','0910', 21, 17000, null);
SET SQL_SAFE_UPDATES = 0;
UPDATE ELEC_WATER_SERVICE_LINE SET TotalCost=Quantity*CostPerUnit;
SET SQL_SAFE_UPDATES = 1;
INSERT INTO `PARKING_SERVICE_LINE` (`LicensePLate`,`SUBCR_TIME`,`TypeOfVehicle`,`Apartment`)
VALUES
  ("PKS33PRP","11","motobike","0510"),
  ("IBL43OMN","12","car","0207"),
  ("XHR81IOI","11","car","0308"),
  ("BZK92TCC","12","bicycle","1007"),
  ("WPP55DZC","12","bicycle","0902"),
  ("ULR71VXG","11","bicycle","0808"),
  ("FNV90IXS","12","car","0804"),
  ("CBK63EPK","11","motobike","0107"),
  ("GGU23MDO","11","bicycle","0705"),
  ("AEP62VIU","12","bicycle","0604"),
  ("JGZ44ABS","12","car","0107"),
  ("SVX14ATI","12","car","0307"),
  ("LUJ48PDG","12","motobike","0809"),
  ("MMR33FTG","12","car","0409"),
  ("OUE47IOP","12","motobike","0104"),
  ("PXM12CAU","11","motobike","1003"),
  ("LNM63YAF","12","bicycle","0510"),
  ("HTZ36NDT","12","car","0603"),
  ("TCO14MNY","12","bicycle","1007"),
  ("RLL80FDB","11","car","0801"),
  ("STS63AKJ","11","motobike","0609"),
  ("FFB14VXE","11","bicycle","1003"),
  ("GDN54VYX","12","car","0208"),
  ("AFU25SCI","11","motobike","0102"),
  ("BCW62JKL","12","bicycle","0101"),
  ("EMN61RGG","11","bicycle","0806"),
  ("GCC13OUQ","12","bicycle","0907"),
  ("NTR42YUS","11","car","0303"),
  ("MXJ47YWK","11","motobike","0405"),
  ("MCY68EXN","11","car","0807"),
  ("YLA58GAQ","12","motobike","0508"),
  ("HZD75CDB","12","motobike","0107"),
  ("IGW21FKW","11","bicycle","0103"),
  ("RKT02TPO","12","bicycle","0207"),
  ("VSV85KOX","12","car","0210"),
  ("OQK86ZDW","11","bicycle","1006"),
  ("ISY03VYB","11","motobike","0805"),
  ("EEW37LYW","11","bicycle","0305"),
  ("FJO35XZC","11","bicycle","0603"),
  ("OER51THJ","11","bicycle","0310"),
  ("KAC55POL","12","car","0107"),
  ("KMS49BXI","12","car","0804"),
  ("DYB54WLF","11","car","1003"),
  ("KLQ40SML","12","car","0406"),
  ("INC49OUM","11","bicycle","0103"),
  ("NLW98JVH","11","motobike","0308"),
  ("GNB24WNV","12","car","0107"),
  ("GOU67PPK","12","motobike","0104"),
  ("IDM82CMI","12","car","0108"),
  ("QGL23OIA","11","car","1009"),
  ("QGJ52PTG","12","car","0405"),
  ("UTE72KCI","12","motobike","0705"),
  ("PWO77YUY","11","car","1009"),
  ("VWO12CIE","12","bicycle","0103"),
  ("LTY55KYX","11","bicycle","1003"),
  ("JBW64FIJ","12","bicycle","0908"),
  ("CUV26GCO","12","car","0303"),
  ("GTC20XSN","11","motobike","1004"),
  ("ULR36GRI","12","car","0710"),
  ("ETP66WPC","11","bicycle","0406"),
  ("WVT10BGO","11","car","0310"),
  ("WUR77XHL","12","bicycle","0310"),
  ("FMI60VWK","11","car","0207"),
  ("UXJ63IHT","11","car","0310"),
  ("JJA93TOP","11","bicycle","0609"),
  ("WZL13FOM","11","car","0710"),
  ("PKR16ISH","11","motobike","0705"),
  ("MYE16ENV","11","car","1003"),
  ("LIE72VEG","12","bicycle","1009"),
  ("HMI69HHP","12","car","0404"),
  ("XER74PLB","12","car","0406"),
  ("MEV40TEJ","11","car","0406"),
  ("TLK52UEM","11","motobike","0108"),
  ("CYH45LXW","11","bicycle","0806"),
  ("BOR77SBA","12","car","0406"),
  ("SNQ29BRV","12","car","0710"),
  ("RQH14CGI","12","car","0803"),
  ("FNX03CAQ","11","car","0404"),
  ("SVR51ENU","12","bicycle","0902"),
  ("VQN55CSE","12","car","0308"),
  ("NVJ93OTU","12","car","0405"),
  ("RJG11TVH","12","motobike","0806"),
  ("IDE42MVP","12","bicycle","0205"),
  ("JHY23GKO","12","motobike","0603"),
  ("GDV56VLP","11","bicycle","0705"),
  ("XEY48FER","12","motobike","1003"),
  ("DMU47NYI","11","motobike","0805"),
  ("EKJ37VBG","12","motobike","0507"),
  ("HCL28RCW","11","car","1007"),
  ("KQE61UZP","12","bicycle","0510"),
  ("UMU03NWR","12","motobike","0907"),
  ("IHT25LDZ","11","car","0409"),
  ("EGV49RZV","12","motobike","0910"),
  ("OFQ70PSJ","11","car","0203"),
  ("HDL03HDL","11","bicycle","0109"),
  ("MHF47FPP","11","car","1004"),
  ("FYQ32YLY","12","motobike","0109"),
  ("VSO55GFT","12","car","0609"),
  ("EAV57AGB","11","bicycle","0404"),
  ("KFH58SET","11","bicycle","0809");
  
INSERT INTO `ENT_SERVICES_LINE` (`entID`,`SUBCR_TIME`,`id`)
VALUES
  ("6","12","7136848551"),
  ("3","11","9091132944"),
  ("3","11","6624744426"),
  ("3","11","4164511482"),
  ("3","11","2981344840"),
  ("6","11","9437796974"),
  ("2","11","8082649443"),
  ("2","11","1122442658"),
  ("6","12","2981344840"),
  ("6","12","7482174091"),
  ("2","11","3264777533"),
  ("4","11","1384017078"),
  ("3","12","6297426457"),
  ("3","12","6319348086"),
  ("3","12","8391753373"),
  ("2","12","5201096082"),
  ("2","11","4213726709"),
  ("3","11","8854689685"),
  ("4","11","2186587137"),
  ("6","12","3794899787"),
  ("3","11","8865968921"),
  ("6","12","6881517384"),
  ("1","11","1754470619"),
  ("5","12","5798595615"),
  ("5","12","3487270027"),
  ("3","11","4092620512"),
  ("2","12","6033522248"),
  ("5","11","8391753373"),
  ("3","12","6586003563"),
  ("4","12","9030202848"),
  ("3","12","5686807398"),
  ("4","12","5706510051"),
  ("6","11","3487270027"),
  ("6","12","5728304375"),
  ("6","11","6709231847"),
  ("4","12","6554110066"),
  ("6","11","3264777533"),
  ("5","12","1754470619"),
  ("4","12","4781138743"),
  ("1","11","2186587137"),
  ("5","11","6319348086"),
  ("3","12","2600628099"),
  ("1","11","6881517384"),
  ("3","12","4092620512"),
  ("5","11","9091132944"),
  ("1","11","4781138743"),
  ("2","12","3082742574"),
  ("5","12","7975747067"),
  ("4","12","8082649443"),
  ("5","11","3311454254"),
  ("2","11","4806358413"),
  ("3","11","5760563362"),
  ("5","11","5144711703"),
  ("2","11","7271743248"),
  ("3","11","7566002238"),
  ("6","11","6275829822"),
  ("3","12","5071669859"),
  ("6","11","7357620602"),
  ("6","11","4765249261"),
  ("6","12","7271743248"),
  ("5","12","7901182213"),
  ("1","12","2029672649"),
  ("5","12","2773665743"),
  ("4","12","3963821594"),
  ("1","11","7822092923"),
  ("5","11","6129001944"),
  ("4","11","3264777533"),
  ("1","12","5536357242"),
  ("6","11","5077913730"),
  ("5","12","3129025210"),
  ("1","12","7189265028"),
  ("1","12","3963821594"),
  ("2","12","4257403605"),
  ("1","12","4781138743"),
  ("1","12","2186587137"),
  ("3","11","9944623904"),
  ("6","12","3963821594"),
  ("3","11","4213726709"),
  ("5","12","3154725366"),
  ("6","12","5564473124"),
  ("1","12","6297426457"),
  ("1","11","3611123403"),
  ("6","11","3129025210"),
  ("4","12","8691983743"),
  ("1","11","8391753373"),
  ("3","12","4116356432"),
  ("2","12","9436734771"),
  ("5","12","2600628099"),
  ("5","11","1258539885"),
  ("1","12","6586003563"),
  ("4","12","5798595615"),
  ("2","12","1384017078"),
  ("4","12","3992631005"),
  ("4","12","6517379390"),
  ("4","11","8472271705"),
  ("6","12","4623288051"),
  ("6","12","8408964239"),
  ("1","11","9666506539"),
  ("3","12","9437796974"),
  ("4","11","5117375771");

  


-- question 1

select count(*) 'number_of_not_sold_house'
from APARTMENT
where id is null;

select area, count(*)'number_of_not_sold_house'
from APARTMENT
where id is null
group by area 
order by area desc;

select aprtID, area, 'not sold'
from APARTMENT
where id is null
order by area desc;


-- question 2

select A.area, O.gender, count(*)
from APARTMENT A
inner join OWNERR O
on A.id = O.id
where area = 95 or area = 75
group by A.area, O.gender
order by area, gender desc;

select A.area, O.gender, O.age, count(*)
from APARTMENT A
inner join OWNERR O
on A.id = O.id
where area = 95 or area = 75
group by A.area, O.age
order by area, gender, count(*) desc;


-- question 3

drop view if exists Customer_Buy_House_For_Living;

create view Customer_Buy_House_For_Living as
select distinct O.id, L.fullname, O.phone
from OWNERR O 
inner join LIVING_RESIDENT L
ON O.id=L.id;

select * from Customer_Buy_House_For_Living;


-- question 4

drop view if exists Customer_Buy_For_Investment;

create view Customer_Buy_For_Investment as
select distinct O.id, O.fullname, O.phone
from OWNERR O 
left join LIVING_RESIDENT L 
on O.id = L.id
where L.id is null;

select * from Customer_Buy_For_Investment;


-- question 5

drop view if exists Trader;

create view Trader as
 select distinct A.id, O.fullname, O.phone
 from APARTMENT A
 inner join OWNERR O 
 on A.id = O.id
 where A.id is not null and A.phone is null;
 
 select * from Trader;

 
 -- question 6
 
 drop view if exists Customer_buy_more_than_1_apartment;
 
 create view Customer_buy_more_than_1_apartment as
 select A.id, O.fullname, O.phone, count(*)
 from APARTMENT A
 inner join OWNERR O 
 on A.id = O.id
 group by A.id
 having count(*) > 1
 order by count(*)desc;
 
 select * from Customer_buy_more_than_1_apartment;
 
 
 -- question 7
 
select  count(*) from Customer_Buy_House_For_Living;

select count(*) from Customer_Buy_For_Investment;

select count(*) from trader;

select count(*) from Customer_buy_more_than_1_apartment;

select count(*)
from APARTMENT
where id is not null;
 
 
-- question 8

select S.title, count(*)
from ENT_SERVICES_LINE E
inner join ENT_SERVICE S 
on S.entID=E.entID
group by E.entID
order by count(*) desc;

select count(*)
from ENT_SERVICES_LINE E
inner join ENT_SERVICE S 
on S.entID=E.entID;

-- question 9


select P.fullname, P.phone, A.aprtID
From APARTMENT A 
inner join PAYPERSON P 
on P.phone=A.phone
where A.aprtID = 0809;

select typeOfServices, quantity, costperunit, totalcost from ELEC_WATER_SERVICE_LINE
where typeOfServices = 'electricity' and apartment = 0809 and SUBCR_TIME = 12;

select typeOfServices, quantity, costperunit, totalcost from ELEC_WATER_SERVICE_LINE
where typeOfServices = 'water' and apartment = 0809 and SUBCR_TIME = 12;

select L.TypeOfVehicle, L.LicensePLate, S.price 
from PARKING_SERVICE_LINE L 
inner join PARKING_SERVICE S 
on S.title = L.TypeOfVehicle
where L.SUBCR_TIME = 12
and L.Apartment = 0809;


-- question 10


select apartment, totalcost 'electricity total cost'
from ELEC_WATER_SERVICE_LINE
where typeOfServices = 'electricity' 
and totalcost > (select avg(totalcost)
                 from ELEC_WATER_SERVICE_LINE
				 where typeOfServices = 'electricity')
and SUBCR_TIME = 12
order by totalcost desc;

select count(*)
from ELEC_WATER_SERVICE_LINE
where typeOfServices = 'electricity' 
and totalcost > (select avg(totalcost)
                 from ELEC_WATER_SERVICE_LINE
				 where typeOfServices = 'electricity')
and SUBCR_TIME = 12;

