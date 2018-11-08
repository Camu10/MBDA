---Tablas

CREATE TABLE staff
    (id VARCHAR(20) NOT NULL
    ,name VARCHAR(20)
    );  
CREATE TABLE student
    (id VARCHAR(20) NOT NULL
    ,name VARCHAR(50)
    ,sze NUMBER(11)
    ,parent VARCHAR(20)
    );
CREATE TABLE room
    (id VARCHAR(20) NOT NULL
    ,name VARCHAR(50)
    ,capacity NUMBER(11)
    ,parent VARCHAR(20)
    );
CREATE TABLE event
    (id VARCHAR(20) NOT NULL
    ,modle VARCHAR(20)
    ,kind CHAR(1)
    ,dow VARCHAR(15)
    ,tod CHAR(5)
    ,duration NUMBER(11)
    ,room VARCHAR(20)
    );
CREATE TABLE attends
    (student VARCHAR(20)  NOT NULL
    ,event VARCHAR(20) NOT NULL
    );
CREATE TABLE teaches
    (staff VARCHAR(20) NOT NULL
    ,event VARCHAR(20) NOT NULL
    );
CREATE TABLE occurs
    (event VARCHAR(20) NOT NULL
    ,week  VARCHAR(2) NOT NULL
    );
CREATE TABLE modle
    (id VARCHAR(20) NOT NULL
    ,name VARCHAR(50)
    );
CREATE TABLE week
    (id VARCHAR(2) NOT NULL
    ,wkstart DATE
    );


---Atributos, Primarias, Únicas, Foraneas

ALTER TABLE staff ADD CONSTRAINT PK_staff PRIMARY KEY(id);
ALTER TABLE room ADD CONSTRAINT PK_room PRIMARY KEY(id);
ALTER TABLE event ADD CONSTRAINT PK_event PRIMARY KEY(id);
ALTER TABLE attends ADD CONSTRAINT PK_attends PRIMARY KEY(student,event);
ALTER TABLE teaches ADD CONSTRAINT PK_teaches PRIMARY KEY(staff,event);
ALTER TABLE occurs ADD CONSTRAINT PK_occurs PRIMARY KEY(event,week);
ALTER TABLE modle ADD CONSTRAINT PK_modle PRIMARY KEY(id);
ALTER TABLE week ADD CONSTRAINT PK_week PRIMARY KEY(id);
ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY(id);

ALTER TABLE teaches ADD CONSTRAINT  FK_teaches_staff FOREIGN KEY(staff) REFERENCES staff(id);
ALTER TABLE attends ADD CONSTRAINT  FK_student_attends FOREIGN KEY(student) REFERENCES student(id);
ALTER TABLE event ADD CONSTRAINT FK_id_event FOREIGN KEY(room) REFERENCES room(id);
ALTER TABLE attends ADD CONSTRAINT  FK_event_attends FOREIGN KEY(event) REFERENCES event(id);
ALTER TABLE teaches ADD CONSTRAINT  FK_event_teaches FOREIGN KEY(event) REFERENCES event(id);
ALTER TABLE occurs ADD CONSTRAINT  FK_event_occurs FOREIGN KEY(event) REFERENCES event(id);
ALTER TABLE event ADD CONSTRAINT  FK_modle_event FOREIGN KEY(modle) REFERENCES modle(id);
ALTER TABLE occurs ADD CONSTRAINT  FK_week_occurs FOREIGN KEY(week) REFERENCES week(id);


---PoblandoOK

INSERT INTO staff VALUES('co.ACg', 'Cumming, Andrew');
INSERT INTO staff VALUES('co.ACr', 'Crerar, Dr');
INSERT INTO staff VALUES('co.AFA', 'Armitage, Dr');
INSERT INTO staff VALUES('co.AG', 'Groat, Anne');
INSERT INTO staff VALUES('co.AL', 'Lawson, Alistair');
INSERT INTO staff VALUES('co.AMn', 'Maclean, Aileen');
INSERT INTO staff VALUES('co.ASc', 'Scott, Andrea');
INSERT INTO staff VALUES('co.ASr', 'Soutar, Alastair');
INSERT INTO staff VALUES('co.AV', 'Varey, Alison');
INSERT INTO staff VALUES('co.BB', 'Buchanan, Dr');
INSERT INTO staff VALUES('co.BC', 'Cowan, Bruce');
INSERT INTO staff VALUES('co.BD', 'Dupee, Dr');
INSERT INTO staff VALUES('co.BDR', 'Ritchie, Bryden');
INSERT INTO staff VALUES('co.BP', 'Paechter, Ben');
INSERT INTO staff VALUES('co.CAD', 'Clem Douglas');
INSERT INTO staff VALUES('co.CAR', 'Rickard, Anne');
INSERT INTO staff VALUES('co.CG', 'Gregory, Chris');
INSERT INTO staff VALUES('co.CHd', 'Hand, Chris');
INSERT INTO staff VALUES('co.CHt', 'Hastie, Colin');
INSERT INTO staff VALUES('co.CM', 'Macaulay, Catriona');
INSERT INTO staff VALUES('co.CMD', 'Dougal, Colin');
INSERT INTO staff VALUES('co.DB', 'Benyon, Prof');
INSERT INTO staff VALUES('co.ED', 'Davenport, Lissie');
INSERT INTO staff VALUES('co.EH', 'Hart, Emma');
INSERT INTO staff VALUES('co.FG', 'Greig, Frank');
INSERT INTO staff VALUES('co.GM', 'McCarra, Greg');
INSERT INTO staff VALUES('co.GR', 'Russell, Dr');
INSERT INTO staff VALUES('co.GS', 'Scott, Graham');
INSERT INTO staff VALUES('co.HH', 'Hall, Hazel');
INSERT INTO staff VALUES('co.IM', 'McGregor, Iain');
INSERT INTO staff VALUES('co.IS', 'Smith, Ian');
INSERT INTO staff VALUES('co.JB', 'Jyoti Bhardwaj');
INSERT INTO staff VALUES('co.JJ', 'Jackson, Jim');
INSERT INTO staff VALUES('co.JKg', 'Kerridge, Prof');
INSERT INTO staff VALUES('co.JKy', 'Kennedy, Jessie');
INSERT INTO staff VALUES('co.JMc', 'McGowan, Joyce');
INSERT INTO staff VALUES('co.JMy', 'Murray, Jim');
INSERT INTO staff VALUES('co.JMz', 'Munoz, Dr');
INSERT INTO staff VALUES('co.JO', 'Owens, Dr');
INSERT INTO staff VALUES('co.JSv', 'Savage, Dr');
INSERT INTO staff VALUES('co.KB', 'Barclay, Ken');
INSERT INTO staff VALUES('co.KC', 'Chisholm, Ken');
INSERT INTO staff VALUES('co.KH', 'Horton, Keith');
INSERT INTO staff VALUES('co.LM', 'Morss, Dr');
INSERT INTO staff VALUES('co.LS', 'Shearey, Lyn');
INSERT INTO staff VALUES('co.MR', 'Rutter, Malcolm');
INSERT INTO staff VALUES('co.MS', 'Smyth, Michael');
INSERT INTO staff VALUES('co.PTh', 'Thompson, Peter');
INSERT INTO staff VALUES('co.PTr', 'Turner, Phil');
INSERT INTO staff VALUES('co.RB', 'Bain, Dr');

INSERT INTO room VALUES ('co.117','117',20,'co.117+118');
INSERT INTO room VALUES ('co.117+118','118',40,NULL);
INSERT INTO room VALUES ('co.B7','B7',60,NULL);
INSERT INTO room VALUES ('co.G74','G74',120,NULL);
INSERT INTO room VALUES ('co.G75+G76','G75+G76',40,NULL);
INSERT INTO room VALUES ('co.G78+G82','G78+G82',100,NULL);
INSERT INTO room VALUES ('co.G82','G82',50,NULL);
INSERT INTO room VALUES ('co.LB42','LB42',36,'co.LB42+LB46');
INSERT INTO room VALUES ('co.LB42+LB46','LB42+LB46',76,NULL);
INSERT INTO room VALUES ('co.LB46','LB46',40,NULL);
INSERT INTO room VALUES ('co.LB47','LB47',40,NULL);
INSERT INTO room VALUES ('cr.131','131',40,NULL);
INSERT INTO room VALUES ('cr.132','132',60,NULL);
INSERT INTO room VALUES ('cr.201','201',20,NULL);
INSERT INTO room VALUES ('cr.202','202',30,NULL);
INSERT INTO room VALUES ('cr.203','203',40,NULL);
INSERT INTO room VALUES ('cr.204','204',40,NULL);
INSERT INTO room VALUES ('cr.B1','B1',125,NULL);
INSERT INTO room VALUES ('cr.B10','B10',40,NULL);
INSERT INTO room VALUES ('cr.B11','B11',40,NULL);
INSERT INTO room VALUES ('cr.B12','B12',40,NULL);
INSERT INTO room VALUES ('cr.B13','B13',40,NULL);
INSERT INTO room VALUES ('cr.B2','B2',60,NULL);
INSERT INTO room VALUES ('cr.B8','B8',40,NULL);
INSERT INTO room VALUES ('cr.B9','B9',20,NULL);
INSERT INTO room VALUES ('cr.G116','G116',60,NULL);
INSERT INTO room VALUES ('cr.G2','G2',20,NULL);
INSERT INTO room VALUES ('cr.G3','G3',20,NULL);
INSERT INTO room VALUES ('cr.G6','G6',30,NULL);
INSERT INTO room VALUES ('cr.G80','G80',40,NULL);
INSERT INTO room VALUES ('cr.G90','G90',30,'cr.G90+116');
INSERT INTO room VALUES ('cr.G90+116','G90+116',60,NULL);
INSERT INTO room VALUES ('cr.SMH','St Margaret Hall',240,NULL);

INSERT INTO student VALUES ('co.12008.Ea','WP and SS Elective',50,NULL);
INSERT INTO student VALUES ('co.12008.Eb','WP and SS Elective',50,NULL);
INSERT INTO student VALUES ('co.12012.E','UEC Elective',32,NULL);
INSERT INTO student VALUES ('co.22022.E','C++ Elective',40,NULL);
INSERT INTO student VALUES ('co1.BAe','BAe',15,NULL);
INSERT INTO student VALUES ('co1.CO','Computing 1st Year',150,NULL);
INSERT INTO student VALUES ('co1.CO.a','Computing 1st Year a',20,'co1.CO');
INSERT INTO student VALUES ('co1.CO.c','Computing 1st Year c',20,'co1.CO');
INSERT INTO student VALUES ('co1.CO.d','Computing 1st Year d',20,'co1.CO');
INSERT INTO student VALUES ('co1.CO.e','Computing 1st Year e',20,'co1.CO');
INSERT INTO student VALUES ('co1.CO.f','Computing 1st Year f',20,'co1.CO');
INSERT INTO student VALUES ('co1.CO.h','Computing 1st Year h',20,'co1.CO');
INSERT INTO student VALUES ('co1.CO.i','Computing 1st Year i',20,'co1.CO');
INSERT INTO student VALUES ('co1.CO.j','Computing 1st Year j',20,'co1.CO');
INSERT INTO student VALUES ('co1.IS','BSc Information Systems 1st Year',40,NULL);
INSERT INTO student VALUES ('co1.IS.a','BSc Information Systems 1st Year a',20,'co1.IS');
INSERT INTO student VALUES ('co1.IS.b','BSc Information Systems 1st Year b',20,'co1.IS');
INSERT INTO student VALUES ('co1.SE.pt','Software Engineering p/t 1',2,NULL);
INSERT INTO student VALUES ('co2.CO','Computing 2nd Year',100,NULL);
INSERT INTO student VALUES ('co2.CO.a','Computing 2nd Year a',20,'co2.CO');
INSERT INTO student VALUES ('co2.CO.b','Computing 2nd Year b',20,'co2.CO');
INSERT INTO student VALUES ('co2.CO.c','Computing 2nd Year c',20,'co2.CO');
INSERT INTO student VALUES ('co2.CO.d','Computing 2nd Year d',20,'co2.CO');
INSERT INTO student VALUES ('co2.CO.e','Computing 2nd Year e',20,'co2.CO');
INSERT INTO student VALUES ('co2.CO.i','Computing 2nd Year Bridging',20,NULL);
INSERT INTO student VALUES ('co2.CO.j','Computing 2nd Year Bridging',20,NULL);
INSERT INTO student VALUES ('co2.CO.k','Computing 2nd Year Bridging',20,NULL);
INSERT INTO student VALUES ('co2.IS','Information Systems 2nd Year',20,NULL);
INSERT INTO student VALUES ('co2.NT.Ea','NT Elective',20,NULL);
INSERT INTO student VALUES ('co2.NT.Eb','NT Elective',20,NULL);
INSERT INTO student VALUES ('co2.NT.Ec','NT Elective',20,NULL);
INSERT INTO student VALUES ('co2.NT.Ed','NT Elective',20,NULL);
INSERT INTO student VALUES ('co2.NT.Ee','NT Elective',20,NULL);
INSERT INTO student VALUES ('co2.SE.pt','Software Engineering p/t 2',10,NULL);
INSERT INTO student VALUES ('co3.CO','BEng3 SoC year 3 (non SWE)',2,NULL);
INSERT INTO student VALUES ('co3.DMM','DEBS 3 Multimedia',15,NULL);
INSERT INTO student VALUES ('co3.DNC','DEBS Network Computing Year 3',27,NULL);
INSERT INTO student VALUES ('co3.DST','DEBS 3 Software Technology',4,NULL);
INSERT INTO student VALUES ('co3.IS','BSc3 Information Systems',0,NULL);
INSERT INTO student VALUES ('co3.MM','BEng3 Multimedia (non SWE)',20,NULL);
INSERT INTO student VALUES ('co3.ND','BEng3 Network and DS (non SWE)',15,NULL);
INSERT INTO student VALUES ('co3.SE','BEng3 Software Engineering (non SWE)',35,NULL);
INSERT INTO student VALUES ('co3.SE.pt','BEng3 Software Engineering p/t',5,NULL);
INSERT INTO student VALUES ('co4.CO','BSc4 Computing',25,NULL);
INSERT INTO student VALUES ('co4.DNC','DEBS 4 Network Computing',5,NULL);
INSERT INTO student VALUES ('co4.IS','BSc4 Information Systems',5,NULL);
INSERT INTO student VALUES ('co4.MM','BEng4 Multimedia Systems',22,NULL);
INSERT INTO student VALUES ('co4.ND','BEng4 Network and Distributing Systems',5,NULL);
INSERT INTO student VALUES ('co4.SE','BEng4 Software Engineering',30,NULL);
INSERT INTO student VALUES ('co4.SE.pt','BEng4 Software Engineering p/t',5,NULL);

INSERT INTO week VALUES ('01','2018-10-01');
INSERT INTO week VALUES ('02','2018-10-08');
INSERT INTO week VALUES ('03','2018-10-15');
INSERT INTO week VALUES ('04','2018-10-22');
INSERT INTO week VALUES ('05','2018-10-29');
INSERT INTO week VALUES ('06','2018-11-05');
INSERT INTO week VALUES ('07','2018-11-12');
INSERT INTO week VALUES ('08','2018-11-19');
INSERT INTO week VALUES ('09','2018-11-26');
INSERT INTO week VALUES ('10','2018-12-03');
INSERT INTO week VALUES ('11','2018-12-10');
INSERT INTO week VALUES ('12','2018-12-17');
INSERT INTO week VALUES ('13','2019-01-07');
INSERT INTO week VALUES ('14','2019-01-14');
INSERT INTO week VALUES ('15','2019-01-21');

INSERT INTO modle VALUES ('co12001','Rapid Application Development');
INSERT INTO modle VALUES ('co12002','Software Development 1A');
INSERT INTO modle VALUES ('co12003','Professional Skills');
INSERT INTO modle VALUES ('co12004','Applications Workshop');
INSERT INTO modle VALUES ('co12005','Software Development 1B');
INSERT INTO modle VALUES ('co12006','Computer Systems');
INSERT INTO modle VALUES ('co12008','Word Processing and Spreadsheets Elective');
INSERT INTO modle VALUES ('co12009','Information Systems 1a');
INSERT INTO modle VALUES ('co12010','Software Development C');
INSERT INTO modle VALUES ('co12011','Software Development in C');
INSERT INTO modle VALUES ('co12012','Using Electronic Communication Effectively');
INSERT INTO modle VALUES ('co12021','Using Electronic Communication Effectively');
INSERT INTO modle VALUES ('co2.cs22006',NULL);
INSERT INTO modle VALUES ('co22001','Database Systems');
INSERT INTO modle VALUES ('co22002','Software Development');
INSERT INTO modle VALUES ('co22003','Computer Systems');
INSERT INTO modle VALUES ('co22004','Software Engineering');
INSERT INTO modle VALUES ('co22005','Human Computer Interaction');
INSERT INTO modle VALUES ('co22006','Algorithms and Data Structures');
INSERT INTO modle VALUES ('co22007','Web Development');
INSERT INTO modle VALUES ('co22008','Introduction to Databases');
INSERT INTO modle VALUES ('co22009','Software Development (Bridging)');
INSERT INTO modle VALUES ('co22020','Window NT Elective');
INSERT INTO modle VALUES ('co22022','Programming C++');
INSERT INTO modle VALUES ('co32001','Very Large Databases');
INSERT INTO modle VALUES ('co32002','Customer Centred Design');
INSERT INTO modle VALUES ('co32003','Multimedia Technology');
INSERT INTO modle VALUES ('co32004','Multimedia Development Methods');
INSERT INTO modle VALUES ('co32005','Multimedia Systems Design');
INSERT INTO modle VALUES ('co32006','Computer Networks and Distributed Systems');
INSERT INTO modle VALUES ('co32007','Design Patterns');
INSERT INTO modle VALUES ('co32008','Computer Interfacing');
INSERT INTO modle VALUES ('co32010','Network Operating Systems');
INSERT INTO modle VALUES ('co32011','Visual Components and Systems Integration');
INSERT INTO modle VALUES ('co32013','Embedded Systems');
INSERT INTO modle VALUES ('co32014','Computers and Innovation Process');
INSERT INTO modle VALUES ('co32015','Frameworks');
INSERT INTO modle VALUES ('co32016','Group Project');
INSERT INTO modle VALUES ('co32017','Internet Programming');
INSERT INTO modle VALUES ('co32018','Internet Programming 3');
INSERT INTO modle VALUES ('co32020','Professional Studies');
INSERT INTO modle VALUES ('co32021','Group Project');
INSERT INTO modle VALUES ('co32023','Systems Engineering 3');
INSERT INTO modle VALUES ('co32993','Human Computer Interaction 3');
INSERT INTO modle VALUES ('co32M19','Management of Industrial Organisations');
INSERT INTO modle VALUES ('co32XX5','Systems Engineering 3');
INSERT INTO modle VALUES ('co42001','Virtual Environments');
INSERT INTO modle VALUES ('co42002','Multimedia Technology');
INSERT INTO modle VALUES ('co42004','Media Computing');
INSERT INTO modle VALUES ('co42005','Computer Supported Cooperative Working');

INSERT INTO teaches VALUES ('co.ACg','co12005.T01');
INSERT INTO teaches VALUES ('co.ACg','co42010.L01');
INSERT INTO teaches VALUES ('co.ACg','co42010.T01');
INSERT INTO teaches VALUES ('co.ACg','co42010.T02');
INSERT INTO teaches VALUES ('co.ACg','co72013.L01');
INSERT INTO teaches VALUES ('co.ACg','co72013.L02');
INSERT INTO teaches VALUES ('co.ACg','co72013.T03');
INSERT INTO teaches VALUES ('co.ACg','co72013.T04');
INSERT INTO teaches VALUES ('co.ACg','co72013.T05');
INSERT INTO teaches VALUES ('co.ACg','co72023.T02');
INSERT INTO teaches VALUES ('co.ACr','co72033.L01');
INSERT INTO teaches VALUES ('co.ACr','co72033.T01');
INSERT INTO teaches VALUES ('co.AFA','co22020.L01');
INSERT INTO teaches VALUES ('co.AFA','co22020.T04');
INSERT INTO teaches VALUES ('co.AFA','co22020.T05');
INSERT INTO teaches VALUES ('co.AL','co32011.L01');
INSERT INTO teaches VALUES ('co.AL','co32011.T01');
INSERT INTO teaches VALUES ('co.AL','co32011.T02');
INSERT INTO teaches VALUES ('co.AL','co32011.T03');
INSERT INTO teaches VALUES ('co.AL','co42019.L01');
INSERT INTO teaches VALUES ('co.AMn','co12004.L01');
INSERT INTO teaches VALUES ('co.AMn','co12004.T05');
INSERT INTO teaches VALUES ('co.ASc','co42015.L01');
INSERT INTO teaches VALUES ('co.ASc','co42015.T01');
INSERT INTO teaches VALUES ('co.ASr','co12006.L01');
INSERT INTO teaches VALUES ('co.ASr','co12006.L02');
INSERT INTO teaches VALUES ('co.ASr','co12006.L03');
INSERT INTO teaches VALUES ('co.ASr','co12006.T02');
INSERT INTO teaches VALUES ('co.ASr','co12006.T04');
INSERT INTO teaches VALUES ('co.ASr','co12006.T05');
INSERT INTO teaches VALUES ('co.ASr','coh8412585.L01');
INSERT INTO teaches VALUES ('co.ASr','coh8412585.T01');
INSERT INTO teaches VALUES ('co.ASr','coh8412585.T02');
INSERT INTO teaches VALUES ('co.ASr','coh8412585.T03');
INSERT INTO teaches VALUES ('co.ASr','coh8412615.L01');
INSERT INTO teaches VALUES ('co.ASr','coh8412615.T01');
INSERT INTO teaches VALUES ('co.ASr','coh8412615.T02');
INSERT INTO teaches VALUES ('co.ASr','coh8412615.T03');
INSERT INTO teaches VALUES ('co.ASr','coh8412615.T04');
INSERT INTO teaches VALUES ('co.ASr','coh8412615.T05');
INSERT INTO teaches VALUES ('co.ASr','coh8412615.T06');
INSERT INTO teaches VALUES ('co.ASr','coh8521005.L01');
INSERT INTO teaches VALUES ('co.ASr','coh8521005.T01');
INSERT INTO teaches VALUES ('co.ASr','coh8521005.T02');
INSERT INTO teaches VALUES ('co.AV','co32021.L01');
INSERT INTO teaches VALUES ('co.BC','co32023.L01');
INSERT INTO teaches VALUES ('co.BC','co32023.T01');
INSERT INTO teaches VALUES ('co.BC','co72003.L01');
INSERT INTO teaches VALUES ('co.BC','co72003.T01');
INSERT INTO teaches VALUES ('co.CHt','co12005.T03');

INSERT INTO attends VALUES ('co.12008.Ea','co12008.L01');
INSERT INTO attends VALUES ('co.12008.Ea','co12008.T01');
INSERT INTO attends VALUES ('co.12008.Eb','co12008.L01');
INSERT INTO attends VALUES ('co.12008.Eb','co12008.T02');
INSERT INTO attends VALUES ('co.12012.E','co12012.L01');
INSERT INTO attends VALUES ('co.12012.E','co12012.T01');
INSERT INTO attends VALUES ('co.22022.E','co22022.L01');
INSERT INTO attends VALUES ('co.22022.E','co22022.T01');
INSERT INTO attends VALUES ('co1.BAe','co12004.L01');
INSERT INTO attends VALUES ('co1.BAe','co12004.T05');
INSERT INTO attends VALUES ('co1.BAe','co12006.L02');
INSERT INTO attends VALUES ('co1.BAe','co12006.T04');
INSERT INTO attends VALUES ('co1.BAe','co12011.L01');
INSERT INTO attends VALUES ('co1.BAe','co12011.T01');
INSERT INTO attends VALUES ('co1.CO','co12004.L01');
INSERT INTO attends VALUES ('co1.CO','co12005.L01');
INSERT INTO attends VALUES ('co1.CO','co12005.L02');
INSERT INTO attends VALUES ('co1.CO','co12006.L01');
INSERT INTO attends VALUES ('co1.CO','co12006.L03');
INSERT INTO attends VALUES ('co1.CO.a','co12004.T01');
INSERT INTO attends VALUES ('co1.CO.a','co12005.T01');
INSERT INTO attends VALUES ('co1.CO.a','co12006.T01');
INSERT INTO attends VALUES ('co1.CO.c','co12004.T01');
INSERT INTO attends VALUES ('co1.CO.c','co12005.T01');
INSERT INTO attends VALUES ('co1.CO.c','co12006.T01');
INSERT INTO attends VALUES ('co1.CO.d','co12004.T02');
INSERT INTO attends VALUES ('co1.CO.d','co12005.T02');
INSERT INTO attends VALUES ('co1.CO.d','co12006.T02');
INSERT INTO attends VALUES ('co1.CO.e','co12004.T02');
INSERT INTO attends VALUES ('co1.CO.e','co12005.T02');
INSERT INTO attends VALUES ('co1.CO.e','co12006.T02');
INSERT INTO attends VALUES ('co1.CO.f','co12004.T06');
INSERT INTO attends VALUES ('co1.CO.f','co12005.T03');
INSERT INTO attends VALUES ('co1.CO.f','co12006.T03');
INSERT INTO attends VALUES ('co1.CO.h','co12004.T06');
INSERT INTO attends VALUES ('co1.CO.h','co12005.T03');
INSERT INTO attends VALUES ('co1.CO.h','co12006.T03');
INSERT INTO attends VALUES ('co1.CO.i','co12004.T03');
INSERT INTO attends VALUES ('co1.CO.i','co12005.T04');
INSERT INTO attends VALUES ('co1.CO.i','co12006.T04');
INSERT INTO attends VALUES ('co1.CO.j','co12004.T03');
INSERT INTO attends VALUES ('co1.CO.j','co12005.T04');
INSERT INTO attends VALUES ('co1.CO.j','co12006.T04');
INSERT INTO attends VALUES ('co1.IS','co12004.L01');
INSERT INTO attends VALUES ('co1.IS.a','co12004.T04');
INSERT INTO attends VALUES ('co1.IS.b','co12004.T04');
INSERT INTO attends VALUES ('co1.SE.pt','co12004.L02');
INSERT INTO attends VALUES ('co1.SE.pt','co12004.T01');
INSERT INTO attends VALUES ('co1.SE.pt','co12005.L01');
INSERT INTO attends VALUES ('co1.SE.pt','co12005.T05');

INSERT INTO event VALUES ('co12004.L01','co12004','L','Wednesday','11:00',1,'cr.SMH');
INSERT INTO event VALUES ('co12004.L02','co12004','L','Monday','17:00',1,'cr.B13');
INSERT INTO event VALUES ('co12004.T01','co12004','T','Monday','11:00',2,'co.G78+G82');
INSERT INTO event VALUES ('co12004.T02','co12004','T','Tuesday','15:00',2,'co.B7');
INSERT INTO event VALUES ('co12004.T03','co12004','T','Tuesday','13:00',2,'co.G78+G82');
INSERT INTO event VALUES ('co12004.T04','co12004','T','Wednesday','13:00',2,'co.LB42+LB46');
INSERT INTO event VALUES ('co12004.T05','co12004','T','Wednesday','09:00',2,'co.117+118');
INSERT INTO event VALUES ('co12004.T06','co12004','T','Tuesday','13:00',2,'co.LB47');
INSERT INTO event VALUES ('co12005.L01','co12005','L','Monday','14:00',1,'cr.SMH');
INSERT INTO event VALUES ('co12005.L02','co12005','L','Friday','10:00',1,'cr.SMH');
INSERT INTO event VALUES ('co12005.T01','co12005','T','Tuesday','11:00',2,'co.G78+G82');
INSERT INTO event VALUES ('co12005.T02','co12005','T','Monday','11:00',2,'cr.G90+116');
INSERT INTO event VALUES ('co12005.T03','co12005','T','Tuesday','10:00',2,'co.LB47');
INSERT INTO event VALUES ('co12005.T04','co12005','T','Wednesday','14:00',2,'co.B7');
INSERT INTO event VALUES ('co12005.T05','co12005','T','Monday','15:00',2,'co.117+118');
INSERT INTO event VALUES ('co12006.L01','co12006','L','Wednesday','10:00',1,'cr.SMH');
INSERT INTO event VALUES ('co12006.L02','co12006','L','Thursday','09:00',2,'cr.G6');
INSERT INTO event VALUES ('co12006.L03','co12006','L','Wednesday','13:00',1,'cr.SMH');
INSERT INTO event VALUES ('co12006.T01','co12006','T','Tuesday','14:00',2,'co.LB42+LB46');
INSERT INTO event VALUES ('co12006.T02','co12006','T','Thursday','13:00',2,'co.G82');
INSERT INTO event VALUES ('co12006.T03','co12006','T','Monday','15:00',2,'co.LB47');
INSERT INTO event VALUES ('co12006.T04','co12006','T','Monday','11:00',2,'co.LB42+LB46');
INSERT INTO event VALUES ('co12006.T05','co12006','T','Monday','09:00',2,'co.117+118');
INSERT INTO event VALUES ('co12006.T06','co12006','T','Thursday','14:00',2,'co.117+118');
INSERT INTO event VALUES ('co12008.L01','co12008','L','Tuesday','11:00',2,'co.G74');
INSERT INTO event VALUES ('co12008.T01','co12008','T','Monday','13:00',2,'cr.G90+116');
INSERT INTO event VALUES ('co12008.T02','co12008','T','Friday','14:00',2,'cr.G90+116');
INSERT INTO event VALUES ('co12011.L01','co12011','L','Monday','09:00',2,'cr.G3');
INSERT INTO event VALUES ('co12011.T01','co12011','T','Thursday','13:00',2,'co.LB47');
INSERT INTO event VALUES ('co12012.L01','co12012','L','Wednesday','12:00',1,'cr.B10');
INSERT INTO event VALUES ('co12012.T01','co12012','T','Wednesday','13:00',2,'co.G75+G76');
INSERT INTO event VALUES ('co22005.L01','co22005','L','Thursday','12:00',2,'cr.SMH');
INSERT INTO event VALUES ('co22005.T01','co22005','T','Thursday','14:00',1,'cr.G116');
INSERT INTO event VALUES ('co22005.T02','co22005','T','Wednesday','13:00',1,'co.B7');
INSERT INTO event VALUES ('co22005.T03','co22005','T','Wednesday','11:00',1,'co.G78+G82');
INSERT INTO event VALUES ('co22005.T04','co22005','T','Tuesday','09:00',1,'co.LB42+LB46');
INSERT INTO event VALUES ('co22005.T05','co22005','T','Friday','09:00',1,'cr.B8');
INSERT INTO event VALUES ('co22005.T06','co22005','T','Wednesday','11:00',1,'cr.B8');
INSERT INTO event VALUES ('co22005.T07','co22005','T','Wednesday','14:00',1,'cr.B2');
INSERT INTO event VALUES ('co22005.T08','co22005','T','Tuesday','11:00',1,'cr.B2');
INSERT INTO event VALUES ('co22005.T09','co22005','T','Thursday','16:00',1,'co.G78+G82');
INSERT INTO event VALUES ('co22005.T10','co22005','T','Friday','10:00',1,'cr.B13');
INSERT INTO event VALUES ('co22006.L01','co22006','L','Friday','15:00',2,'cr.B1');
INSERT INTO event VALUES ('co22006.L02','co22006','L','Thursday','10:00',1,'cr.G2');
INSERT INTO event VALUES ('co22006.L03','co22006','L','Thursday','15:00',1,'cr.G3');
INSERT INTO event VALUES ('co22006.T01','co22006','T','Monday','13:00',2,'co.LB47');
INSERT INTO event VALUES ('co22006.T02','co22006','T','Monday','15:00',2,'co.LB46');
INSERT INTO event VALUES ('co22006.T03','co22006','T','Monday','15:00',2,'cr.G90+116');
INSERT INTO event VALUES ('co22006.T04','co22006','T','Wednesday','15:00',2,'co.G78+G82');
INSERT INTO event VALUES ('co22007.L01','co22007','L','Monday','09:00',2,'cr.SMH');


---PoblandoNoOK

INSERT INTO staff VALUES(27, 'Cumming, Andrew');
INSERT INTO staff VALUES('co.ACr', 12.5);

INSERT INTO room VALUES (NULL,'117',20,'co.117+118');
INSERT INTO room VALUES ('co.117+118',20,40,NULL);
INSERT INTO room VALUES ('co.B7','B7',600000000000000,NULL);
INSERT INTO room VALUES ('co.G74','G74',120,20);

INSERT INTO student VALUES ('co.12008.Ea jsjausodaásjspaosdasdjop','WP and SS Elective',50,NULL);
INSERT INTO student VALUES ('co.12008.Eb','2018-09-20',50,NULL);
INSERT INTO student VALUES ('co.12012.E','UEC Elective',320000000000000000,NULL);
INSERT INTO student VALUES ('co.22022.E','C++ Elective',40,100);

INSERT INTO week VALUES ('010','2018-10-01');
INSERT INTO week VALUES ('02','DINOSUARIO');

INSERT INTO modle VALUES (20,'Rapid Application Development');
INSERT INTO modle VALUES ('co12002',2.1);

INSERT INTO teaches VALUES ('co.ACg oiashiodhansjdb asjdbasodiasd','co12005.T01');
INSERT INTO teaches VALUES ('co.ACg',12);

INSERT INTO attends VALUES ('co.12008.Ea','co12008.L01');
INSERT INTO attends VALUES ('co.12008.Ea','2018-08-24');

INSERT INTO event VALUES (NULL,'co12004','L','Wednesday','11:00',1,'cr.SMH');
INSERT INTO event VALUES ('co12004.L02',20,'L','Monday','17:00',1,'cr.B13');
INSERT INTO event VALUES ('co12004.T01','co12004','29','Monday','11:00',2,'co.G78+G82');
INSERT INTO event VALUES ('co12004.T02','co12004','T','Tuesday 0ASDOIJASDOAAA','15:00',2,'co.B7');
INSERT INTO event VALUES ('co12004.T03','co12004','T','Tuesday','nani!!!',2,'co.G78+G82');
INSERT INTO event VALUES ('co12004.T04','co12004','T','Wednesday','13:00', 'batman :3','co.LB42+LB46');
INSERT INTO event VALUES ('co12004.T05','co12004','T','Wednesday','09:00',2,50);


---Consultas

SELECT room
FROM event
WHERE id = 'co4210.L01';

SELECT dow, tod, room
FROM event 
WHERE modle = 'co72010';

SELECT teaches.event, COUNT(teaches.staff)
FROM event, teaches
WHERE modle = 'co72010' AND teaches.event = event.id
GROUP BY teaches.event;

SELECT staff.name, event.modle
FROM event, teaches, staff
WHERE event.room = 'cr.132' AND event.id = teaches.event AND teaches.staff = staff.id AND event.dow = 'Wednesday';

SELECT DISTINCT student.name AS student
FROM event, modle, attends, student
WHERE modle.name LIKE '%Database%' AND modle.id = event.modle AND attends.event = event.id AND attends.student = student.id;

SELECT SUM(student.sze)
FROM event, student, attends
WHERE modle = 'co72010' AND event.id = attends.event AND attends.student = student.id;

SELECT COUNT(DISTINCT teaches.staff), modle.name
FROM modle, event, teaches
WHERE modle.id LIKE 'co7%' AND modle.id = event.modle AND event.id = teaches.event
GROUP BY modle.name;

SELECT DISTINCT modle.name
FROM occurs, event, modle
WHERE occurs.event = event.id AND modle.id = event.modle AND occurs.week < '10';

SELECT id
FROM event
WHERE tod = '14:00' AND modle != 'co72010';

SELECT DISTINCT staff.name
FROM event, teaches, staff
WHERE event.id = teaches.event AND teaches.staff = staff.id AND 1.5288 < event.tod;

---Estan en comentarios, ya que nos generaba error
---SELECT event.id
---FROM (SELECT DISTINCT event.dow AS dow, event.tod AS tod FROM event, teaches 
---WHERE teaches.staff = 'co.ACg' AND event.id = teaches.event) AS Recibir, teaches, event
--WHERE teaches.staff = 'co.CHt' AND event.id = teaches.event AND Recibir.dow = event.dow AND Recibir.tod = event.tod;

---SELECT DISTINCT Salas.num/Eventos.Total AS Tasa
---FROM(SELECT COUNT(Eventos.id) AS Total FROM event AS Eventos) AS Eventos,(SELECT COUNT(Salas.id)
---AS num, Salas.room AS hab FROM event AS Salas GROUP BY Salas.room) AS Slas, room, event
---WHERE room.id = event.room AND room.capacity > 60;

SELECT dow, tod
FROM event
WHERE id = 'co72002.L01';

SELECT dow, tod, room
FROM event
WHERE modle = 'co72003';

SELECT teaches.event
FROM teaches, staff
WHERE staff.name = 'Chisholm, ken' AND staff.id = teaches.staff;

SELECT DISTINCT staff.name
FROM teaches, staff, event
WHERE event.room = 'cr.SMH' AND event.id = teaches.event AND teaches.staff = stadd.id;

SELECT SUM(event.duration)
FROM teaches, staff, event
WHERE student.id = 'com.IS.a' AND attends.student = student.id AND attends.event = event.id;


---XPoblar
DROP TABLE staff cascade constraints;
DROP TABLE student cascade constraints;
DROP TABLE room cascade constraints;
DROP TABLE event cascade constraints;
DROP TABLE attends cascade constraints;
DROP TABLE teaches cascade constraints;
DROP TABLE occurs cascade constraints;
DROP TABLE modle cascade constraints;
DROP TABLE week cascade constraints;


---XTablas
DELETE staff;
DELETE student;
DELETE room;
DELETE event;
DELETE attends;
DELETE teaches;
DELETE occurs;
DELETE modle;
DELETE week;