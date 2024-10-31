#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Andre Ceschia: 501156295
# Numair Jaan: 501113345
# Ty Tsiamala: 501168084



sqlplus64 "aceschia/12106295@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF >out.txt
SET LINESIZE 200
SET WRAP OFF
SET FEEDBACK ON

COLUMN USER_ID FORMAT 99999999
COLUMN FIRST_NAME FORMAT A20
COLUMN LAST_NAME FORMAT A20

SELECT U.user_id, U.first_name, U.last_name FROM
((SELECT U.user_id
FROM users U
JOIN account A ON A.user_id=U.user_id)
MINUS
(SELECT user_id
FROM account A
JOIN credit_account CA ON A.account_id=CA.account_id)) t1
JOIN users U ON U.user_id=t1.user_id;


exit;
EOF

bash pretty_print.sh
