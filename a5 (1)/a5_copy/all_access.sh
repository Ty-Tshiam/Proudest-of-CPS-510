#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Andre Ceschia: 501156295
# Numair Jaan: 501113345
# Ty Tsiamala: 501168084



sqlplus64 "aceschia/12106295@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF  >out.txt
SET LINESIZE 200
SET WRAP OFF
SET FEEDBACK ON
SET PAGESIZE 5000

COLUMN USER_ID FORMAT 99999999
COLUMN FIRST_NAME FORMAT A20
COLUMN LAST_NAME FORMAT A20

(SELECT U.user_id, U.first_name, U.last_name, B.account_id, B.balance FROM benificary_access B
JOIN users U ON U.user_id=B.benificary_id)
UNION
(SELECT U.user_id, U.first_name, U.last_name, A.account_id, A.balance
FROM account A
JOIN users U on U.user_id=A.user_id);

exit;
EOF

bash pretty_print.sh
