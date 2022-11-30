function [] = rules()
% Printing the rules of the game.
fprintf("Please read the rules of the game before you start.\n");
fprintf("\n");
fprintf("As a player you will get a chance to place 20 ships on your grid.\n");
fprintf("You cannot place more than 1 ship at same location.\n");
fprintf("After placing the ship at specific location that location will become grey.\n");
fprintf("The row and column number for deploying the ships on your grid cannot be more than 10.\n");
fprintf("The left grid will be yours and right grid will be enemy's grid.\n");
fprintf("You will get 20 chance to attack at enemy's grid and enemy will also get 20 chance to attack your grid.\n");
fprintf("You cannot hit more than 1 time on a same location.\n");
fprintf("If you get hit by enemy or enemy hits you then that grid position will become red.\n");
fprintf("If you miss the chance to hit the enemy's ship or the enemy misses the chance to hit you then that grid position will become yellow.\n");
fprintf("Whoever gets the most amount of hits will win the game.\n");
fprintf("\n");
fprintf("\n");
fprintf("\n");
end 