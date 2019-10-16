CREATE TABLE Author
(
  AuthorID INT AUTO_INCREMENT,
  AuthorFName VARCHAR(45) NOT NULL,
  AuthorLName VARCHAR(45) NOT NULL,
  CONSTRAINT PK_Author_AuthorID PRIMARY KEY (AuthorID)
);

CREATE TABLE Book_Author
(
  BookID INT NOT NULL,
  AuthorID INT NOT NULL,
  CONSTRAINT FK_BookAuthor_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
  CONSTRAINT FK_BookAuthor_AuthorID FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
  CONSTRAINT U_BookAuthor UNIQUE (BookID, AuthorID)
);

CREATE TABLE Publisher
(
  PubID INT AUTO_INCREMENT,
  PubName VARCHAR(75) NOT NULL,
  AddressID INT,
  CONSTRAINT PK_Publisher_PubID PRIMARY KEY (PubID),
  CONSTRAINT FK_Publisher_AddressID FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
  CONSTRAINT U_Publisher UNIQUE (addressID,PubName)
);

CREATE TABLE Book_Publisher
(
  BookID INT NOT NULL,
  PubID INT NOT NULL,
  CONSTRAINT FK_BookPublisher_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
  CONSTRAINT FK_BookAuthor_PubID FOREIGN KEY (PubID) REFERENCES Publisher(PubID),
  CONSTRAINT U_BookPublisher UNIQUE (BookID, PubID)
);

INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Mark', 'Twain');
INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Dan', 'Brown');
INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Jerome', 'Salinger');
INSERT INTO Publisher (PubName) VALUES ('Penguin Random House');
INSERT INTO Publisher (PubName) VALUES ('Del Ray');
INSERT INTO Publisher (PubName) VALUES ('Simon & Schuster');

CREATE TABLE State
(
  StateID INT NOT NULL,
  State INT NOT NULL,
  PRIMARY KEY (StateID)
);

CREATE TABLE City
(
  CityID INT NOT NULL,
  City INT NOT NULL,
  PRIMARY KEY (CityID)
);

CREATE TABLE AddressType
(
  AdressTypeID INT NOT NULL,
  AddressTypeName INT NOT NULL,
  PRIMARY KEY (AdressTypeID)
);

CREATE TABLE Zip
(
  ZipID INT NOT NULL,
  PRIMARY KEY (ZipID)
);

CREATE TABLE City_Zip
(
  CityFK INT NOT NULL,
  ZipFK INT NOT NULL,
  FOREIGN KEY (CityFK) REFERENCES City(CityID),
  FOREIGN KEY (ZipFK) REFERENCES Zip(ZipID)
);

CREATE TABLE Address
(
  AddressID INT NOT NULL,
  Street INT NOT NULL,
  CityFK INT NOT NULL,
  StateFK INT NOT NULL,
  PRIMARY KEY (AddressID),
  FOREIGN KEY (StateFK) REFERENCES State(StateID),
  FOREIGN KEY (CityFK) REFERENCES City(CityID)
);

CREATE TABLE Customer_Address
(
  CustomerFK INT NOT NULL,
  AddressFK INT NOT NULL,
  FOREIGN KEY (CustomerFK) REFERENCES Customer(CustomerID),
  FOREIGN KEY (AddressFK) REFERENCES Address(AddressID)
);

CREATE TABLE Address_AddressType
(
  AddressFK INT NOT NULL,
  AddressTypeFK INT NOT NULL,
  FOREIGN KEY (AddressFK) REFERENCES Address(AddressID),
  FOREIGN KEY (AddressTypeFK) REFERENCES AddressType(AdressTypeID)
);