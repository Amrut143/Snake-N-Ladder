#!/bin/bash 

#@Author: Amrut
#Snake N Ladder Use Case 7

echo "******Welcome to SnakeNLadder Game******"

START_POSITION=0
NO_PLAY=0
SNAKE=1
LADDER=2
WINNING_POSITION=100
FLAG=true

CurrentPosition=$START_POSITION
numOfRolls=0
checkTurn=0

declare -A positions

function rollDice() {
		checkDiceNum=$(( RANDOM % 6 + 1 ))
		ranCheck=$(( RANDOM % 3 ))

		case $ranCheck in
		$NO_PLAY)
				CurrentPosition=$(( CurrentPosition + $NO_PLAY ))
				;;
		$SNAKE)
				if [ $(( CurrentPosition-checkDiceNum )) -lt $START_POSITION ]
				then
					CurrentPosition=$START_POSITION
				else
					CurrentPosition=$(( CurrentPosition - checkDiceNum ))
				fi
				;;
		$LADDER)
				if [ $(( CurrentPosition+checkDiceNum )) -gt $WINNING_POSITION ]
				then
					CurrentPosition=$(( CurrentPosition - checkDiceNum ))
				else
					CurrentPosition=$(( CurrentPosition + checkDiceNum ))
				fi
				;;
		esac
}

function winningPosition() {

		while [ $FLAG ]
		do
			rollDice
			(( numOfRolls++ ))
			positions[ "RollNum $numOfRolls" ]=$CurrentPosition

			if [ $CurrentPosition -eq $WINNING_POSITION ]
			then
					break
			elif [ $CurrentPosition -lt $START_POSITION ]
			then
					echo "player position is below 0, restart game"
					CurrentPosition=$START_POSITION
			fi
		done
}
winningPosition
echo "${!positions[@]} : ${positions[@]}"
echo "Total Dice Rolls to reach the winning position is : $numOfRolls"
echo "**Player reaches to the winning position :: $CurrentPosition**"

function multiPlayer()
{
   while [ $FLAG ]
   do
      if [ $(( checkTurn%2 )) -eq 0 ]
      then
      rollDice
      (( checkTurn++ ))
         if [ $CurrentPosition -eq $WINNING_POSITION ]
         then
            echo "Player 1 Won"
            break
         fi
       fi

       if [ $(( checkTurn%2 )) -eq 1 ]
       then
       rollDice
       (( checkTurn++ ))
          if [ $CurrentPosition -eq $WINNING_POSITION ]
          then
             echo "Player 2 Won"
             break
          fi
       fi
   done
}

multiPlayer
