dtmc

// used for Move your goose forward as many squares as the outcome of the rolled dice" squares
formula move_to_down = square - dice;
formula move_to_up = square + dice;
formula bounce_down = move_to_down < 0 ? 0 : move_to_down;
formula bounce_up = move_to_up > 63 ? 126 - move_to_up : move_to_up;

label "fiftytwo" = square = 52;
label "fiftytwo2" = square = 52;

module goose
	// current square of the game
	square: [0..63] init 0;
	// turns to wait, is not consistent.
	wait: [0..2] init 0;
	// rolled dice, used for the "Move your goose forward as many squares as the outcome of the rolled dice" squares
	dice: [2..12];
	
	[] square = 0 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;
	[] square = 1 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 2 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 3 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 4 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 5 -> 
		1 : (square' = bounce_down);

	[] square = 6 -> 
		1 : (square' = 12)  ;

	[] square = 7 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 8 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 9 -> 
		1 : (square' = bounce_down);

	[] square = 10 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 11 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 12 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 13 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 14 -> 
		1 : (square' = move_to_up);

	[] square = 15 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 16 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 17 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 18 & dice != 5 -> 
		1 : (square' = move_to_up);

	[] square = 18 & dice = 5 -> 
		1 : (square' = move_to_up) & (wait' =1);

	[] square = 19 & wait = 0 -> 
		1 : (wait' = 2) ;

	[] square = 19 & wait = 2 -> 
		1 : (wait' = 1) ;

	[] square = 19 & wait = 1 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  & (wait' = 0) +
		2/36 : (square' = square + 3) & (dice' = 3)  & (wait' = 0) +
		3/36 : (square' = square + 4) & (dice' = 4)  & (wait' = 0) +
		4/36 : (square' = square + 5) & (dice' = 5)  & (wait' = 0) +
		5/36 : (square' = square + 6) & (dice' = 6)  & (wait' = 0) +
		6/36 : (square' = square + 7) & (dice' = 7)  & (wait' = 0) +
		5/36 : (square' = square + 8) & (dice' = 8)  & (wait' = 0) +
		4/36 : (square' = square + 9) & (dice' = 9)  & (wait' = 0) +
		3/36 : (square' = square + 10) & (dice' = 10)  & (wait' = 0) +
		2/36 : (square' = square + 11) & (dice' = 11)  & (wait' = 0) +
		1/36 : (square' = square + 12) & (dice' = 12)  & (wait' = 0);

	[] square = 20 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 21 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 22 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 23 & wait = 1 -> 
		1 : (wait' = 0) ;

	[] square = 23 & wait = 0 -> 
		1 : (square' = bounce_down);

	[] square = 24 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 25 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 26 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 27 -> 
		1 : (square' = bounce_down);

	[] square = 28 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 29 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 30 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 31 -> 
		1/36 : (square' = square + 2) & (dice' = 2) +
		2/36 : (square' = square + 3) & (dice' = 3) +
		3/36 : (square' = square + 4) & (dice' = 4) +
		4/36 : (square' = square + 5) & (dice' = 5) +
		5/36 : (square' = square + 6) & (dice' = 6) +
		6/36 : (square' = square + 7) & (dice' = 7) +
		5/36 : (square' = square + 8) & (dice' = 8) +
		4/36 : (square' = square + 9) & (dice' = 9) +
		3/36 : (square' = square + 10) & (dice' = 10) +
		2/36 : (square' = square + 11) & (dice' = 11) +
		1/36 : (square' = square + 12) & (dice' = 12);

	[] square = 32 -> 
		1 : (square' = move_to_up);

	[] square = 33 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 34 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 35 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 36 -> 
		1 : (square' = move_to_up);

	[] square = 37 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 38 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 39 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 40 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 41 -> 
		1 : (square' = bounce_down);

	[] square = 42 -> 
		1 : (square' = 30) ;

	[] square = 43 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 44 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 45 -> 
		1 : (square' = bounce_down);

	[] square = 46 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 47 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 48 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 49 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 50 & dice != 4 -> 
		1 : (square' = move_to_up);

	[] square = 50 & dice = 4 -> 
		1 : (square' = move_to_up) & (wait' =1);

	[] square = 51 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10)  +
		2/36 : (square' = square + 11) & (dice' = 11)  +
		1/36 : (square' = square + 12) & (dice' = 12) ;

	[] square = 52 & wait = 0 -> 
		1 : (wait' = 2) ;

	[] square = 52 & wait = 2 -> 
		1 : (wait' = 1) ;

	[] square = 52 & wait = 1 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  & (wait' = 0) +
		2/36 : (square' = square + 3) & (dice' = 3)  & (wait' = 0) +
		3/36 : (square' = square + 4) & (dice' = 4)  & (wait' = 0) +
		4/36 : (square' = square + 5) & (dice' = 5)  & (wait' = 0) +
		5/36 : (square' = square + 6) & (dice' = 6)  & (wait' = 0) +
		6/36 : (square' = square + 7) & (dice' = 7)  & (wait' = 0) +
		5/36 : (square' = square + 8) & (dice' = 8)  & (wait' = 0) +
		4/36 : (square' = square + 9) & (dice' = 9)  & (wait' = 0) +
		4/36 : (square' = square + 10) & (dice' = 10)  & (wait' = 0) +
		2/36 : (square' = square + 11) & (dice' = 11)  & (wait' = 0);

	[] square = 53 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 9) & (dice' = 9)  +
		3/36 : (square' = square + 10) & (dice' = 10) +
		2/36 : (square' = square + 9) & (dice' = 11)  +
		1/36 : (square' = square + 8) & (dice' = 12)  ;

	[] square = 54 & wait = 1 -> 
		1 : (wait' = 0) ;

	[] square = 54 & wait = 0 -> 
		1 : (square' = bounce_down);

	[] square = 55 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 8) & (dice' = 8)  +
		4/36 : (square' = square + 7) & (dice' = 9)  +
		3/36 : (square' = square + 6) & (dice' = 10)  +
		2/36 : (square' = square + 5) & (dice' = 11)  +
		1/36 : (square' = square + 4) & (dice' = 12)  ;

	[] square = 56 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 7) & (dice' = 7)  +
		5/36 : (square' = square + 6) & (dice' = 8)  +
		4/36 : (square' = square + 5) & (dice' = 9)  +
		3/36 : (square' = square + 4) & (dice' = 10)  +
		2/36 : (square' = square + 3) & (dice' = 11)  +
		1/36 : (square' = square + 2) & (dice' = 12)  ;

	[] square = 57 -> 
		1/36 : (square' = square + 2) & (dice' = 2)  +
		2/36 : (square' = square + 3) & (dice' = 3)  +
		3/36 : (square' = square + 4) & (dice' = 4)  +
		4/36 : (square' = square + 5) & (dice' = 5)  +
		5/36 : (square' = square + 6) & (dice' = 6)  +
		6/36 : (square' = square + 5) & (dice' = 7)  +
		5/36 : (square' = square + 4) & (dice' = 8)  +
		4/36 : (square' = square + 3) & (dice' = 9)  +
		3/36 : (square' = square + 2) & (dice' = 10)  +
		2/36 : (square' = square + 1) & (dice' = 11)  +
		1/36 : (square' = square + 0) & (dice' = 12)  ;

	[] square = 58 -> 
		1 : (square' = 0) ;

	[] square = 59 -> 
		1 : (square' = bounce_up);

	[] square = 60 -> 
		1/36 : (square' = square + 2) & (dice' = 2) +
		2/36 : (square' = square + 3) & (dice' = 3) +
		3/36 : (square' = square + 2) & (dice' = 4) +
		4/36 : (square' = square + 1) & (dice' = 5) +
		5/36 : (square' = square + 0) & (dice' = 6) +
		6/36 : (square' = square - 1) & (dice' = 7) +
		5/36 : (square' = square - 2) & (dice' = 8) +
		4/36 : (square' = square - 3) & (dice' = 9) +
		3/36 : (square' = square - 4) & (dice' = 10) +
		2/36 : (square' = square - 5) & (dice' = 11) +
		1/36 : (square' = square - 6) & (dice' = 12);

	[] square = 61 -> 
		1/36 : (square' = square + 2) & (dice' = 2) +
		2/36 : (square' = square + 1) & (dice' = 3) +
		3/36 : (square' = square + 0) & (dice' = 4) +
		4/36 : (square' = square - 1) & (dice' = 5) +
		5/36 : (square' = square - 2) & (dice' = 6) +
		6/36 : (square' = square - 3) & (dice' = 7) +
		5/36 : (square' = square - 4) & (dice' = 8) +
		4/36 : (square' = square - 5) & (dice' = 9) +
		3/36 : (square' = square - 6) & (dice' = 10) +
		2/36 : (square' = square - 7) & (dice' = 11) +
		1/36 : (square' = square - 8) & (dice' = 12);

	[] square = 62 -> 
		1/36 : (square' = square + 0) & (dice' = 2) +
		2/36 : (square' = square - 1) & (dice' = 3) +
		3/36 : (square' = square - 2) & (dice' = 4) +
		4/36 : (square' = square - 3) & (dice' = 5) +
		5/36 : (square' = square - 4) & (dice' = 6) +
		6/36 : (square' = square - 5) & (dice' = 7) +
		5/36 : (square' = square - 6) & (dice' = 8) +
		4/36 : (square' = square - 7) & (dice' = 9) +
		3/36 : (square' = square - 8) & (dice' = 10) +
		2/36 : (square' = square - 9) & (dice' = 11) +
		1/36 : (square' = square - 10) & (dice' = 12);

	[] square = 63 -> 
        	1 : (square' = square);
endmodule