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


INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(1, 1, '2024-09-20');
INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(2, 2, '2024-09-20');
INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(3, 3, '2024-09-20');
INSERT INTO ACCOUNT(ACCOUNT_ID, USER_ID, CREATED) VALUES(4, 4, '2024-09-20');


INSERT INTO CHEQUING_ACCOUNT VALUES(2);
INSERT INTO CHEQUING_ACCOUNT VALUES(3);


INSERT INTO SAVINGS_ACCOUNT(account_id, compound_date) VALUES(1, '2024-10-20');
INSERT INTO SAVINGS_ACCOUNT(account_id, interest_rate, compound_date) VALUES(2, 3.78, '2024-10-20');


INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, destination, description)
VALUES
(1, 1, 'CASH-DEPOSIT', 20, 'ATM', 'ATM Cash Deposit');
