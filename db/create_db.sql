CREATE DATABASE travel;

grant all privileges on travel.* to 'webapp'@'%';
flush privileges;

use travel;

create table customer (
	id INT primary key Auto_Increment not null,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	streetAddress VARCHAR(50),
	City VARCHAR(50),
	stateOrProvidence VARCHAR(50),
	zipCode VARCHAR(50)
);


create table Airline (
	airlineId INT primary key Auto_Increment,
	name VARCHAR(50),
	numOfFlights INT,
	baseLocation VARCHAR(50)
);

create table hotel (
	hotelId INT primary key Auto_Increment not null,
	name VARCHAR(50),
	streetAddress VARCHAR(50),
	zipCode VARCHAR(50),
	city VARCHAR(50),
	stateOrProvidence VARCHAR(50),
	stars INT
);


create table Flight (
	flightID INT primary key Auto_Increment not null,
	startDateTime DATE,
	endDateTime DATE,
	arrivalLocation VARCHAR(50),
	departureLocation VARCHAR(50),
	airlineId Int not null,
	foreign key(airlineId) references Airline(airlineId)
);


create table room (
	number INT not null,
	beds INT,
	price DECIMAL(5,2),
	type VARCHAR(12),
    hotelID int not null,
	primary key(number, hotelId),
    foreign key(hotelID) references hotel(hotelId)
);

create table invoice_flights (
	invoiceId INT primary key Auto_Increment not null,
	price DECIMAL(5,2),
	seatNum VARCHAR(50),
	flightId INT not null,
	custId INT not null,
    foreign key(custId) references customer(id),
	foreign key(flightID) references Flight(flightID)
);

create table invoice_room (
	invoiceId INT primary key Auto_Increment not null,
	startDate DATE,
	endDate DATE,
	cost DECIMAL(10,2),
	customerId INT,
    foreign key (customerId) references customer(id)
);

create table room_booking (
	number INT not null,
	invoiceId INT Auto_Increment,
    primary key(number, invoiceId),
    foreign key (number) references room(number),
    foreign key (invoiceId) references invoice_room(invoiceId)
);

create table pilot (
	pilotId INT primary key Auto_Increment,
	firstName VARCHAR(50),
	lastName VARCHAR(50),
	experience INT
);

create table hired_pilot (
	pilotId INT,
	airlineId INT,
    primary key(pilotId, airlineId),
    foreign key (pilotId) references pilot(pilotId),
    foreign key (airlineId) references Airline(airlineId)
);

create table employee (
	employeeId INT primary key Auto_Increment,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

create table hired_employee (
	employeeId INT,
	hotelId INT,
    primary key(employeeId, hotelId),
    foreign key (employeeId) references employee(employeeId),
    foreign key (hotelId) references hotel(hotelID)
);


insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (1, 'Adan', 'Wasielewski', 'awasielewski0@amazonaws.com', '77 Ramsey Parkway', 'Huntington Beach', 'California', '92648');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (2, 'Blanch', 'Sadd', 'bsadd1@economist.com', '0291 Saint Paul Circle', 'Oklahoma City', 'Oklahoma', '73190');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (3, 'Alvera', 'Branchett', 'abranchett2@skyrock.com', '003 John Wall Drive', 'San Bernardino', 'California', '92405');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (4, 'Ewell', 'Middle', 'emiddle3@squarespace.com', '7 Fallview Circle', 'Dallas', 'Texas', '75397');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (5, 'Antonia', 'Cortez', 'acortez4@hao123.com', '65121 Mosinee Center', 'Anchorage', 'Alaska', '99599');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (6, 'Erie', 'Salkild', 'esalkild5@samsung.com', '8696 Cardinal Court', 'Pensacola', 'Florida', '32526');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (7, 'Rosa', 'Hasel', 'rhasel6@godaddy.com', '532 Oriole Trail', 'Hattiesburg', 'Mississippi', '39404');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (8, 'Drusi', 'Tollady', 'dtollady7@google.it', '0 Kinsman Road', 'Melbourne', 'Florida', '32919');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (9, 'Clement', 'Leverington', 'cleverington8@mysql.com', '56498 Rieder Lane', 'Naples', 'Florida', '34114');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (10, 'Ossie', 'McGriele', 'omcgriele9@sourceforge.net', '16 Sutherland Alley', 'Dallas', 'Texas', '75246');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (11, 'Kennan', 'Pontain', 'kpontaina@dailymail.co.uk', '0 Tomscot Lane', 'Newport News', 'Virginia', '23605');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (12, 'Wallie', 'Anyon', 'wanyonb@admin.ch', '58 Kipling Park', 'San Antonio', 'Texas', '78255');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (13, 'Andie', 'Goodley', 'agoodleyc@xrea.com', '9 Stuart Court', 'Tulsa', 'Oklahoma', '74141');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (14, 'Zondra', 'Hadigate', 'zhadigated@alibaba.com', '66259 Sugar Court', 'Washington', 'District of Columbia', '20420');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (15, 'Fairfax', 'O''Dyvoy', 'fodyvoye@dion.ne.jp', '4 Green Point', 'Kansas City', 'Missouri', '64144');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (16, 'Franklyn', 'Seedman', 'fseedmanf@epa.gov', '4 Hoard Place', 'Pittsburgh', 'Pennsylvania', '15215');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (17, 'Sidonia', 'Simmings', 'ssimmingsg@hostgator.com', '49 Sherman Circle', 'Minneapolis', 'Minnesota', '55407');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (18, 'Glenine', 'Millberg', 'gmillbergh@shinystat.com', '6005 Messerschmidt Circle', 'Norwalk', 'Connecticut', '06859');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (19, 'Emilio', 'Karpinski', 'ekarpinskii@sphinn.com', '0606 Rigney Drive', 'Southfield', 'Michigan', '48076');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (20, 'Belia', 'Colley', 'bcolleyj@networksolutions.com', '40233 Kennedy Hill', 'Chicago', 'Illinois', '60636');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (21, 'Erna', 'Stannislawski', 'estannislawskik@networkadvertising.org', '536 Bonner Circle', 'Pasadena', 'California', '91199');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (22, 'Steffie', 'Binner', 'sbinnerl@berkeley.edu', '8282 Gerald Parkway', 'Lubbock', 'Texas', '79405');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (23, 'Faustine', 'Simyson', 'fsimysonm@hao123.com', '056 Meadow Ridge Street', 'Baltimore', 'Maryland', '21275');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (24, 'Marthe', 'Faustian', 'mfaustiann@nyu.edu', '99 Lien Way', 'Miami Beach', 'Florida', '33141');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (25, 'Clari', 'Synke', 'csynkeo@friendfeed.com', '8 Roth Lane', 'Norwalk', 'Connecticut', '06859');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (26, 'Hendrick', 'Sissel', 'hsisselp@topsy.com', '4788 Carpenter Plaza', 'Washington', 'District of Columbia', '20205');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (27, 'Lottie', 'Birmingham', 'lbirminghamq@thetimes.co.uk', '6 Bobwhite Junction', 'Erie', 'Pennsylvania', '16565');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (28, 'Maximilien', 'Masson', 'mmassonr@webeden.co.uk', '64032 Portage Place', 'Dallas', 'Texas', '75216');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (29, 'Katya', 'Harnor', 'kharnors@prnewswire.com', '899 Kipling Avenue', 'Edmond', 'Oklahoma', '73034');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (30, 'Pollyanna', 'Orrin', 'porrint@e-recht24.de', '94 Pawling Park', 'Houston', 'Texas', '77206');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (31, 'Rory', 'Bertson', 'rbertsonu@google.ru', '28 Bluejay Point', 'Austin', 'Texas', '78754');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (32, 'Ambrosi', 'Grim', 'agrimv@mozilla.org', '550 Memorial Avenue', 'Syracuse', 'New York', '13217');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (33, 'Blancha', 'Dalgardno', 'bdalgardnow@hud.gov', '701 Harper Trail', 'Atlanta', 'Georgia', '30336');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (34, 'Jobye', 'Mence', 'jmencex@rambler.ru', '85 Lakewood Way', 'Shreveport', 'Louisiana', '71166');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (35, 'Dianne', 'Ballefant', 'dballefanty@whitehouse.gov', '433 Norway Maple Street', 'Houston', 'Texas', '77240');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (36, 'Josefa', 'McSparran', 'jmcsparranz@livejournal.com', '796 Lindbergh Plaza', 'Vancouver', 'Washington', '98682');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (37, 'Chadwick', 'Suttle', 'csuttle10@freewebs.com', '0 Charing Cross Alley', 'Independence', 'Missouri', '64054');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (38, 'Malinda', 'Greatbach', 'mgreatbach11@howstuffworks.com', '123 Kinsman Point', 'Pensacola', 'Florida', '32526');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (39, 'Franny', 'Nickell', 'fnickell12@ucla.edu', '44 Coolidge Court', 'Nashville', 'Tennessee', '37205');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (40, 'Lise', 'Ossenna', 'lossenna13@shop-pro.jp', '05 Sachtjen Street', 'Des Moines', 'Iowa', '50393');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (41, 'Eyde', 'Tockell', 'etockell14@java.com', '558 Comanche Point', 'Las Vegas', 'Nevada', '89166');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (42, 'Berry', 'Roizn', 'broizn15@si.edu', '075 Pleasure Circle', 'Louisville', 'Kentucky', '40266');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (43, 'Del', 'Ekins', 'dekins16@indiatimes.com', '4434 Bay Street', 'Sacramento', 'California', '94286');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (44, 'Valma', 'Frail', 'vfrail17@amazonaws.com', '9 Stephen Junction', 'Lincoln', 'Nebraska', '68517');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (45, 'Meggi', 'Ellins', 'mellins18@1und1.de', '322 Lighthouse Bay Center', 'Charlotte', 'North Carolina', '28242');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (46, 'Bonnibelle', 'Clift', 'bclift19@sphinn.com', '15 American Parkway', 'Phoenix', 'Arizona', '85045');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (47, 'Pail', 'Greenhow', 'pgreenhow1a@amazonaws.com', '11 Butterfield Place', 'Milwaukee', 'Wisconsin', '53277');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (48, 'Beatrisa', 'Vickar', 'bvickar1b@cpanel.net', '48487 Springs Street', 'Houston', 'Texas', '77212');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (49, 'Abel', 'Estick', 'aestick1c@github.com', '2 Armistice Pass', 'Wilkes Barre', 'Pennsylvania', '18706');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (50, 'Anson', 'Danielsson', 'adanielsson1d@cnn.com', '052 Summerview Court', 'Ridgely', 'Maryland', '21684');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (51, 'Jodee', 'Gascard', 'jgascard1e@wordpress.com', '3 Darwin Pass', 'Pompano Beach', 'Florida', '33069');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (52, 'Burnard', 'Argente', 'bargente1f@elegantthemes.com', '58841 Kings Hill', 'Seattle', 'Washington', '98115');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (53, 'Drusie', 'Aubery', 'daubery1g@prweb.com', '982 Dayton Road', 'Evansville', 'Indiana', '47712');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (54, 'Ive', 'Hulk', 'ihulk1h@studiopress.com', '4763 Sycamore Crossing', 'Dallas', 'Texas', '75265');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (55, 'Christiane', 'Hierro', 'chierro1i@npr.org', '698 Barby Hill', 'Springfield', 'Massachusetts', '01152');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (56, 'Cris', 'Ortiga', 'cortiga1j@mysql.com', '792 Bayside Pass', 'Oklahoma City', 'Oklahoma', '73167');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (57, 'Benita', 'Beseke', 'bbeseke1k@blogspot.com', '2116 Canary Junction', 'Erie', 'Pennsylvania', '16505');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (58, 'Simone', 'Jacob', 'sjacob1l@japanpost.jp', '15825 Birchwood Parkway', 'Buffalo', 'New York', '14215');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (59, 'Starr', 'Sharrocks', 'ssharrocks1m@360.cn', '7866 Clarendon Pass', 'Tampa', 'Florida', '33686');
insert into customer (id, first_name, last_name, email, streetAddress, City, stateOrProvidence, zipCode) values (60, 'Aymer', 'Medling', 'amedling1n@godaddy.com', '8 Crowley Street', 'Los Angeles', 'California', '90020');


insert into Airline (airlineId, name, numOfFlights, baseLocation) values (1, 'apalfrie0', 14, 'Jose Maria Córdova International Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (2, 'dchugg1', 50, 'Northern Colorado Regional Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (3, 'meardley2', 1, 'Toledo Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (4, 'mcolter3', 85, 'Hachinohe Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (5, 'psattin4', 24, 'Dawson Creek Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (6, 'bcolhoun5', 5, 'Austin Bergstrom International Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (7, 'abonnier6', 83, 'Shenandoah Valley Regional Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (8, 'pingleston7', 66, 'North Perry Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (9, 'gcarman8', 25, 'Bangor International Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (10, 'bstanwix9', 27, 'Tarauacá Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (11, 'obartlomiejczyka', 1, 'St Louis Regional Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (12, 'bwinspurrb', 5, 'Tancredo Neves International Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (13, 'croulstonc', 48, 'Kautokeino Air Base');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (14, 'ischruurd', 75, 'Draughon Miller Central Texas Regional Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (15, 'cgrovene', 39, 'Tari Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (16, 'ewoolardf', 23, 'Betioky Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (17, 'vcavang', 43, 'Lumberton Regional Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (18, 'drowneyh', 93, 'La Esperanza Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (19, 'bepdelli', 34, 'Mal Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (20, 'lgoldwaterj', 56, 'Kotoka International Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (21, 'cconeauk', 89, 'Ivanof Bay Seaplane Base');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (22, 'mcasemorel', 66, 'Cluj-Napoca International Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (23, 'ecarnegiem', 74, 'Bokpyinn Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (24, 'gcorradeschin', 71, 'Sibi Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (25, 'pvonhindenburgo', 22, 'Ivanovo South Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (26, 'estrippelp', 6, 'Pupelde Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (27, 'gpepisq', 41, 'Shonai Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (28, 'nburstonr', 51, 'Santa Cruz Sky Park');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (29, 'shazlewoods', 90, 'Shillong Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (30, 'hcookleyt', 73, 'Moyobamba Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (31, 'nsuermeieru', 44, 'Lab Lab Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (32, 'lcowderoyv', 70, 'Poitiers-Biard Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (33, 'cmutchw', 30, 'Sodankyla Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (34, 'ashipperbottomx', 88, 'Holbrook Municipal Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (35, 'rborsnally', 2, 'Castres-Mazamet Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (36, 'rviggarsz', 89, 'Nova Vida Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (37, 'dmaytom10', 49, 'Captain Jack Thomas El Dorado Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (38, 'dgrimshaw11', 89, 'Staroselye Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (39, 'dlougheid12', 70, 'Treasure Cay Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (40, 'abeddows13', 57, 'Shelby Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (41, 'rlaunchbury14', 91, 'Metro Field');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (42, 'mvasnev15', 15, 'Municipal de Linares Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (43, 'droblou16', 78, 'Mbanza Congo Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (44, 'kwatting17', 78, 'Harry Clever Field');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (45, 'wcorssen18', 40, 'Bartlett Cove Seaplane Base');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (46, 'fmussotti19', 11, 'Pittsburgh International Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (47, 'ebigly1a', 40, 'Ely Airport Yelland Field');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (48, 'fpaling1b', 17, 'Dallas Executive Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (49, 'hmcgonagle1c', 42, 'Einasleigh Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (50, 'cshawel1d', 92, 'Tauta Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (51, 'colooney1e', 88, 'Redzikowo Air Base');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (52, 'gbyrcher1f', 64, 'Zalingei Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (53, 'koreagan1g', 2, 'Base de Aviação de Taubaté Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (54, 'bmills1h', 24, 'Jacareacanga Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (55, 'lmackness1i', 2, 'Camden Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (56, 'mdudley1j', 98, 'Nioro du Sahel Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (57, 'epetrelli1k', 24, 'Velásquez Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (58, 'pjahnig1l', 94, 'Saginaw Seaplane Base');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (59, 'pstrangman1m', 2, 'Hardy-Anders Field / Natchez-Adams County Airport');
insert into Airline (airlineId, name, numOfFlights, baseLocation) values (60, 'jbarrand1n', 15, 'Flying Cloud Airport');


insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (1, '2022-04-29', '2022-01-14', 'PMI', 'EBN', 17);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (2, '2022-03-10', '2022-05-02', '0', 'PKH', 17);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (3, '2022-02-03', '2022-01-08', 'RRK', 'LVS', 25);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (4, '2021-11-30', '2022-04-05', 'NAY', 'CCY', 19);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (5, '2022-06-21', '2022-09-08', 'GID', 'TYZ', 3);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (6, '2022-04-22', '2022-01-07', 'CBO', 'ZBO', 11);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (7, '2021-11-23', '2022-01-23', 'MZS', 'QFX', 57);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (8, '2022-03-20', '2022-01-08', 'TGO', 'OOM', 60);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (9, '2022-10-20', '2022-03-28', 'MYQ', 'QCO', 58);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (10, '2022-01-05', '2022-07-27', 'WNU', 'SIV', 17);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (11, '2022-02-04', '2021-11-23', 'TPP', 'LMR', 53);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (12, '2022-07-28', '2022-11-11', 'DIW', 'MOT', 6);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (13, '2022-08-23', '2022-09-21', 'PHK', 'SIK', 28);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (14, '2022-06-04', '2022-10-23', 'WNN', 'TUD', 29);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (15, '2022-07-05', '2022-03-06', 'BQB', 'RMS', 56);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (16, '2022-10-22', '2022-07-23', 'DTM', 'SVC', 22);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (17, '2022-03-07', '2021-12-24', 'NLN', 'CZM', 5);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (18, '2022-09-26', '2022-01-04', 'DOY', 'MSH', 6);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (19, '2022-05-25', '2022-01-19', 'ENU', 'PDP', 36);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (20, '2022-04-16', '2022-09-18', 'UIQ', 'OSH', 21);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (21, '2022-11-08', '2022-01-17', 'EMP', 'SMZ', 33);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (22, '2022-01-28', '2022-06-07', 'EYK', 'YZU', 19);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (23, '2022-04-21', '2022-04-18', 'MBZ', 'TCB', 47);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (24, '2022-06-16', '2022-08-16', 'CGE', 'IHC', 36);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (25, '2022-03-20', '2022-10-20', 'WBQ', 'SLZ', 55);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (26, '2022-03-23', '2022-07-10', 'RCY', 'MNG', 6);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (27, '2022-01-07', '2022-07-20', 'JEJ', 'YRC', 18);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (28, '2022-01-11', '2022-08-09', 'SXI', 'STU', 45);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (29, '2022-05-14', '2022-05-01', 'BAD', 'WVB', 4);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (30, '2022-07-23', '2021-12-20', 'COW', 'DJU', 35);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (31, '2021-12-12', '2022-08-10', 'MHP', 'LRE', 48);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (32, '2022-04-28', '2022-03-04', 'YKM', 'UII', 41);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (33, '2022-11-04', '2022-06-29', 'MRC', 'SXJ', 18);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (34, '2022-05-01', '2022-11-11', 'ZHA', 'DGR', 26);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (35, '2022-01-05', '2022-07-14', 'TAR', 'YMJ', 53);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (36, '2022-01-23', '2022-10-12', 'UMT', 'RCA', 29);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (37, '2022-01-12', '2022-09-26', 'SYF', 'KGT', 2);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (38, '2022-05-22', '2022-07-13', 'LXV', 'XBE', 4);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (39, '2022-05-12', '2022-04-15', 'CLE', 'SKD', 26);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (40, '2022-09-23', '2022-06-02', 'CIU', 'HIB', 50);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (41, '2022-03-15', '2022-09-11', 'KVE', 'GUQ', 31);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (42, '2022-07-15', '2022-01-22', 'OVA', 'KEF', 36);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (43, '2022-04-12', '2021-12-22', 'HEI', 'DNF', 17);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (44, '2022-08-08', '2022-10-08', 'GBF', 'GXY', 12);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (45, '2022-06-02', '2022-07-24', 'HGE', 'GRK', 23);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (46, '2022-01-26', '2022-10-13', 'KUO', 'MPF', 37);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (47, '2022-10-17', '2022-01-31', 'GUC', 'BCJ', 36);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (48, '2021-12-15', '2022-01-01', 'JYR', 'TFF', 28);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (49, '2022-04-07', '2022-01-24', 'OYP', 'DWN', 53);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (50, '2021-11-21', '2022-03-09', 'JIQ', 'MEI', 49);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (51, '2022-09-25', '2022-10-21', 'BSZ', '0', 55);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (52, '2022-07-19', '2022-03-26', 'ELU', 'CZT', 52);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (53, '2022-01-16', '2022-07-17', 'KIK', 'HRC', 15);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (54, '2022-03-29', '2022-09-07', 'SNM', 'YWM', 12);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (55, '2021-12-07', '2022-07-29', '0', 'PLW', 47);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (56, '2022-02-06', '2022-11-02', 'WSP', 'ODB', 60);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (57, '2022-08-18', '2022-02-14', 'YTF', 'MJS', 58);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (58, '2022-07-07', '2022-05-22', 'SSL', 'ZCO', 35);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (59, '2022-09-11', '2022-04-21', 'PUS', 'AWB', 40);
insert into Flight (flightID, startDateTime, endDateTime, arrivalLocation, departureLocation, airlineId) values (60, '2022-05-21', '2022-06-11', 'AUU', 'SWC', 57);


insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (1, 'Noises Off...', '611 Prairie Rose Park', '70820', 'Baton Rouge', 'Louisiana', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (2, 'Cable Guy', '32 Summer Ridge Trail', '47905', 'Lafayette', 'Indiana', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (3, 'Star Wars Uncut: Director''s Cut', '06169 Melody Way', '71137', 'Shreveport', 'Louisiana', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (4, 'An American Hippie in Israel', '19909 Eagan Drive', '36610', 'Mobile', 'Alabama', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (5, 'Effect of Gamma Rays', '46 3rd Park', '52804', 'Davenport', 'Iowa', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (6, 'Libre échange', '65408 Elka Way', '47937', 'Crawfordsville', 'Indiana', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (7, 'Honey, I Blew Up the Kid', '7 Village Junction', '43220', 'Columbus', 'Ohio', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (8, 'Barbershop 2', '4 Rockefeller Point', '59112', 'Billings', 'Montana', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (9, 'Well Spent Life, A', '01 La Follette Road', '33185', 'Miami', 'Florida', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (10, 'Contagion / Bio Slime', '261 Columbus Drive', '68531', 'Lincoln', 'Nebraska', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (11, 'Speaking Parts', '3929 Bartelt Park', '98206', 'Everett', 'Washington', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (12, 'Wonderland', '30269 Mesta Parkway', '23213', 'Richmond', 'Virginia', 3);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (13, 'Desert Flower', '24711 Northview Crossing', '46226', 'Indianapolis', 'Indiana', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (14, 'Sharky''s Machine', '051 Sugar Circle', '71105', 'Shreveport', 'Louisiana', 3);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (15, 'Family Man', '9741 Nancy Lane', '23289', 'Richmond', 'Virginia', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (16, 'Return', '4 Springview Junction', '32803', 'Orlando', 'Florida', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (17, 'Comic Book Confidential', '96992 Dennis Way', '11254', 'Brooklyn', 'New York', 4);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (18, 'Spine Tingler!  The William Castle Story', '7 Trailsway Way', '78235', 'San Antonio', 'Texas', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (19, 'Last Hangman', '9518 Ruskin Avenue', '02216', 'Boston', 'Massachusetts', 4);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (20, 'Harrison''s Flowers', '10 Darwin Alley', '20530', 'Washington', 'District of Columbia', 4);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (21, 'Magic Trip', '1 Starling Street', '48206', 'Detroit', 'Michigan', 4);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (22, 'Frozen Planet', '95 Paget Pass', '29905', 'Beaufort', 'South Carolina', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (23, 'FM', '4 Loftsgordon Lane', '46295', 'Indianapolis', 'Indiana', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (24, 'Casting Couch', '6 School Pass', '59105', 'Billings', 'Montana', 4);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (25, 'La Legge', '9 Hayes Point', '75265', 'Dallas', 'Texas', 3);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (26, 'Dreamland', '82 Service Way', '48956', 'Lansing', 'Michigan', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (27, 'So Young', '00921 Schurz Pass', '92668', 'Orange', 'California', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (28, 'Little Giant', '30 Bunker Hill Junction', '68179', 'Omaha', 'Nebraska', 4);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (29, 'LEGO DC Comics', '20371 Esch Trail', '75205', 'Dallas', 'Texas', 4);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (30, 'All or Nothing', '99 Vermont Lane', '07104', 'Newark', 'New Jersey', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (31, 'Harvest', '7740 Tomscot Junction', '34233', 'Sarasota', 'Florida', 2);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (32, 'Day After', '773 Pepper Wood Court', '87121', 'Albuquerque', 'New Mexico', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (33, 'Murder She Said', '2664 Cascade Avenue', '79764', 'Odessa', 'Texas', 3);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (34, 'Noah''s Ark', '93692 Forest Dale Place', '90087', 'Los Angeles', 'California', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (35, 'Village of the Damned', '757 Southridge Alley', '55446', 'Minneapolis', 'Minnesota', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (36, 'Lies and Illusions', '68 Novick Point', '14604', 'Rochester', 'New York', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (37, 'Silent Night, Deadly Night', '25395 Marcy Center', '80935', 'Colorado Springs', 'Colorado', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (38, 'Glasses (Megane)', '489 Maryland Court', '18505', 'Scranton', 'Pennsylvania', 1);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (39, 'Far Horizons', '2 Glacier Hill Court', '22405', 'Fredericksburg', 'Virginia', 5);
insert into hotel (hotelId, name, streetAddress, zipCode, city, stateOrProvidence, stars) values (40, 'While You Were Sleeping', '0279 Red Cloud Center', '33023', 'Hollywood', 'Florida', 5);

INSERT INTO room(number,beds,price,type,hotelId) VALUES (90,1,201.72,'Suite',16);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (52,1,166.42,'Suite',14);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (428,1,359.41,'Presidential',2);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (25,2,196.17,'Presidential',6);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (431,1,313.76,'Presidential',31);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (405,1,270.11,'Suite',32);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (319,2,333.09,'Presidential',18);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (375,2,232.46,'Suite',34);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (542,2,312.47,'Presidential',28);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (454,2,66.92,'Standard',37);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (167,2,192.39,'Presidential',24);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (177,1,208.84,'Suite',26);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (469,1,259.03,'Suite',21);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (690,2,324.89,'Presidential',33);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (16,2,78.13,'Suite',39);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (238,1,175.34,'Presidential',31);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (206,2,284.23,'Suite',1);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (299,1,356.08,'Presidential',1);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (68,2,211.86,'Suite',31);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (137,2,254.32,'Suite',30);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (379,2,268.73,'Suite',22);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (481,1,246.16,'Suite',27);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (200,2,349.04,'Presidential',19);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (519,2,240.54,'Suite',18);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (689,2,302.42,'Presidential',29);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (507,1,354.76,'Presidential',39);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (386,2,127.75,'Suite',25);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (119,2,350.52,'Presidential',34);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (88,1,360.39,'Presidential',12);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (666,1,166.03,'Standard',26);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (440,2,153.83,'Suite',10);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (497,2,154.47,'Suite',23);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (382,2,178.46,'Suite',9);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (122,2,252.21,'Suite',14);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (310,1,133.59,'Presidential',15);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (579,2,290.63,'Suite',18);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (398,1,53.67,'Presidential',13);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (202,1,231.5,'Suite',30);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (51,2,329.55,'Presidential',10);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (58,1,85.21,'Standard',25);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (526,2,305.81,'Presidential',5);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (224,2,256.02,'Suite',37);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (423,2,398.4,'Presidential',20);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (274,1,205.72,'Suite',14);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (339,1,179.67,'Suite',31);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (23,2,180.35,'Presidential',12);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (569,2,346.58,'Presidential',12);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (575,1,205.68,'Suite',3);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (666,2,55.41,'Suite',1);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (50,2,273.13,'Suite',29);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (591,2,222.4,'Suite',12);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (562,2,369.17,'Presidential',34);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (397,1,89.55,'Suite',5);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (401,1,73.38,'Presidential',15);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (397,2,245.49,'Suite',20);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (253,2,369.74,'Presidential',2);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (236,1,398.84,'Presidential',1);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (291,2,271.0,'Suite',36);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (373,1,226.66,'Suite',6);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (668,2,93.88,'Suite',27);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (399,1,271.68,'Suite',15);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (266,1,278.77,'Suite',15);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (5,2,272.88,'Suite',8);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (187,1,219.04,'Suite',20);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (402,2,339.02,'Presidential',19);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (84,2,50.22,'Suite',17);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (486,2,173.99,'Presidential',18);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (377,1,328.6,'Presidential',40);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (169,2,159.27,'Suite',23);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (605,1,132.6,'Standard',27);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (625,1,251.26,'Suite',2);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (559,2,298.55,'Suite',32);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (697,1,239.17,'Suite',11);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (485,1,325.53,'Presidential',9);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (497,1,269.48,'Suite',20);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (201,1,200.13,'Suite',17);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (340,2,379.18,'Presidential',9);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (700,2,187.64,'Presidential',30);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (299,1,322.88,'Presidential',2);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (490,1,102.93,'Standard',15);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (541,2,202.01,'Suite',27);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (510,2,329.37,'Presidential',6);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (164,2,85.35,'Suite',11);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (267,2,96.23,'Standard',5);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (64,2,178.22,'Presidential',35);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (510,2,191.55,'Standard',17);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (345,2,50.46,'Standard',40);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (84,1,195.64,'Standard',6);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (109,1,230.27,'Suite',30);
INSERT INTO room(number,beds,price,type,hotelId) VALUES (523,1,369.76,'Presidential',14);


insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (1, 216.47, 'd8', 9, 1);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (2, 282.25, 'd1', 17, 11);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (3, 368.37, 'j1', 12, 13);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (4, 459.05, 'o3', 17, 7);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (5, 167.28, 'v2', 1, 11);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (6, 267.77, 'q8', 19, 6);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (7, 225.62, 'm7', 2, 15);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (8, 346.67, 'i9', 14, 10);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (9, 280.98, 'o8', 3, 1);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (10, 135.03, 'k9', 7, 17);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (11, 485.25, 's4', 11, 9);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (12, 243.94, 'e6', 4, 15);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (13, 209.0, 'j5', 7, 12);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (14, 182.92, 'e9', 5, 2);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (15, 384.27, 'o9', 2, 3);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (16, 176.37, 'd1', 16, 2);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (17, 229.61, 'a8', 18, 9);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (18, 136.29, 'o7', 13, 6);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (19, 471.75, 'y4', 4, 6);
insert into invoice_flights (invoiceId, price, seatNum, flightId, custId) values (20, 383.98, 's4', 3, 16);

insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (1, '2022-05-17', '2022-05-28', 2654.33, 47);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (2, '2022-10-29', '2022-11-10', 229.1, 55);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (3, '2022-03-24', '2022-03-29', 544.5, 2);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (4, '2022-01-05', '2022-01-14', 2362.7, 20);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (5, '2022-09-15', '2022-09-26', 1793.68, 10);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (6, '2022-04-04', '2022-04-16', 2300.01, 47);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (7, '2022-08-22', '2022-08-31', 3011.47, 20);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (8, '2022-08-21', '2022-08-30', 2531.96, 29);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (9, '2022-07-02', '2022-07-13', 2044.2, 53);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (10, '2022-06-25', '2022-07-02', 200.77, 9);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (11, '2022-05-09', '2022-05-12', 331.37, 50);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (12, '2022-06-24', '2022-06-29', 3102.85, 22);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (13, '2022-03-17', '2022-03-19', 1869.72, 42);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (14, '2022-08-12', '2022-08-20', 2133.03, 52);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (15, '2022-09-23', '2022-09-29', 2858.84, 3);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (16, '2021-12-20', '2021-12-30', 3406.2, 3);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (17, '2022-04-06', '2022-04-12', 436.17, 48);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (18, '2022-07-19', '2022-07-31', 3194.28, 44);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (19, '2022-08-19', '2022-08-20', 2922.26, 51);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (20, '2022-07-15', '2022-07-18', 2976.34, 17);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (21, '2021-11-21', '2021-12-03', 235.66, 14);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (22, '2022-01-26', '2022-02-01', 2399.01, 41);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (23, '2022-04-02', '2022-04-11', 388.04, 10);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (24, '2021-12-08', '2021-12-10', 3202.0, 46);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (25, '2021-11-23', '2021-11-26', 1141.95, 10);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (26, '2022-04-12', '2022-04-16', 1901.24, 40);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (27, '2022-09-09', '2022-09-19', 3043.09, 8);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (28, '2022-03-02', '2022-03-06', 1513.39, 51);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (29, '2022-06-29', '2022-07-08', 1533.82, 22);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (30, '2022-03-25', '2022-03-31', 3421.36, 55);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (31, '2022-03-20', '2022-03-27', 890.65, 48);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (32, '2022-05-02', '2022-05-10', 1587.32, 47);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (33, '2022-01-02', '2022-01-09', 1623.34, 27);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (34, '2022-10-16', '2022-10-26', 2399.59, 3);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (35, '2021-11-22', '2021-12-01', 656.53, 40);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (36, '2022-05-18', '2022-05-23', 586.97, 31);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (37, '2022-06-24', '2022-06-29', 1764.22, 46);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (38, '2022-05-15', '2022-05-23', 3197.25, 39);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (39, '2022-08-02', '2022-08-12', 1753.05, 17);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (40, '2022-06-05', '2022-06-16', 2633.63, 48);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (41, '2022-10-31', '2022-11-10', 1182.64, 36);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (42, '2021-12-19', '2021-12-22', 2941.21, 4);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (43, '2022-11-18', '2022-11-29', 1052.11, 17);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (44, '2022-08-02', '2022-08-03', 3332.67, 58);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (45, '2021-12-05', '2021-12-12', 3226.03, 12);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (46, '2022-02-03', '2022-02-14', 484.28, 8);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (47, '2022-06-24', '2022-06-27', 2875.04, 46);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (48, '2022-04-03', '2022-04-11', 1804.76, 53);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (49, '2022-02-18', '2022-02-25', 2479.73, 52);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (50, '2022-05-07', '2022-05-11', 551.51, 35);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (51, '2022-03-04', '2022-03-08', 3383.83, 10);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (52, '2022-01-23', '2022-01-27', 2666.26, 20);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (53, '2022-09-20', '2022-09-27', 3375.27, 24);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (54, '2022-04-21', '2022-05-01', 608.65, 22);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (55, '2022-03-28', '2022-04-09', 3488.26, 35);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (56, '2022-07-05', '2022-07-11', 1661.95, 15);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (57, '2022-04-04', '2022-04-07', 765.68, 29);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (58, '2022-04-13', '2022-04-21', 530.15, 35);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (59, '2022-07-02', '2022-07-12', 754.09, 7);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (60, '2022-05-30', '2022-06-03', 2638.87, 60);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (61, '2022-01-13', '2022-01-24', 1464.48, 1);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (62, '2022-11-12', '2022-11-23', 2156.67, 45);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (63, '2022-04-06', '2022-04-14', 3400.81, 1);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (64, '2022-09-03', '2022-09-05', 3424.64, 45);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (65, '2022-05-16', '2022-05-21', 2455.19, 23);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (66, '2022-04-09', '2022-04-10', 1270.95, 34);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (67, '2022-07-24', '2022-08-04', 994.19, 15);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (68, '2022-06-14', '2022-06-17', 897.7, 19);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (69, '2022-08-06', '2022-08-08', 521.39, 39);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (70, '2022-03-20', '2022-03-28', 225.94, 58);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (71, '2022-09-05', '2022-09-16', 2568.18, 50);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (72, '2022-04-23', '2022-05-03', 1189.55, 33);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (73, '2022-03-15', '2022-03-20', 2947.46, 57);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (74, '2022-11-10', '2022-11-22', 3349.0, 2);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (75, '2022-05-01', '2022-05-08', 2933.61, 55);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (76, '2022-09-20', '2022-09-30', 3287.6, 6);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (77, '2022-09-19', '2022-09-29', 1157.63, 39);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (78, '2022-05-24', '2022-05-25', 1356.32, 37);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (79, '2022-07-21', '2022-07-29', 983.83, 14);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (80, '2022-08-27', '2022-09-07', 2548.95, 40);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (81, '2022-01-11', '2022-01-19', 2768.71, 27);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (82, '2021-11-30', '2021-12-09', 154.52, 34);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (83, '2022-01-26', '2022-02-02', 2152.24, 36);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (84, '2022-05-12', '2022-05-22', 1190.18, 1);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (85, '2022-06-28', '2022-07-03', 902.4, 40);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (86, '2021-11-29', '2021-12-02', 402.7, 57);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (87, '2022-02-22', '2022-03-05', 1388.93, 8);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (88, '2022-04-16', '2022-04-27', 1886.57, 54);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (89, '2022-05-09', '2022-05-12', 2604.83, 3);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (90, '2022-11-09', '2022-11-18', 3078.98, 27);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (91, '2022-01-31', '2022-02-04', 2668.93, 37);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (92, '2022-06-08', '2022-06-19', 2588.69, 3);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (93, '2022-10-30', '2022-11-09', 1061.21, 18);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (94, '2022-11-05', '2022-11-10', 3017.78, 49);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (95, '2022-11-20', '2022-11-29', 2372.81, 17);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (96, '2022-08-28', '2022-09-05', 949.49, 33);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (97, '2022-09-06', '2022-09-08', 1515.85, 53);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (98, '2022-07-10', '2022-07-13', 2695.2, 55);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (99, '2022-04-13', '2022-04-17', 1958.85, 22);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (100, '2021-12-25', '2022-01-06', 2932.73, 31);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (101, '2022-01-23', '2022-01-30', 794.07, 59);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (102, '2022-08-29', '2022-09-04', 182.77, 5);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (103, '2022-08-29', '2022-09-02', 709.36, 51);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (104, '2021-12-04', '2021-12-07', 1463.12, 14);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (105, '2022-10-17', '2022-10-23', 982.29, 24);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (106, '2022-02-14', '2022-02-22', 2430.46, 58);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (107, '2022-09-25', '2022-10-06', 1842.46, 11);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (108, '2021-12-10', '2021-12-14', 2241.77, 5);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (109, '2022-02-13', '2022-02-21', 1928.5, 39);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (110, '2022-07-17', '2022-07-22', 1655.77, 41);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (111, '2022-11-04', '2022-11-06', 3091.33, 26);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (112, '2022-07-14', '2022-07-24', 1134.33, 20);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (113, '2022-09-22', '2022-10-02', 725.59, 9);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (114, '2022-04-25', '2022-04-28', 3186.67, 5);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (115, '2022-07-15', '2022-07-18', 804.58, 44);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (116, '2022-01-08', '2022-01-18', 1672.86, 19);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (117, '2022-06-02', '2022-06-07', 890.44, 13);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (118, '2022-11-07', '2022-11-15', 1565.28, 20);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (119, '2022-03-03', '2022-03-15', 1659.13, 34);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (120, '2022-09-13', '2022-09-16', 1773.66, 15);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (121, '2021-12-01', '2021-12-02', 1086.62, 60);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (122, '2021-11-28', '2021-12-10', 1326.44, 23);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (123, '2022-06-28', '2022-07-03', 1331.87, 53);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (124, '2022-11-18', '2022-11-26', 2902.43, 29);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (125, '2022-06-29', '2022-07-03', 1101.31, 18);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (126, '2022-10-02', '2022-10-05', 1121.13, 45);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (127, '2022-06-11', '2022-06-22', 2068.97, 57);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (128, '2022-11-17', '2022-11-21', 2991.75, 11);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (129, '2022-09-01', '2022-09-08', 2548.98, 60);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (130, '2022-04-01', '2022-04-09', 1004.42, 13);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (131, '2022-10-28', '2022-11-08', 2000.9, 55);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (132, '2022-10-23', '2022-10-27', 2102.53, 4);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (133, '2022-01-14', '2022-01-21', 2523.96, 31);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (134, '2022-08-26', '2022-08-30', 1892.18, 20);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (135, '2022-04-04', '2022-04-13', 2230.25, 37);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (136, '2022-06-06', '2022-06-18', 684.31, 44);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (137, '2022-05-03', '2022-05-07', 2880.16, 9);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (138, '2022-04-19', '2022-04-27', 359.76, 26);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (139, '2022-10-25', '2022-10-27', 3198.56, 57);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (140, '2022-10-15', '2022-10-24', 1653.62, 12);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (141, '2022-07-08', '2022-07-15', 3064.73, 35);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (142, '2022-03-28', '2022-04-04', 1668.4, 16);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (143, '2022-01-25', '2022-02-05', 2608.26, 19);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (144, '2022-03-06', '2022-03-16', 1929.08, 38);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (145, '2022-05-30', '2022-05-31', 240.26, 42);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (146, '2022-04-25', '2022-05-06', 2644.09, 39);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (147, '2022-05-18', '2022-05-19', 2343.43, 9);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (148, '2021-12-18', '2021-12-19', 2951.4, 37);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (149, '2022-04-01', '2022-04-11', 856.5, 50);
insert into invoice_room (invoiceId, startDate, endDate, cost, customerId) values (150, '2022-02-17', '2022-02-22', 1289.35, 11);

insert into room_booking (number, invoiceId) values (497, 1);
insert into room_booking (number, invoiceId) values (340, 2);
insert into room_booking (number, invoiceId) values (398, 3);
insert into room_booking (number, invoiceId) values (497, 4);
insert into room_booking (number, invoiceId) values (224, 5);
insert into room_booking (number, invoiceId) values (575, 6);
insert into room_booking (number, invoiceId) values (666, 7);
insert into room_booking (number, invoiceId) values (469, 8);
insert into room_booking (number, invoiceId) values (238, 9);
insert into room_booking (number, invoiceId) values (431, 10);
insert into room_booking (number, invoiceId) values (25, 11);
insert into room_booking (number, invoiceId) values (206, 12);
insert into room_booking (number, invoiceId) values (122, 13);
insert into room_booking (number, invoiceId) values (490, 14);
insert into room_booking (number, invoiceId) values (428, 15);
insert into room_booking (number, invoiceId) values (177, 16);
insert into room_booking (number, invoiceId) values (397, 17);
insert into room_booking (number, invoiceId) values (542, 18);
insert into room_booking (number, invoiceId) values (25, 19);
insert into room_booking (number, invoiceId) values (201, 20);
insert into room_booking (number, invoiceId) values (5, 21);
insert into room_booking (number, invoiceId) values (386, 22);
insert into room_booking (number, invoiceId) values (23, 23);
insert into room_booking (number, invoiceId) values (84, 24);
insert into room_booking (number, invoiceId) values (58, 25);
insert into room_booking (number, invoiceId) values (177, 26);
insert into room_booking (number, invoiceId) values (345, 27);
insert into room_booking (number, invoiceId) values (559, 28);
insert into room_booking (number, invoiceId) values (386, 29);
insert into room_booking (number, invoiceId) values (523, 30);
insert into room_booking (number, invoiceId) values (405, 31);
insert into room_booking (number, invoiceId) values (397, 32);
insert into room_booking (number, invoiceId) values (397, 33);
insert into room_booking (number, invoiceId) values (397, 34);
insert into room_booking (number, invoiceId) values (299, 35);
insert into room_booking (number, invoiceId) values (526, 36);
insert into room_booking (number, invoiceId) values (169, 37);
insert into room_booking (number, invoiceId) values (64, 38);
insert into room_booking (number, invoiceId) values (625, 39);
insert into room_booking (number, invoiceId) values (510, 40);
insert into room_booking (number, invoiceId) values (345, 41);
insert into room_booking (number, invoiceId) values (236, 42);
insert into room_booking (number, invoiceId) values (397, 43);
insert into room_booking (number, invoiceId) values (84, 44);
insert into room_booking (number, invoiceId) values (542, 45);
insert into room_booking (number, invoiceId) values (119, 46);
insert into room_booking (number, invoiceId) values (405, 47);
insert into room_booking (number, invoiceId) values (274, 48);
insert into room_booking (number, invoiceId) values (236, 49);
insert into room_booking (number, invoiceId) values (345, 50);
insert into room_booking (number, invoiceId) values (575, 51);
insert into room_booking (number, invoiceId) values (16, 52);
insert into room_booking (number, invoiceId) values (666, 53);
insert into room_booking (number, invoiceId) values (507, 54);
insert into room_booking (number, invoiceId) values (201, 55);
insert into room_booking (number, invoiceId) values (373, 56);
insert into room_booking (number, invoiceId) values (690, 57);
insert into room_booking (number, invoiceId) values (340, 58);
insert into room_booking (number, invoiceId) values (202, 59);
insert into room_booking (number, invoiceId) values (167, 60);
insert into room_booking (number, invoiceId) values (52, 61);
insert into room_booking (number, invoiceId) values (50, 62);
insert into room_booking (number, invoiceId) values (299, 63);
insert into room_booking (number, invoiceId) values (507, 64);
insert into room_booking (number, invoiceId) values (51, 65);
insert into room_booking (number, invoiceId) values (375, 66);
insert into room_booking (number, invoiceId) values (5, 67);
insert into room_booking (number, invoiceId) values (398, 68);
insert into room_booking (number, invoiceId) values (339, 69);
insert into room_booking (number, invoiceId) values (224, 70);
insert into room_booking (number, invoiceId) values (668, 71);
insert into room_booking (number, invoiceId) values (386, 72);
insert into room_booking (number, invoiceId) values (575, 73);
insert into room_booking (number, invoiceId) values (497, 74);
insert into room_booking (number, invoiceId) values (319, 75);
insert into room_booking (number, invoiceId) values (238, 76);
insert into room_booking (number, invoiceId) values (122, 77);
insert into room_booking (number, invoiceId) values (591, 78);
insert into room_booking (number, invoiceId) values (377, 79);
insert into room_booking (number, invoiceId) values (575, 80);
insert into room_booking (number, invoiceId) values (666, 81);
insert into room_booking (number, invoiceId) values (542, 82);
insert into room_booking (number, invoiceId) values (569, 83);
insert into room_booking (number, invoiceId) values (559, 84);
insert into room_booking (number, invoiceId) values (5, 85);
insert into room_booking (number, invoiceId) values (224, 86);
insert into room_booking (number, invoiceId) values (377, 87);
insert into room_booking (number, invoiceId) values (122, 88);
insert into room_booking (number, invoiceId) values (431, 89);
insert into room_booking (number, invoiceId) values (187, 90);
insert into room_booking (number, invoiceId) values (25, 91);
insert into room_booking (number, invoiceId) values (575, 92);
insert into room_booking (number, invoiceId) values (402, 93);
insert into room_booking (number, invoiceId) values (299, 94);
insert into room_booking (number, invoiceId) values (238, 95);
insert into room_booking (number, invoiceId) values (689, 96);
insert into room_booking (number, invoiceId) values (109, 97);
insert into room_booking (number, invoiceId) values (700, 98);
insert into room_booking (number, invoiceId) values (591, 99);
insert into room_booking (number, invoiceId) values (88, 100);
insert into room_booking (number, invoiceId) values (375, 101);
insert into room_booking (number, invoiceId) values (579, 102);
insert into room_booking (number, invoiceId) values (253, 103);
insert into room_booking (number, invoiceId) values (373, 104);
insert into room_booking (number, invoiceId) values (339, 105);
insert into room_booking (number, invoiceId) values (373, 106);
insert into room_booking (number, invoiceId) values (481, 107);
insert into room_booking (number, invoiceId) values (541, 108);
insert into room_booking (number, invoiceId) values (523, 109);
insert into room_booking (number, invoiceId) values (402, 110);
insert into room_booking (number, invoiceId) values (50, 111);
insert into room_booking (number, invoiceId) values (507, 112);
insert into room_booking (number, invoiceId) values (253, 113);
insert into room_booking (number, invoiceId) values (109, 114);
insert into room_booking (number, invoiceId) values (559, 115);
insert into room_booking (number, invoiceId) values (625, 116);
insert into room_booking (number, invoiceId) values (238, 117);
insert into room_booking (number, invoiceId) values (490, 118);
insert into room_booking (number, invoiceId) values (397, 119);
insert into room_booking (number, invoiceId) values (401, 120);
insert into room_booking (number, invoiceId) values (562, 121);
insert into room_booking (number, invoiceId) values (16, 122);
insert into room_booking (number, invoiceId) values (485, 123);
insert into room_booking (number, invoiceId) values (64, 124);
insert into room_booking (number, invoiceId) values (668, 125);
insert into room_booking (number, invoiceId) values (377, 126);
insert into room_booking (number, invoiceId) values (345, 127);
insert into room_booking (number, invoiceId) values (382, 128);
insert into room_booking (number, invoiceId) values (697, 129);
insert into room_booking (number, invoiceId) values (202, 130);
insert into room_booking (number, invoiceId) values (382, 131);
insert into room_booking (number, invoiceId) values (88, 132);
insert into room_booking (number, invoiceId) values (689, 133);
insert into room_booking (number, invoiceId) values (345, 134);
insert into room_booking (number, invoiceId) values (542, 135);
insert into room_booking (number, invoiceId) values (399, 136);
insert into room_booking (number, invoiceId) values (377, 137);
insert into room_booking (number, invoiceId) values (90, 138);
insert into room_booking (number, invoiceId) values (666, 139);
insert into room_booking (number, invoiceId) values (84, 140);
insert into room_booking (number, invoiceId) values (481, 141);
insert into room_booking (number, invoiceId) values (697, 142);
insert into room_booking (number, invoiceId) values (177, 143);
insert into room_booking (number, invoiceId) values (84, 144);
insert into room_booking (number, invoiceId) values (428, 145);
insert into room_booking (number, invoiceId) values (405, 146);
insert into room_booking (number, invoiceId) values (405, 147);
insert into room_booking (number, invoiceId) values (345, 148);
insert into room_booking (number, invoiceId) values (253, 149);
insert into room_booking (number, invoiceId) values (5, 150);


insert into pilot (pilotId, firstName, lastName, experience) values (1, 'Gwenny', 'Rowan', 25);
insert into pilot (pilotId, firstName, lastName, experience) values (2, 'Sydel', 'Shurville', 24);
insert into pilot (pilotId, firstName, lastName, experience) values (3, 'Nicki', 'Notley', 30);
insert into pilot (pilotId, firstName, lastName, experience) values (4, 'George', 'Bazek', 27);
insert into pilot (pilotId, firstName, lastName, experience) values (5, 'Stacey', 'Bemrose', 27);
insert into pilot (pilotId, firstName, lastName, experience) values (6, 'Christoforo', 'Ainscough', 24);
insert into pilot (pilotId, firstName, lastName, experience) values (7, 'Dieter', 'Provis', 15);
insert into pilot (pilotId, firstName, lastName, experience) values (8, 'Horacio', 'Dalmon', 5);
insert into pilot (pilotId, firstName, lastName, experience) values (9, 'Dorry', 'Chatwin', 7);
insert into pilot (pilotId, firstName, lastName, experience) values (10, 'Kristan', 'Fendt', 30);
insert into pilot (pilotId, firstName, lastName, experience) values (11, 'Igor', 'Harmon', 28);
insert into pilot (pilotId, firstName, lastName, experience) values (12, 'Alonso', 'Samsworth', 28);
insert into pilot (pilotId, firstName, lastName, experience) values (13, 'Audrey', 'Hastler', 6);
insert into pilot (pilotId, firstName, lastName, experience) values (14, 'Nathanil', 'Shelliday', 21);
insert into pilot (pilotId, firstName, lastName, experience) values (15, 'Lorine', 'Jandel', 14);
insert into pilot (pilotId, firstName, lastName, experience) values (16, 'Becky', 'Scrannage', 13);
insert into pilot (pilotId, firstName, lastName, experience) values (17, 'Serge', 'Caldroni', 10);
insert into pilot (pilotId, firstName, lastName, experience) values (18, 'Algernon', 'Whightman', 7);
insert into pilot (pilotId, firstName, lastName, experience) values (19, 'Yevette', 'Niccols', 10);
insert into pilot (pilotId, firstName, lastName, experience) values (20, 'Feliks', 'Sayburn', 1);
insert into pilot (pilotId, firstName, lastName, experience) values (21, 'Margarita', 'Marre', 16);
insert into pilot (pilotId, firstName, lastName, experience) values (22, 'Tobye', 'Perl', 16);
insert into pilot (pilotId, firstName, lastName, experience) values (23, 'Nesta', 'Phillippo', 26);
insert into pilot (pilotId, firstName, lastName, experience) values (24, 'Worden', 'Ovendon', 18);
insert into pilot (pilotId, firstName, lastName, experience) values (25, 'Kristofor', 'Janout', 28);
insert into pilot (pilotId, firstName, lastName, experience) values (26, 'Mikaela', 'Kanzler', 7);
insert into pilot (pilotId, firstName, lastName, experience) values (27, 'Ronnie', 'Richley', 14);
insert into pilot (pilotId, firstName, lastName, experience) values (28, 'Chalmers', 'Asling', 2);
insert into pilot (pilotId, firstName, lastName, experience) values (29, 'Sonnie', 'Taffrey', 20);
insert into pilot (pilotId, firstName, lastName, experience) values (30, 'Levey', 'Labrom', 14);
insert into pilot (pilotId, firstName, lastName, experience) values (31, 'Amandi', 'Lampet', 2);
insert into pilot (pilotId, firstName, lastName, experience) values (32, 'Kikelia', 'Stubbins', 22);
insert into pilot (pilotId, firstName, lastName, experience) values (33, 'Dudley', 'Hounsom', 15);
insert into pilot (pilotId, firstName, lastName, experience) values (34, 'Bernelle', 'Aikenhead', 27);
insert into pilot (pilotId, firstName, lastName, experience) values (35, 'Fawne', 'McEniry', 28);
insert into pilot (pilotId, firstName, lastName, experience) values (36, 'Maddie', 'Jolliffe', 18);
insert into pilot (pilotId, firstName, lastName, experience) values (37, 'Robin', 'Illidge', 2);
insert into pilot (pilotId, firstName, lastName, experience) values (38, 'Ysabel', 'Brodhead', 23);
insert into pilot (pilotId, firstName, lastName, experience) values (39, 'Far', 'Mewrcik', 29);
insert into pilot (pilotId, firstName, lastName, experience) values (40, 'Timofei', 'Eronie', 26);

insert into hired_pilot (pilotId, airlineId) values (13, 4);
insert into hired_pilot (pilotId, airlineId) values (8, 6);
insert into hired_pilot (pilotId, airlineId) values (11, 8);
insert into hired_pilot (pilotId, airlineId) values (11, 13);
insert into hired_pilot (pilotId, airlineId) values (15, 11);
insert into hired_pilot (pilotId, airlineId) values (19, 15);
insert into hired_pilot (pilotId, airlineId) values (4, 18);
insert into hired_pilot (pilotId, airlineId) values (7, 3);
insert into hired_pilot (pilotId, airlineId) values (10, 19);
insert into hired_pilot (pilotId, airlineId) values (11, 7);
insert into hired_pilot (pilotId, airlineId) values (1, 19);
insert into hired_pilot (pilotId, airlineId) values (10, 20);
insert into hired_pilot (pilotId, airlineId) values (19, 12);
insert into hired_pilot (pilotId, airlineId) values (1, 12);
insert into hired_pilot (pilotId, airlineId) values (11, 20);
insert into hired_pilot (pilotId, airlineId) values (13, 18);
insert into hired_pilot (pilotId, airlineId) values (4, 19);
insert into hired_pilot (pilotId, airlineId) values (16, 10);
insert into hired_pilot (pilotId, airlineId) values (8, 11);
insert into hired_pilot (pilotId, airlineId) values (2, 18);

insert into employee (employeeId, first_name, last_name) values (1, 'Martha', 'Furlong');
insert into employee (employeeId, first_name, last_name) values (2, 'Marcelia', 'Clemitt');
insert into employee (employeeId, first_name, last_name) values (3, 'Pearle', 'Phelp');
insert into employee (employeeId, first_name, last_name) values (4, 'Aeriell', 'Heinz');
insert into employee (employeeId, first_name, last_name) values (5, 'Luz', 'Dunsmuir');
insert into employee (employeeId, first_name, last_name) values (6, 'Margarete', 'Bellocht');
insert into employee (employeeId, first_name, last_name) values (7, 'Aurelea', 'O''Dowd');
insert into employee (employeeId, first_name, last_name) values (8, 'Sim', 'Blacklidge');
insert into employee (employeeId, first_name, last_name) values (9, 'Husein', 'Brimblecombe');
insert into employee (employeeId, first_name, last_name) values (10, 'Jandy', 'Gettins');
insert into employee (employeeId, first_name, last_name) values (11, 'Tomas', 'Borgnet');
insert into employee (employeeId, first_name, last_name) values (12, 'Clevie', 'Temby');
insert into employee (employeeId, first_name, last_name) values (13, 'Peg', 'Baribal');
insert into employee (employeeId, first_name, last_name) values (14, 'Joy', 'Weafer');
insert into employee (employeeId, first_name, last_name) values (15, 'Maurie', 'Cavee');
insert into employee (employeeId, first_name, last_name) values (16, 'Sheridan', 'Halling');
insert into employee (employeeId, first_name, last_name) values (17, 'Eadie', 'Medford');
insert into employee (employeeId, first_name, last_name) values (18, 'Perla', 'Macura');
insert into employee (employeeId, first_name, last_name) values (19, 'Fax', 'Winslet');
insert into employee (employeeId, first_name, last_name) values (20, 'Basia', 'd'' Eye');
insert into employee (employeeId, first_name, last_name) values (21, 'Sarette', 'Adacot');
insert into employee (employeeId, first_name, last_name) values (22, 'Cyb', 'Froment');
insert into employee (employeeId, first_name, last_name) values (23, 'Brad', 'Pointon');
insert into employee (employeeId, first_name, last_name) values (24, 'Marylee', 'Halliwell');
insert into employee (employeeId, first_name, last_name) values (25, 'Ashien', 'Pairpoint');
insert into employee (employeeId, first_name, last_name) values (26, 'Delano', 'Powis');
insert into employee (employeeId, first_name, last_name) values (27, 'Philippine', 'Terbrug');
insert into employee (employeeId, first_name, last_name) values (28, 'Margie', 'Alsopp');
insert into employee (employeeId, first_name, last_name) values (29, 'Rustie', 'Pendrid');
insert into employee (employeeId, first_name, last_name) values (30, 'Marena', 'Aguilar');
insert into employee (employeeId, first_name, last_name) values (31, 'Dallas', 'Herche');
insert into employee (employeeId, first_name, last_name) values (32, 'Michelle', 'Gerbel');
insert into employee (employeeId, first_name, last_name) values (33, 'Christiana', 'Sango');
insert into employee (employeeId, first_name, last_name) values (34, 'Laurette', 'Catterick');
insert into employee (employeeId, first_name, last_name) values (35, 'Kettie', 'Ashmore');
insert into employee (employeeId, first_name, last_name) values (36, 'Aubrey', 'Haughey');
insert into employee (employeeId, first_name, last_name) values (37, 'Erhard', 'Eckersley');
insert into employee (employeeId, first_name, last_name) values (38, 'Atlante', 'Poskitt');
insert into employee (employeeId, first_name, last_name) values (39, 'Adela', 'Kmicicki');
insert into employee (employeeId, first_name, last_name) values (40, 'Grace', 'Necolds');

insert into hired_employee (employeeId, hotelId) values (13, 4);
insert into hired_employee (employeeId, hotelId) values (8, 6);
insert into hired_employee (employeeId, hotelId) values (11, 8);
insert into hired_employee (employeeId, hotelId) values (11, 13);
insert into hired_employee (employeeId, hotelId) values (15, 11);
insert into hired_employee (employeeId, hotelId) values (19, 15);
insert into hired_employee (employeeId, hotelId) values (4, 18);
insert into hired_employee (employeeId, hotelId) values (7, 3);
insert into hired_employee (employeeId, hotelId) values (10, 19);
insert into hired_employee (employeeId, hotelId) values (11, 7);
insert into hired_employee (employeeId, hotelId) values (1, 19);
insert into hired_employee (employeeId, hotelId) values (10, 20);
insert into hired_employee (employeeId, hotelId) values (19, 12);
insert into hired_employee (employeeId, hotelId) values (1, 12);
insert into hired_employee (employeeId, hotelId) values (11, 20);
insert into hired_employee (employeeId, hotelId) values (13, 18);
insert into hired_employee (employeeId, hotelId) values (4, 19);
insert into hired_employee (employeeId, hotelId) values (16, 10);
insert into hired_employee (employeeId, hotelId) values (8, 11);
insert into hired_employee (employeeId, hotelId) values (2, 18);