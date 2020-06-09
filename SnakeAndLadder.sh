#!/bin/bash

#@Author: Amrut
#Snake N Ladder Use Case 2

echo "******Welcome to SnakeNLadder Game******"

player=1
StartPosition=0

function rollDice() {
		checkDice=$(( RANDOM % 6 + 1 ))
}

rollDice
echo "Dice Number is : $checkDice"
