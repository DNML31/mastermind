# mastermind
TOP Mastermind project

Taken from:
https://www.theodinproject.com/lessons/ruby-mastermind

If you’ve never played Mastermind, a game where you have to guess your opponent’s secret code within a certain number of turns (like hangman with colored pegs), 
check it out on Wikipedia. Each turn you get some feedback about how good your 
guess was – whether it was exactly correct or just the correct color but in the wrong space.

Build a Mastermind game from the command line where you have 12 turns to guess 
the secret code, starting with you guessing the computer’s random code.

******

*This version of mastermind will be closer to Wordle.

4-digit code using numbers 1-6.
Total of 12 guesses to get the correct 4-digit code.
A clue is given after every guess to help figure out the code.
The game is over if the code is matched or when turns run out.

Clues are in XXXX format.
	*An ‘X’ indicates a wrong number in that spot.
	*An ‘O’ indicates a correct number in the correct spot.
	*An ‘E’ indicates the number is correct BUT in the wrong spot.

Example:

If the 4-digit code is 1253 and the first guess is 1452…
The clue is OXOE.
If the second guess is 1245…
The clue is OOXE.