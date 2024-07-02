Create database Fundtransfer;
use Fundtransfer;
CREATE TABLE Users (
    user_ID INT PRIMARY KEY auto_increment,
    user_name varchar(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    user_Password VARCHAR(50) NOT NULL
);

CREATE TABLE Accounts (
     user_ID INT,
   first_name varchar(30) NOT NULL,
    Last_name varchar(30) NOT NULL,
    phonenumber varchar(30) NOT NULL,
    date_of_birth date,
    aadhar_number varchar(30) NOT NULL unique,
     IFSC varchar(30)  unique ,
    residential_address varchar(100) NOT NULL,
    account_Balance int default 1000,
     account_ID varchar(25) unique ,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE beneficiary (
    beneficiary_ID INT PRIMARY KEY auto_increment,
     user_ID INT,
    beneficiary_name varchar(25),
    beneficiary_accountID varchar(25) NOT NULL unique,
    ifsccode varchar(25) NOT NULL unique,
    account_balance int default 1000,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)

);

drop table beneficiary;
delete from beneficiary;
CREATE TABLE Transfers (
    user_ID INT,
    transfer_ID INT PRIMARY KEY auto_increment,
    sender_Account_ID varchar(25),
    Recipient_ID varchar(25),
    IFSC_code varchar(25),
    transfer_Type VARCHAR(20),
    transfer_Date datetime,
    transfer_Amount int ,
    FOREIGN KEY (Sender_Account_ID) REFERENCES Accounts(account_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
   
);
Select * from Users; 
Select * from Accounts; 
Select * from Transactions; 
Select * from Transfers;
SET SQL_SAFE_UPDATES = 0;
delete from users;
delete from accounts;
delete from Transfers;
drop table users;
drop table accounts;
drop database Fundtransfer;
drop table Transfers;
drop table Recipients;
insert into Users(user_ID,user_name,email,user_Password)values(1,"fastpay","admin@fastpay.com","Fastpay@1");
alter table accounts add column is_approval boolean default 0;

