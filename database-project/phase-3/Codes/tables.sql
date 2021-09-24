create table Cook
(RegID varchar(10),
name varchar(30),
max_radius real,
m_name varchar(30),
kind varchar(30),
points dec(2,2),
phone_number varchar(8),
OID varchar(16),
credit int,
primary key(RegID),
foreign key(OID) references Owner(OID)
/* check max_radius*/
);


create table Cook_Address
(Cook_RegID varchar(10),
addr varchar(80),
primary key(Cook_RegID , addr),
foreign key(Cook_RegID) references Cook(RegID)
);


create table Customer
(CID varchar(10),
name varchar(30),
credit int,
phone_number varchar(11),
last_order1 varchar(50),
last_order2 varchar(50),
last_order3 varchar(50),
user_x real,
user_y real,
OID varchar(16),
primary key(CID),
foreign key(OID) references Owner(OID)
);


create table Customer_Address
(CID varchar(10),
addr varchar(80),
primary key(CID , addr),
foreign key(CID) references Customer(CID)
);


create table Comments
(CID varchar(10),
Cook_RegID varchar(10),
Ctext varchar(250),
primary key(CID, Cook_RegID, Ctext),
foreign key(CID) references Customer(CID),
foreign key(Cook_RegID) references Cook(RegID)
);


create table Food
(Cook_RegID varchar(10),
name varchar(60),
price int,
primary key(Cook_RegID, name),
foreign key(Cook_RegID) references Cook(RegID)
);


create table Request_Food
(CID varchar(10),
Cook_RegID varchar(10),
Fname varchar(60),
Req_date varchar(30),
time_estimate varchar(30),
food_point int,
transact_num varchar(16),
primary key( transact_num),
foreign key(Cook_RegID) references Food(Cook_RegID),
foreign key(Fname) references Food(name),
foreign key(CID) references Customer(CID),
foreign key(transact_num) references Transact(issue_tracking_num)
);



create table Main_Food
(Cook_RegID varchar(10),
name varchar(60),
raw_materials varchar(100),	
primary key(Cook_RegID, name),
foreign key(Cook_RegID) references Food(Cook_RegID),
foreign key(name) references Food(name)
);


create table Appetizer
(Cook_RegID varchar(10),
name varchar(60),
raw_materials varchar(100),
primary key(Cook_RegID, name),
foreign key(Cook_RegID) references Food(Cook_RegID),
foreign key(name) references Food(name)
);


create table Drink
(Cook_RegID varchar(10),
name varchar(60),
D_type varchar(5),
primary key(Cook_RegID, name),
foreign key(Cook_RegID) references Food(Cook_RegID),
foreign key(name) references Food(name)
);


create table Delivery
(DID varchar(10),
name varchar(30),
addr varchar(80),
credit int,
VID varchar(6),
Vname varchar(30),
employment_date varchar(30),
delivery_x real,
delivery_y real,
phone_number varchar(11),
OID varchar(16),
primary key(DID),
foreign key(OID) references Owner(OID)
);


create table Transact
(sender_num varchar(16),
receiver_num varchar(16),
Tdate varchar(30),
issue_tracking_num varchar(16),
primary key(issue_tracking_num),
foreign key(sender_num) references Bank_Account(num),
foreign key(receiver_num) references Bank_Account(num)
);


create table Bank_Account
(num varchar(16),
OID varchar(16),
primary key(num)
foreign key(OID) references Owner(OID)
);


create table Owner
(OID varchar(16),
primary key OID
);


create table Discount_Code
(num int,
CID varchar(10),
primary key(CID, num),
foreign key(CID) references Customer(CID)
);


create table Deliver_Order
(
DID varchar(60),
Req_date varchar(30),
time_estimate varchar(30),
delivery_point int,
transact_num varchar(16),
primary key( transact_num),

foreign key(CID) references Request_Food(CID),
foreign key(DID) references Delivery(DID),
foreign key(transact_num) references Transact(issue_tracking_num)
);
