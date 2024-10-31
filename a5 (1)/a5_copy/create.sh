#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
# Andre Ceschia: 501156295
# Numair Jaan: 501113345
# Ty Tsiamala: 501168084



sqlplus64 "aceschia/12106295@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF 

-- initializes USERS table
CREATE TABLE users (
    user_id INT,
    first_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);

-- initializes BENIFICARY table
-- many to many so it is used as a bridge table
CREATE TABLE benificary (
    grantor_id INT NOT NULL,
    benificary_id INT NOT NULL,
    FOREIGN KEY (grantor_id) REFERENCES users(user_id),
    FOREIGN KEY (benificary_id) REFERENCES users(user_id)
);

--initializes REWARDS_ACCOUNT
-- used uniqye ino user_id to enforce 1 to 1
CREATE TABLE rewards_account (
    account_id INT NOT NULL UNIQUE,
    user_id INT NOT NULL UNIQUE,
    balance INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- initializes CONTANT_INFO
-- unique on user_id forces 1 to 1
CREATE TABLE contact_info (
    user_id INT NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    postal_code VARCHAR(6) NOT NULL,
    apt_number VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- initializes ACCOUNT
-- decimal allows 10 digits before decimal point and 2 after
CREATE TABLE account(
    account_id INT, 
    user_id INT NOT NULL,
    balance DECIMAL(12, 2) DEFAULT 0,
    created DATE NOT NULL,
    PRIMARY KEY (account_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- specialization of account
-- no special attribute in chequing specialzation, just to distinguish account types
CREATE TABLE chequing_account(
    account_id INT NOT NULL UNIQUE,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE savings_account(
    account_id INT NOT NULL UNIQUE,
    interest_rate DECIMAL(4, 2) DEFAULT 3.5,
    compound_date DATE NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE credit_account(
    account_id INT NOT NULL UNIQUE,
    interest_rate DECIMAL(4, 2) DEFAULT 19.5,
    due_date DATE NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

-- initializes TRANSACTIONS table
-- CLOB is large text datatype
CREATE TABLE transactions(
    transaction_id INT NOT NULL UNIQUE,
    account_id INT NOT NULL,
    transaction_type VARCHAR(255) NOT NULL,
    amount DECIMAL(12, 2) NOT NULL,
    destination VARCHAR(255) NOT NULL,
    description CLOB,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

exit;

EOF

