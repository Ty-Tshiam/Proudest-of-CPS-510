-- Andre Ceschia: 501156295
-- Numair Jaan: 501113345
-- Ty Tsiamala: 501168084

-- This query shows all benifcaries in the database and whose accounts they can access
SELECT 
U1.user_id as benificary_id, 
U1.first_name as benificary_first_name, 
U1.last_name as benificary_last_name, 
U2.first_name as grantor_first_name, 
U2.last_name as grantor_last_name 
FROM users U1
JOIN benificary B on U1.user_id=B.benificary_id
JOIN users U2 on B.grantor_id=U2.user_id;

-- This query shows the total balance in all of a users accounts
-- sorted by balance
-- i.e. sum of chequing balance, savings balance, credit debt 
SELECT 
U.user_id, U.first_name, U.last_name, sum(balance) as Total_Balance
FROM users U 
JOIN account A on A.user_id=U.user_id
GROUP BY (U.user_id, U.first_name,  U.last_name)
ORDER BY Total_Balance DESC;


-- This query shows the balance in all users rewards account
SELECT U.user_id, U.first_name, U.last_name, RA.balance
FROM rewards_account RA
JOIN users U on RA.user_id=U.user_id;

-- This query shows us the savings accounts (and their owners) with the nearest compund date
-- If 2 accounts have the same compound date, sort by balance
SELECT U.user_id, A.account_id, U.first_name, U.last_name, A.balance, SA.compound_date
FROM savings_account SA
JOIN account A ON A.account_id=SA.account_id
JOIN users U ON U.user_id=A.user_id
ORDER BY SA.compound_date ASC, A.balance DESC;

-- This query shows us all chequing accounts sorted by balance ascending and their owners
SELECT U.user_id, A.account_id, U.first_name, U.last_name, A.created, A.balance
FROM chequing_account CA
JOIN account A on A.account_id=CA.account_id
JOIN users U on U.user_id=A.user_id
ORDER BY A.balance DESC;

-- This query shows us all users who currently owe money on their credit card
-- sorted by nearest due date
SELECT U.user_id, A.account_id, U.first_name, U.last_name, A.balance, CA.due_date
FROM credit_account CA
JOIN account A ON a.account_id=CA.account_id
JOIN users U on A.user_id=U.user_id
WHERE A.balance < 0
ORDER BY CA.due_date ASC, A.balance ASC;

-- What is the name and phone number of everyone who does not live in toronto
SELECT U.user_id, U.first_name, U.last_name, CI.phone_number
FROM contact_info CI
JOIN users U ON U.user_id=CI.user_id
WHERE City <> 'Toronto';

-- How many accounts does each person own?
-- Sorted by total accounts
SELECT U.user_id, U.first_name, U.last_name, COUNT(A.account_id) as Total_Accounts
FROM account A
JOIN users U ON A.user_id=U.user_id
GROUP BY (U.user_id, U.first_name, U.last_name)
ORDER BY Total_Accounts DESC;

-- What transactions has each person made on their accounts
-- Sorted by user_id so a users transactoins are grouped together
SELECT U.user_id, A.account_id, U.first_name, U.last_name, T.amount, T.description
FROM transactions T
JOIN account A ON T.account_id=A.account_id
JOIN users U ON U.user_id=A.user_id
ORDER BY U.user_id ASC;

