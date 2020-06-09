#!/bin/bash 

#@Author: Amrut
#Snake N Ladder Use Case 5

echo "******Welcome to SnakeNLadder Game******"

START_POSITION=0
NO_PLAY=0
SNAKE=1
LADDER=2
WINNING_POSITION=100
FLAG=true

player=1
CurrentPosition=$START_POSITION

function rollDice() {
		checkDiceNum=$(( RANDOM % 6 + 1 ))
		ranCheck=$(( RANDOM % 3 ))

		case $ranCheck in
		$NO_PLAY)
				CurrentPosition=$(( CurrentPosition + $NO_PLAY ))
				;;
		$SNAKE)
				CurrentPosition=$(( CurrentPosition - checkDiceNum ))
				;;
		$LADDER)
				if [ $(( CurrentPosition+checkDiceNum )) -gt $WINNING_POSITION ]
				then
					echo "player position is above 100"
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
echo "**Player reaches to the winning position :: $CurrentPosition**"
