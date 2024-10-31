#!/bin/bash

# Andre Ceschia: 501156295
# Numair Jaan: 501113345
# Ty Tsiamala: 501168084



lines=$(tail +12 out.txt | tee new.txt | grep -n "rows* selected" | cut -d : -f1) 
result=$(($lines -1))

head -n $result new.txt

rm new.txt
rm out.txt
