#!/bin/bash

# Andre Ceschia: 501156295
# Numair Jaan: 501113345
# Ty Tsiamala: 501168084



MainMenu()
{
  while [ "$CHOICE" != "START" ]
  do
    clear

    echo "================================================================="
    echo "| Oracle All Inclusive Tool                                     |"
    echo "| Main Menu - Select Desired Operation(s):                      |"
    echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>              |"
    echo "-----------------------------------------------------------------"
    echo " $IS_SELECTEDM M) View Manual"
    echo " "
    echo " $IS_SELECTED1 1) Drop Tables"
    echo " $IS_SELECTED2 2) Create Tables"
    echo " $IS_SELECTED3 3) Populate Tables"
    echo " $IS_SELECTED4 4) Query Tables"
    echo " "
    echo " $IS_SELECTEDE E) End/Exit"
    echo "Choose: "

    read CHOICE

    if [ "$CHOICE" == "0" ]
    then
      echo "Nothing Here"

    elif [ "$CHOICE" == "1" ]
    then
      bash drop.sh
      echo "Press Enter To Continue"
      read NAN 

    elif [ "$CHOICE" == "2" ]
    then
      bash create.sh
      echo "Press Enter To Continue"
      read NAN

    elif [ "$CHOICE" == "3" ]
    then
      bash populate.sh
      echo "Press Enter To Continue"
      read NAN

    elif [ "$CHOICE" == "4" ]
    then
      clear 

      echo "================================================================="
      echo "| Query Menu                                                    |"
      echo "================================================================="
      echo " "
      echo " 1) Who are the users that have savings accounts?"
      echo " 2) Who are the users that have an average balance above $ 10?"
      echo " 3) How many accounts does each person have?"
      echo " 4) Which users do not have credit cards?"
      echo " 5) Which accounts do users have access to including benificaries?"
      echo " "
      echo " E) Go Back"

      read CHOICE
      clear

      if [ "$CHOICE" == "E" ]
      then

        echo ""

      elif [ "$CHOICE" == "1" ]
      then
        bash savings.sh
        echo "Press Enter to continue: "
        read NAN


      elif [ "$CHOICE" == "2" ]
      then
        bash avg_bal.sh

        echo "Press Enter to continue: "
        read NAN

      elif [ "$CHOICE" == "3" ]
      then
        bash num_acc.sh
        echo "Press Enter to continue: "
        read NAN

      elif [ "$CHOICE" == "4" ]
      then
        bash no_credit.sh
        echo "Press Enter to continue: "
        read NAN

      elif [ "$CHOICE" == "5" ]
      then
        bash all_access.sh
        echo "Press Enter to continue: "
        read NAN

      fi

    echo "Choose: "



    elif [ "$CHOICE" == "E" ]
    then
      exit
    fi
  done
}
#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
  StartMessage
  while [ 1 ]
  do
  MainMenu
  done
}
ProgramStart
