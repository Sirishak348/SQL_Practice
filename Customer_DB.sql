
-- Create Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    age INT,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
);

--adding column to table

alter table Customer add register_date date;

--inserting values to table

INSERT INTO Customer
VALUES
(101, 'Aarav',  'Sharma', 'Male',   25, 'aarav.sharma@gmail.com',  '9876543210', 'Hyderabad',      'Telangana',       '2024-01-15'),
(102, 'Diya',   'Patel',  'Female', 22, 'diya.patel@gmail.com',    '9876543211', 'Ahmedabad',      'Gujarat',         '2024-02-10'),
(103, 'Rahul',  'Verma',  'Male',   30, 'rahul.verma@gmail.com',   '9876543212', 'Bengaluru',      'Karnataka',       '2024-03-05'),
(104, 'Sneha',  'Reddy',  'Female', 27, 'sneha.reddy@gmail.com',   '9876543213', 'Vijayawada',     'Andhra Pradesh',  '2024-03-20'),
(105, 'Kiran',  'Kumar',  'Male',   35, 'kiran.kumar@gmail.com',   '9876543214', 'Chennai',        'Tamil Nadu',      '2024-04-12'),
(106, 'Priya',  'Singh',  'Female', 24, 'priya.singh@gmail.com',   '9876543215', 'Mumbai',         'Maharashtra',     '2024-05-18'),
(107, 'Rohit',  'Mehta',  'Male',   29, 'rohit.mehta@gmail.com',   '9876543216', 'Pune',           'Maharashtra',     '2024-06-22'),
(108, 'Ananya', 'Das',    'Female', 21, 'ananya.das@gmail.com',    '9876543217', 'Kolkata',        'West Bengal',     '2024-07-14'),
(109, 'Vikram', 'Naidu',  'Male',   40, 'vikram.naidu@gmail.com',  '9876543218', 'Visakhapatnam',  'Andhra Pradesh',  '2024-08-30'),
(110, 'Meera',  'Joshi',  'Female', 32, 'meera.joshi@gmail.com',   '9876543219', 'Jaipur',         'Rajasthan',       '2024-09-11');

--retrieving data
 
 select * from Customer;

 --update the data

 update Customer set city='Tamil Nadu' where customer_id=110;

 --delete the data

  delete Customer where customer_id=106;

  --dropping a column

  alter table customer drop column state;

  --delete all the records from table
   
   truncate table Customer;

   --delete the whole database

   drop table Customer;