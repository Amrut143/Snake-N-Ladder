#!/bin/bash -x

#@Author: Amrut
#Snake N Ladder Use Case 4

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
		checkDice=$(( RANDOM % 6 + 1 ))
		ranCheck=$(( RANDOM % 3 ))

		case $ranCheck in
		$NO_PLAY)
				CurrentPosition=$(( CurrentPosition + $NO_PLAY ))
				;;
		$SNAKE)
				CurrentPosition=$(( CurrentPosition - checkDice ))
				;;
		$LADDER)
				CurrentPosition=$(( CurrentPosition + checkDice ))
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
					CurrentPosition=0
					echo "restart"
			fi
		done
}

winningPosition
echo "Position of the player is :: $CurrentPosition"
