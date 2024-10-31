#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Andre Ceschia: 501156295
# Numair Jaan: 501113345
# Ty Tsiamala: 501168084



sqlplus64 "aceschia/12106295@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF 
-- Andre Ceschia: 501156295
-- Numair Jaan: 501113345
-- Ty Tsiamala: 501168084

INSERT INTO USERS VALUES(1, 'Andre', 'Ceschia');
INSERT INTO USERS VALUES(2, 'John', 'Smith');
INSERT INTO USERS VALUES(3, 'Jane', 'Smith');
INSERT INTO USERS VALUES(4, 'Nicole', 'Barbara');

INSERT INTO BENIFICARY VALUES(1, 4);

INSERT INTO REWARDS_ACCOUNT(account_id, user_id) VALUES(1, 1);
INSERT INTO REWARDS_ACCOUNT(account_id, user_id) VALUES(2, 2);
INSERT INTO REWARDS_ACCOUNT(account_id, user_id) VALUES(3, 3);
INSERT INTO REWARDS_ACCOUNT(account_id, user_id) VALUES(4, 4);


INSERT INTO CONTACT_INFO(user_id, email, phone_number, country, province, city, address, postal_code)
VALUES(1, 'andre.ceschia@gmail.com', '437-997-8920', 'Canada', 'Ontario', 'Toronto', '123 Main St.', 'L4H3A8');
INSERT INTO CONTACT_INFO(user_id, email, phone_number, country, province, city, address, postal_code)
VALUES(2, 'john-smith@gmail.com', '537-997-8920', 'Canada', 'Ontario', 'Toronto', '124 Main St.', 'L4H3A8');
INSERT INTO CONTACT_INFO(user_id, email, phone_number, country, province, city, address, postal_code)
VALUES(3, 'jane.smith@gmail.com', '537-997-8920', 'Canada', 'Ontario', 'Toronto', '124 Main St.', 'L4H3A8');
INSERT INTO CONTACT_INFO(user_id, email, phone_number, country, province, city, address, postal_code)
VALUES(4, 'nicole.barbara@gmail.com', '437-997-8921', 'Canada', 'Ontario', 'Toronto', '123 Main St.', 'L4H3A8');


INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(1, 1, TO_DATE('2024-09-20', 'YYYY-MM-DD'));
INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(2, 2, TO_DATE('2024-09-20', 'YYYY-MM-DD'));
INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(3, 3, TO_DATE('2024-09-20', 'YYYY-MM-DD'));
INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(4, 4, TO_DATE('2024-09-20', 'YYYY-MM-DD'));

INSERT INTO account(account_id, user_id, created, balance) VALUES(5, 1, TO_DATE('2024-09-24', 'YYYY-MM-DD'), 20);


INSERT INTO CHEQUING_ACCOUNT VALUES(2);
INSERT INTO CHEQUING_ACCOUNT VALUES(3);
INSERT INTO chequing_account VALUES(5);


INSERT INTO SAVINGS_ACCOUNT(account_id, compound_date) VALUES(1, TO_DATE('2024-10-20', 'YYYY-MM-DD'));
INSERT INTO SAVINGS_ACCOUNT(account_id, interest_rate, compound_date) VALUES(2, 3.78, TO_DATE('2024-10-20', 'YYYY-MM-DD'));


INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, destination, description)
VALUES
(1, 1, 'CASH-DEPOSIT', 20, 'ATM', 'ATM Cash Deposit');

UPDATE account
SET balance=20
WHERE account_id=1;

INSERT INTO benificary VALUES(2, 3);
INSERT INTO benificary VALUES(3, 2);
INSERT INTO savings_account VALUES(4, 2.75, TO_DATE('2024-10-24', 'YYYY-MM-DD'));

UPDATE account
SET balance=1000
WHERE account_id=3;

UPDATE account
SET balance=100
WHERE account_id=2;

INSERT INTO account VALUES(6, 3, -200, TO_DATE('2024-09-24', 'YYYY-MM-DD'));
INSERT INTO account VALUES(7, 1, -20, TO_DATE('2024-09-24', 'YYYY-MM-DD'));
INSERT INTO account VALUES(8, 4, 20, TO_DATE('2024-09-24', 'YYYY-MM-DD'));

INSERT INTO credit_account(account_id, due_date) VALUES(6, TO_DATE('2024-10-24', 'YYYY-MM-DD'));
INSERT INTO credit_account VALUES(8, 18.5, TO_DATE('2024-10-25', 'YYYY-MM-DD'));
INSERT INTO credit_account(account_id, due_date) VALUES(7, TO_DATE('2024-10-25', 'YYYY-MM-DD'));

UPDATE contact_info
SET City = 'Pickering'
WHERE user_id=2 OR user_id=3;

INSERT INTO transactions VALUES (3, 7, 'TRANSFER', -20, 'SELF', 'Money Transfer');
INSERT INTO transactions VALUES (4, 5, 'INCOMING TRANSFER', 20, 'INCOMING', 'Received From Self');

UPDATE transactions
SET destination='INCOMING'
WHERE transaction_id <> 3;

INSERT INTO transactions VALUES (5, 2, 'CASH-DEPOSIT', 100, 'INCOMING', 'ATM Cash Deposit');


INSERT INTO transactions VALUES(6, 3, 'CASH-DEPOSIT', 1000, 'INCOMING', 'ATM Cash Deposit');
INSERT INTO transactions VALUES(7, 6, 'PURCHASE', -200, 'BESTBUY', 'Best Buy Purchase');
INSERT INTO transactions VALUES(8, 8, 'CASH-DEPOSIT', 20, 'INCOMING', 'ATM Cash Deposit');

UPDATE transactions
SET destination='INCOMING'
WHERE transaction_id=4;

UPDATE credit_account SET due_date=TO_DATE('2024-09-20', 'YYYY-MM-DD') WHERE account_id=7;

DELETE FROM transactions WHERE transaction_id=8;

exit;

EOF

