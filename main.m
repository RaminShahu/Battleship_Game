% Setting all figures to be docked. The code below is sourced from: blogs.mathworks.com
set(0,'DefaultFigureWindowStyle','docked') 

% Rules of the game.

rules;

pause(3);

% Start game.

startGame;

% Displaying game started message.
fprintf("Game Started.\n");
fprintf("\n");

%Creating the a blue color 10 x 10 grid for player.

playerPlane = createGrid();

% Saves the image as playerplane and displays it.

playerPlaneImage = savePlane(playerPlane,"playerPlane.png",true);


%Ask the player for where to place the ship.

% Initialising variable.
colorRow = 0;
colorColumn = 0;
index1 = 1;

while index1 <= 10

 x = rowPlacement(index1);
 y = columnPlacement(index1);
 fprintf("\n");

 % Checking if the postion is already taken or not.
if colorCondtion(playerPlane,x,y,0.5,0.5,0.5)
    fprintf("A ship is already placed here. Please try a different location.\n")  
    fprintf("\n");

elseif ~(colorCondtion(playerPlane,x,y,0.5,0.5,0.5))
    % If the position is not taken the grid will be colored with grey
    % color.
    index1 = index1 + 1;

    colorRow = 10*(x-1) + x;

    colorColumn = 10*(y-1) + y;

    % Painting row's column to grey.
    playerPlane = colorGrid(playerPlane,colorRow,colorColumn,0.5,0.5,0.5);

    % Saves the images as player_plane and displays it. 
    playerPlaneImage = savePlane(playerPlane,"playerPlane.png",true);
end 

colorRow = 0;
colorColumn = 0;

end  

% Saves the images as player_plane and displays it. 
playerPlaneImage = savePlane(playerPlane,"playerPlane.png",true);

% Creating the a blue color 10 x 10 grid for enemy.

enemyPlane = createGrid();

% Saves the image as enemy_plane.

enemyPlaneImage = savePlane(enemyPlane,"enemyPlane.png",false);


% Creating the a blue color 10 x 10 grid for enemy's computer copy.
computerPlane = createGrid();

% Initialising variables.
colorRow = 0;
colorColumn = 0;
index2 = 1;

% Placing ships on the enemy's plane.
while index2 <= 10

  % Randomly generating row and column number for enemy's ship placement.
  x = randi([1,10],1,1);
  y = randi([1,10],1,1);  

  colorRow = 10*(x-1) + x;
  colorColumn = 10*(y-1) + y;

  if colorCondtion(computerPlane,x,y,0,1,1)
   index2 = index2 + 1;
   computerPlane = colorGrid(computerPlane,colorRow,colorColumn,0.5,0.5,0.5);
   computerPlaneImage = savePlane(computerPlane,"computerplane.png",false);
  end 
  colorRow = 0;
  colorColumn = 0;   
end 

computerPlaneImage = savePlane(computerPlane,"computerplane.png",false);



% Creates a image for seperation of player plane and enemy's plane.
seperationVector = ones(110,110,3,"double");
for  i = 1:size(seperationVector,1)
    for j = 1:size(seperationVector,2)
        seperationVector(i,j,1) = 1;
        seperationVector(i,j,2) = 1;
        seperationVector(i,j,3) = 1;

       if i == 110 || i == 1
        seperationVector(i,j,1) = 0 ;
        seperationVector(i,j,2) = 0 ;
        seperationVector(i,j,3) = 0 ;
       end 
    end
end 

% Saves the image as seperationImage.png
seperationImageVector = savePlane(seperationVector,"seperationImage.png",false);

pause(1);

% Displaying Screen.
displayScreen(playerPlaneImage,seperationImageVector,enemyPlaneImage);

% Player Attack.

% Display message for attack.

fprintf("It's time to attack now.\n");
fprintf("\n");
pause(1);
% Initialising variable 
x = 0;
y = 0;
index3 = 1;
index4 = 1;
playerPoints = 0;
enemyPoints = 0;
while index3 <= 10 && index4 <= 10
x = rowAttackPlacement(index3);
y = columnAttackPlacement(index3);
fprintf("\n");
checkPlayerAttack = true;
checkEnemyAttack = true;
 while checkPlayerAttack
   if colorCondtion(computerPlane,x,y,0.5,0.5,0.5)
    fprintf("Hit.\n");
    fprintf("\n");
    index3 = index3 + 1;
    checkPlayerAttack = false;
    colorRow = 10*(x-1) + x ;
    colorColumn = 10*(y-1) + y ;

    % Painting the color of grid in enemy_plane and computer_plane to red.
    enemyPlane = colorGrid(enemyPlane,colorRow,colorColumn,1,0,0);
    computerPlane= colorGrid(computerPlane,colorRow,colorColumn,1,0,0);
  

    
    colorRow = 0;
    colorColumn = 0;

    % Adding point to the player because it is a hit.
    playerPoints = playerPoints + 1;

    % Saves the image as enemy_plane.png
    enemyPlaneImage = savePlane(enemyPlane,"enemyPlane.png",false);
    computerPlaneImage = savePlane(computerPlane,"computerPlane.png",false);

    % Displaying Screen 
    displayScreen(playerPlaneImage,seperationImageVector,enemyPlaneImage);

   elseif colorCondtion(computerPlane,x,y,0,1,1)
    fprintf("Miss.\n");
    fprintf("\n");
    index3 = index3 + 1;
    colorRow = 10*(x-1) + x ;
    colorColumn = 10*(y-1) + y ;

    % Painting the color of grid in enemy_plane and computer_plane to red.
    enemyPlane = colorGrid(enemyPlane,colorRow,colorColumn,1,1,0);
    computerPlane= colorGrid(computerPlane,colorRow,colorColumn,1,1,0);
  
    
    colorRow = 0;
    colorColumn = 0;

    % Adding point to the player because it is a hit.

    checkPlayerAttack = false;

    % Saves the image as enemy_plane.png
    enemyPlaneImage = savePlane(enemyPlane,"enemyPlane.png",false);
    computerPlaneImage = savePlane(computerPlane,"computerPlane.png",false);

    % Displaying Screen 
    displayScreen(playerPlaneImage,seperationImageVector,enemyPlaneImage);
    elseif colorCondtion(computerPlane,x,y,1,1,0) || colorCondtion(computerPlane,x,y,1,0,0)
    fprintf("You already tried hitting this positon. Please try a different location.\n");
    fprintf("\n");
    colorRow = 0;
    colorColumn = 0;
    checkPlayerAttack = false;
    checkEnemyAttack = false;
   end 
 end 
 while checkEnemyAttack
     % Generating random values of row and column number for attacking the
      % player.
   x = randi([1,10],1,1);
   y = randi([1,10],1,1);
     if colorCondtion(playerPlane,x,y,0.5,0.5,0.5)
     fprintf("Waiting for enemy to attack.\n");
     pause(2);
     fprintf("\n");
     fprintf("Enemy hits you.\n");
     fprintf("\n");

     colorRow = 10*(x-1) + x ;
     colorColumn = 10*(y-1) + y ;

     %Painting the color of grid in player_plane to red.
     playerPlane = colorGrid(playerPlane,colorRow,colorColumn,1,0,0);
     index4 = index4 + 1;
     colorRow = 0;
     colorColumn = 0;
 
     %Adding point to the player because it is a hit.
      enemyPoints = enemyPoints + 1;
      checkEnemyAttack = false;

     %Saves the image as player_plane.png 
     playerPlaneImage = savePlane(playerPlane,"playerPlane.png",false);

     %Displaying Screen 
      displayScreen(playerPlaneImage,seperationImageVector,enemyPlaneImage);
     elseif colorCondtion(playerPlane,x,y,0,1,1)
     fprintf("Waiting for enemy to attack.\n");
     pause(2);
     fprintf("\n");  
     fprintf("Enemy misses you.\n");
     fprintf("\n");
     pause(1);
     colorRow = 10*(x-1) + x ;
     colorColumn = 10*(y-1) + y ;

   % Painting the color of grid in player_plane to yellow.
     playerPlane = colorGrid(playerPlane,colorRow,colorColumn,1,1,0);
 
    index4 = index4 + 1;
    colorRow = 0;
    colorColumn = 0;
    checkEnemyAttack = false;

   % Saves the image as player_plane.png 
    playerPlaneImage = savePlane(playerPlane,"playerPlane.png",false);

   % Displaying Screen.
    displayScreen(playerPlaneImage,seperationImageVector,enemyPlaneImage);

     end 
  end 
end 

% Saves the image as player_plane.png 
    playerPlaneImage = savePlane(playerPlane,"playerPlane.png",false);

   % Displaying Screen.
    displayScreen(playerPlaneImage,seperationImageVector,enemyPlaneImage);

% Displaying results.
pause(0.5);
fprintf("Game Over.\n");
fprintf("\n");
fprintf("Game Results.\n");
fprintf("\n");
fprintf("Your Points: %.0f and Enemy's Points: %.0f\n",playerPoints,enemyPoints);
pause(1);
results(playerPoints,enemyPoints);


