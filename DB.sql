create table customers(
	customerNumber int NOT NULL auto_increment,
    customerName nvarchar(50) NOT NULL,
    contactLastName nvarchar(50) NOT NULL,
    contactFirstName nvarchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    adressLine1 nvarchar(50) NOT NULL,
    adressLine2 nvarchar(50),
    city nvarchar(50) NOT NULL,
    state nvarchar(50) NOT NULL,
    postalCode varchar(15) NOT NULL,
    country varchar(50) NOT NULL,
    creditLimit int,
    primary key(customerNumber),
    salesRepEmployeeNumber int references employees(employeeNumber)
);

create table orders(
	orderNumber int NOT NULL auto_increment,
    orderDate date NOT NULL,
    requiredDate date NOT NULL,
    shippedDate date NOT NULL,
    status nvarchar(15) NOT NULL,
    comments text,
    quantityOrdered int NOT NULL,
    priceEach double NOT NULL,
    primary key(orderNumber),
    customerNumber int references customers(customerNumber)
);

create table payments(
	customerNumber int NOT NULL auto_increment,
    checkNumber nvarchar(50) NOT NULL,
    paymentDate date NOT NULL,
    amount double NOT NULL,
    primary key(customerNumber),
    customerNum int references customers(customerNumber)
);

create table products(
	productCode varchar(15) NOT NULL,
    productName nvarchar(70) NOT NULL,
    productScale varchar(10) NOT NULL,
    productVendor varchar(50) NOT NULL,
    productDescription text(50) NOT NULL,
    quantityInStock int NOT NULL,
    buyPrice double NOT NULL,
    MSRP double NOT NULL,
    primary key(productCode),
    productLine varchar(50) references productlines(productLine)
);

create table productlines(
	productLine varchar(50) NOT NULL,
    textDescription varchar(10000),
    image varchar(10000),
    primary key(productLine)
);

create table employees(
	employeeNumber int NOT NULL auto_increment,
    lastName nvarchar(50) NOT NULL,
    firstName nvarchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    jobTitle nvarchar(50) NOT NULL,
	primary key(employeeNumber),
    reportsTo int references employees(employeeNumber),
    officeCode varchar(10) references offices(officeCode)
);

create table offices(
	officeCode varchar(10) NOT NULL,
    city nvarchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressLine1 nvarchar(50) NOT NULL,
    addressLine2 nvarchar(50),
    state nvarchar(50),
    country nvarchar(50) NOT NULL,
    postalCode varchar(15) NOT NULL,
    primary key(officeCode)
);

create table orderdetails(
	ordernumber int references orders(orderNumber),
    productcode varchar(15) references products(productCode)
);