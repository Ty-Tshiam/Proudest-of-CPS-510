#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

# Andre Ceschia: 501156295
# Numair Jaan: 501113345
# Ty Tsiamala: 501168084



sqlplus64 "aceschia/12106295@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.cs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF 

DROP TABLE transactions;
DROP TABLE credit_account;
DROP TABLE savings_account;
DROP TABLE chequing_account;
DROP TABLE account;
DROP TABLE contact_info;
DROP TABLE rewards_account;
DROP TABLE benificary;
DROP TABLE users;

exit;

EOF

