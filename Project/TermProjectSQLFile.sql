CREATE TABLE corporate (
	SSN int NOT NULL,
	DateHired date,
	DateReleased date,
	SID int NOT NULL,
  PRIMARY KEY(SSN),
  FOREIGN KEY(SID) references staff(SID)
);

CREATE TABLE staff (
	SID int NOT NULL,
	DateHired date,
	DataReleased date,
	Salary int NOT NULL,
  PRIMARY KEY(SID)
);

CREATE TABLE people (
	PID int NOT NULL,
	Firstname text,
	Lastname text,
	DateofBirth date,
	StreetAddress text,
	SID int NOT NULL,
  PRIMARY KEY(PID),
  FOREIGN KEY(SID) references staff(SID)
);

CREATE TABLE customerVisits (
	cid int NOT NULL,
	WaitTime time NOT NULL,
	oid int NOT NULL,
PRIMARY KEY(cid),
FOREIGN KEY(oid) references order(oid)
);

CREATE TABLE delivery (
	DID int NOT NULL,
	CarName text,
	SID int NOT NULL,
  PRIMARY KEY(CID),	
  FOREIGN KEY(SID) references staff(SID)  
);


CREATE TABLE frontofHouse (
	FID int NOT NULL,
	ServingSection int NOT NULL,
	SID int NOT NULL,
  PRIMARY KEY(FID),
  FOREIGN KEY(SID) references staff(SID)
);



CREATE TABLE backofHouse (
	LID int NOT NULL,
	LineArea text NOT NULL,
	SID int NOT NULL,
	IID int NOT NULL,
  PRIMARY KEY(LID),
  FOREIGN KEY(SID) references staff(SID),
  FOREIGN KEY(IID) references stock(IID)
);

CREATE TABLE management (
	MID int NOT NULL,
	section text,
	SID int NOT NULL,
  PRIMARY KEY(MID),
  FOREIGN KEY(SID) references staff(SID)
);


CREATE TABLE order (
	OID int NOT NULL,
	TotalSpent float(6,2),
  PRIMARY KEY(OID)
);


--SQL coporate Insert Statements--
Select *
From corporate;

INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('480466669', '2013-01-12', '', '1');

INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('501145494', '2014-11-30', '', '2');

INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('544900941', '2014-12-08', '', '3');
		
INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('449825815', '2015-01-13', '', '4');
	
INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('530719531', '2015-10-03', '', '5');
	
INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('127849320', '2015-10-15', '', '6');
	
INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('121309512', '2015-11-03', '', '7');
	
INSERT INTO corporate(SSN, DateHired, DateReleased, SID)
	Values ('901238410', '2016-02-19', '', '8');
	

--SQL staff Insert Statements--
Select *
From staff;

INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('1', '2013-01-12', '', '195000')
	
--SQL Movie Insert Statements--
INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('2', '2014-11-30', '', '127000')

INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('3', '2014-12-08', '', '101000')

INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('4', '2015-01-13', '', '94000')

INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('5', '2015-10-03', '', '142000')

INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('6', '2015-10-15', '', '42000')

INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('7', '2015-11-03', '', '57000')

INSERT INTO staff(SID, DateHired, DateReleased, Salary)
	VALUES ('8', '2016-02-19', '', '30000')


--SQL people Insert Statements--
Select *
From people;
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1001', 'Charles','Hersheberg','1964-11-21','291 Hunting Street','1')

INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1002','Nick','Barnett','1977-12-08','31 Main Street','2')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1003', 'Joe','Shmoe','1968-10-21','38 Brooklyn Blvd','3')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1004', 'Amanda','Mctigue','1979-03-05','932 Fulton Street','4')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1005', 'Sherla','Jermain','1981-12-06','54 Fuller Court','5')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1006', 'Jerald','Bronze','1985-05-16','83 Bear Oak Lane','6')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1007', 'Mason','Shaw','1992-06-18','339 Rock Oak Road','7')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1008', 'Kayla','Marhefka','1987-03-12','1 Hampton Street','8')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1009', 'Brian','Monahan','1990-04-20','301 Eisenhower Lane','9')

INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1010', 'Carla','Sofia','1997-02-01','194 Red Oak Road','10')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1011', 'Vlad','Donavan','1981-01-02','35 Pin Oak Road','11')
	
INSERT INTO people(PID, Firstname, Lastname, DateofBirth, StreetAddress, SID)
	Values('1012', 'Ryan','Neumann','1995-11-30','38 Scarlet Drive','12')


--SQL insert to customerVisits
INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103213', '11:15:32', '101')

INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103214', '11:15:32', '102')
	
INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103215', '11:15:32', '103')

INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103216', '11:15:32', '104')

INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103217', '11:15:32', '105')

INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103218', '11:15:32', '106')

INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103219', '11:15:32', '107')

INSERT INTO customerVisits(CID, WaitTime, OID)
	Values('103220', '11:15:32', '108')


--SQL Delivery Insert Statments--
INSERT INTO delivery(DID, CarName, SID)
	Value('1', 'Nissan', '12')

INSERT INTO delivery(DID, CarName, SID)
	Value('2', 'Chevy', '8')

INSERT INTO delivery(DID, CarName, SID)
	Value('3', 'Chevy', '10')

INSERT INTO delivery(DID, CarName, SID)
	Value('4', 'Chevy', '12')

INSERT INTO delivery(DID, CarName, SID)
	Value('5', 'Nissan', '10')

INSERT INTO delivery(DID, CarName, SID)
	Value('6', 'Nissan', '9')

INSERT INTO delivery(DID, CarName, SID)
	Value('7', 'Nissan', '8')

INSERT INTO delivery(DID, CarName, SID)
	Value('8', 'Chevy', '10')

--SQL FrontofHouse Insert Statements--


INSERT INTO FrontofHouse(FID, ServingSection, SID)
	Values('1', '10', '1')

INSERT INTO FrontofHouse(FID, ServingSection, SID)
	Values('2', '12', '2')

INSERT INTO FrontofHouse(FID, ServingSection, SID)
	Values('3', '15', '3')
	
INSERT INTO FrontofHouse(FID, ServingSection, SID)
	Values('4', '6', '4')



--SQL Management Insert Statements--

INSERT INTO management(MID, section, SID) 
	Values('1', 'Management', '1')
	
INSERT INTO management(MID, section, SID) 
	Values('2', 'Management', '2')
	
INSERT INTO management(MID, section, SID) 
	Values('3', 'Management', '3')
	
INSERT INTO management(MID, section, SID) 
	Values('4', 'Management', '4')

--SQL order Insert Statements--
INSERT INTO order(OID, TotalSpent)
	Value('101', '121.42')
	
INSERT INTO order(OID, TotalSpent)
	Value('102', '75.56')
	
INSERT INTO order(OID, TotalSpent)
	Value('103', '24.98')

INSERT INTO order(OID, TotalSpent)
	Value('104', '309.61')
	
--Views--
CREATE VIEW CurrentOrder AS
	SELECT *
	FROM customerVisits
	INNER JOIN order
	ON customerVisits.oid = order.oid
	ORDER BY oid DESC;
	
CREATE VIEW CorporateSalary AS
	SELECT staff.salary, staff.sid, corporate.sid
	FROM staff
	INNER JOIN corporate
	ON staff.sid = corporate.sid
	ORDER BY sid DESC;
	
--Reports--
SELECT ROUND(avg(WaitTime), 2) AS Avg_Wait_Time_Per_Order
FROM customerVisits;

SELECT ROUND(avg(staff.salary, 2) AS Avg_Salary_Per_Employee
FROM staff st,
	   corporate co
WHERE co.sid = st.sid
ORDER BY Avg_Salary_Per_Employee DESC;

--Stored Procedures--
CREATE OR REPLACE FUNCTION insertNewOrder()
Return trigger as 
$$
	Begin
		IF NEW.cid IS NULL THEN
			RAISE EXCEPTION 'Invalid OrderID provided!'
		END IF;
		IF NEW.WaitTime IS NULL THEN
			RAISE EXCEPTION 'Can only update WaitTime if order exists'
		END IF;
		IF OLD.WaitTime IS NOT NULL THEN 
			RAISE EXCEPTION 'The order has already been received!'
		END IF;
		INSERT INTO InsertNewOrder(cid, WaitTime)
				      VALUES(NEW.cid, '30');
		RETURN NEW;
	End
$$ LANGUAGE plpgsql;  


CREATE OR REPLACE FUNCTION employeeReleased()
RETURN trigger AS
$$
	BEGIN
		IF NEW.sid is NULL THEN
			RAISE EXCEPTION 'Invalid StaffID provided!'
		END IF;
		IF NEW.DateReleased IS NULL THEN 
			RAISE EXCEPTION 'Can only update DateReleased on Staff table'
		END IF;
		IF OLD.DateReleased IS NOT NULL THEN 
			RAISE EXCEPTION 'Employee already released.'
		END IF;
		INSERT INTO employeeReleased (sid, DateReleased)
							Values(NEW.sid, Date);
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


--Triggers--
CREATE TRIGGER newOrder
AFTER UPDATE ON order
	FOR EACH ROW EXECUTE PROCEDURE insertNewOrder();
	
CREATE TRIGGER releaseEmployee
AFTER UPDATE ON staff
	FOR EACH ROW EXECUTE PROCEDURE employeeReleased();
	
	
--Security--
GRANT INSERT ON orders TO customerVisits;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO management;