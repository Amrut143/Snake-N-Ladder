#!/bin/bash

#@Author: Amrut
#Snake N Ladder Use Case 3

echo "******Welcome to SnakeNLadder Game******"

START_POSITION=0
NO_PLAY=0
SNAKE=1
LADDER=2

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

rollDice
echo "Position of the player is :: $CurrentPosition"
