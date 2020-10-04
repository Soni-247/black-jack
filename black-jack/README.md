# Black-Jack ReadMe Document

## R5 Purpose
Blackjack is a high-risk gambling card game. This card game is a high-risk game as the player is up against the dealer also known as the 'house.' The dealer shuffles and deals 2 cards to each player and two for themselves. All cards owned by the player is faced up whereas the dealer only shows the second card dealt with them. The remaining card is only flipped when all players are set to 'stand' with their hand. The objective of blackjack is to gain a hand that holds a larger value than the dealers without returning a value greater than 21. If the player has reached over 21, the hand is a 'bust' and the dealer wins the players chips from that round. Blackjack is set to put the players at an advantage as the only way the person can win is if they have a higher hand that is still within the value criteria. If both the player and dealer has bust, the dealer is still the winner. This narrows the win conditions for the player, having the only tie condition to be if the player's and dealer's hand are equal and not over 21.

This terminal app is to simulate a live game of Blackjack between the user and the computer. Through opening the app, the user will be prompted to declare the amount of money they are starting with as well as, how much is being per round against the computer. By making this simulation, any person who has an interest in playing Blackjack is able to gamble with a pretend currency without the risk of losing anything. If the player has won a round, the winning bet is returned to them. They may play again until they would like to quit or has lost their total amount of money.  Blackjack is a linear terminal app where the user will be guided with their options with messages from the computer and requesting the user to interact. 
## R6 Features of the App

The 'Black-Jack' terminal app will hold the following features.

- Game Calculator
Within the app, the user will be given the ability to declare their starting money amount. With the use of instance variables, the app will hold an attribute of the player's money (bank). The game calculator is a feature where the player's bank will keep updated after round and returned to the user to view how much is being won or lost after a game. The app will allow the user to continue to play until through a looped condition until they choose to quit or lose all they have brought to the table.

- Cards and deck operations
'Black-Jack' has the feature to simulate and display the cards that are being put into play. With the use of classes, a shuffled deck of all 52 cards is produced. All cards are produced from iterating through an array of suits with their respective attributes of values. From the 'Deck' class, the game can play with a `draw` method where a card instance is taken from the array from the shuffled deck.

- Input command
This terminal will use the 'tty - prompt' gem to provoke the user for input. The app will succeed in the way that it will provide an error message if invalid input is typed. The app will send a message to the user of the commands that are available to them at that point within the app. If the input does not match any of the commands, the app will loop with an error message to the user a chance to correct their spelling within the input to match the options provided. If the wrong data type is inputted by the user, the app will attempt to respond with a casting method to fix the data give to the expected input data type. With the use of tests, 'Black-Jack' will be able to take any form of input from the user and respond with the appropriate measures.

## R7 User interaction

Inside the 'Blackjack' app, the user's path is paved with options and output responses to their inputted data. The user is prompted to enter their name at the start to personalise their experience with the app until they exit. Once a name is set, an object is created of the user(player) and they are given two attributes. The user's name, and their `@bank` which is the amount of money the player has entered the game with. It is only after these attributes are defined, that an object is created for the game of blackjack. The user is presented with a displayed selection of options and the user is to navigate through them using the up or down arrowkeys and selecting the option with the enter key. Any other button pressed will not affect the movement of the game. The three options include: 'Hit'; 'DoubleDown'; and 'Stand'. While the game is in progress, the last card of the dealer and a cheatsheet table is displayed to player. The cheatsheet shows each card in the players hand using an iterator and `add_hand()` class method. This is displayed to help the player decide their next choice as it shows all their cards in their current hand, each of the cards values, and finally the total value for the hand and difference total from 21.

Selecting 'Hit' will draw and additional card to the user's hand. This will update the cheatsheet table for the user outputting 'Bust!' if the player has gone over 21. If this is the case, any additional option taken by the user will cause to stop recieving cards and 'Stand' to calulate their losses.

'Stand' will tell the game that the user is satisfied with the cards in their hand and call the object method for the game to calculate the total value of the players hand and reveal the dealers second card. If the total of the dealer is below 17, the dealer is forced to receive a card and stay once they have breached that threshold. From here the two hands are compared. The user is only able to win if they total value is greater than the dealer's, and is either less than or equal to 21. Other wise all other situations, the dealer is the winner. From here depending on the outcome of the game, the user is returned their winnings in respect to their bet or the bet is subtracted from the player's bank. However, if there is a tie, nothing is changed to the user's money.

'DoubleDown' is an option taken if the user is willing to gamble to recieve only one card before standing with any resulting value against the dealer. The significance is that the user is agreeing to double the size of the bet for that game. If the user does not have enough money to hold up a double-bet contract, the user will be displayed with an error message to inform that they do not have enough money to raise this bet and to select another option.

After every game, the bank of the player is updated and a prompt for input is displayed. If the player has any money left, the game will ask a yes or no question to see whether the player wishes to continue playing or else they will quit the app.

This app handles errors by looping the designated case of input from the user. By using the tty-promt gem, the app is able to set input requirements in the way that user must follow to continue through the app.

## R8 Flow Chart

![Blackjack Flow Chart](./blackjack_flow.pdf)


## R9 Implementation Plan

### Game Calculator
- Money, Bet system
- Gem Terminal Table
- Check Win Conditions
- Loop Game until user loses all money || quits

### Cards and deck operations
- Create cards to play
- Create cards to draw
- Implement second player

### Input command
- Gem tty prompt

## R10 Command line Argument

If an argument is passed when running the application, the argument will be taken as a string to stand as the name of the player as it run.

## Installation

- Install Black-Jack file
- Open file in code interpreter for RUBY
- Open terminal and input 'bundle install' to retrieve all neccessary gems to run the app
- Within terminal, input 'ruby black_jack.rb'


