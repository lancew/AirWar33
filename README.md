# AirWar33

A simple game in Elm to my own education and entertainment.

Based on Air War in the book "100 strategic games for pen and paper" by Walter Joris.

Using create-elm-app to bootstrap.


## Start the app in dev with:
> elm-app start
![Board as of 20 October 2020](https://raw.githubusercontent.com/lancew/AirWar33/main/board-2.png)

## Rules

* Jet can move one space
  * Jet can move any direction
* Rocket can move 1 or 2
  * Rocket can only move straight
  * Rocket can NOT move diagonally
  * Rocket can jump over pieces and explosions
* One action per turn
  * Destroy neighbouring piece
  * Move
* One point per piece on the board
* Any non-destroyed piece can move 
  * When a piece moves, the old piece remains
* Play contines untill as many spaces are filled as possible
* If you lose all your pieces you lose
* Else winner is player with most pieces when board filled



## TODO (☐ ☑ ☒)
* ☐ Click to set a piece
    * ☐ Click on a piece to change it to the other type
* ☐ Click on a piece to "take" it.
* ☐ Disallow placing a piece where it does not belong
* ☐ Disallow clicking on pieces not added this turn
* ☑ Scoreboard
* ☐ Restart
* ☐ Play against an AI ?
* ☐ Play against online opponent
* ☐ Migrate to use an multi-dimensional-array structure (https://package.elm-lang.org/packages/tortus/elm-array-2d/latest/ maybe)

## Artifacts

### First draft game board
![Screenshot of initial game baord](https://raw.githubusercontent.com/lancew/AirWar33/main/board-1.png)

### Original Sketch of game board
![sketch of gameboard](https://raw.githubusercontent.com/lancew/AirWar33/main/design-1.png)