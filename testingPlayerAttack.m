set(0,'DefaultFigureWindowStyle','docked') 
% Creating the a blue color 10 x 10 grid for player.

% Creates a vector of size 110 x 110 with all entries one.

playerPlane = ones(110,110,3,"double");

% The for loop paints the white image into blue.
for  i = 1:size(playerPlane,1)
    % The nested loop is used to create black lines for grid.
    for j = 1:size(playerPlane,2)
        playerPlane(i,j,1) = 0;
        playerPlane(i,j,2) = 1;
        playerPlane(i,j,3) = 1;

        if mod(i,11)== 0 || mod(j,11)== 0  || i == 1 || j == 1
        playerPlane(i,j,1) = 0 ;
        playerPlane(i,j,2) = 0 ;
        playerPlane(i,j,3) = 0 ;
        end 
    end 
end 

% Saves the image as player_plane and displays it.
imwrite(playerPlane,"playerPlane.png")
playerPlaneImage = imread("playerPlane.png");
playerPlaneImage = im2double(playerPlaneImage);
imshow(playerPlane,'InitialMagnification','fit');

% Creating the a blue color 10 x 10 grid for enemy.
% Creates a vector of size 110 x 110 with all entries one.

enemyPlane = ones(110,110,3,"double");
% The for loop paints the white image into blue.
for  i = 1:size(enemyPlane,1)
    % The nested loop is used to create black lines for grid.
    for j = 1:size(enemyPlane,2)
        enemyPlane(i,j,1) = 0;
        enemyPlane(i,j,2) = 1;
        enemyPlane(i,j,3) = 1;

        if mod(i,11)== 0 || mod(j,11)== 0  || i == 1 || j == 1
        enemyPlane(i,j,1) = 0 ;
        enemyPlane(i,j,2) = 0 ;
        enemyPlane(i,j,3) = 0 ;
        end 
    end 
end 
% Saves the image as enemy_plane.
imwrite(enemyPlane,"enemyPlane.png")
enemyPlaneImage = imread("enemyPlane.png");
enemyPlaneImage= im2double(enemyPlaneImage);


% Creates a vector V
SeperationVector = ones(110,110,3,"double");
for  i = 1:size(SeperationVector,1)
    for j = 1:size(SeperationVector,2)
        SeperationVector(i,j,1) = 1;
        SeperationVector(i,j,2) = 1;
        SeperationVector(i,j,3) = 1;

       if i == 110 || i == 1
        SeperationVector(i,j,1) = 0 ;
        SeperationVector(i,j,2) = 0 ;
        SeperationVector(i,j,3) = 0 ;
       end 
    end
end 
% Saves the image as white.png
imwrite(SeperationVector,"seperationImage.png");
SeperationImageVector = imread("seperationImage.png");
SeperationImageVector = im2double(SeperationImageVector);


%Ask the player for where to place the ship
colorRow = 0;
colorColumn = 0;
index = 1;
while index <= 5  
 x = rowPlacement(index);
 y = columnPlacement(index);
 % Checking if the postion is already taken or not
if playerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 0.5 && playerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 0.5 && playerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 0.5
    fprintf("A ship is already placed here. Please try a different location.\n")     
elseif playerPlane(10*(x-1) + x,10*(y-1) + y ,1) ~= 0.5 && playerPlane(10*(x-1) + x ,10*(y-1) + y ,2) ~= 0.5 && playerPlane(10*(x-1) + x ,10*(y-1) + y,3) ~= 0.5
    % If the position is not taken the grid will be colored with grey
    % color.
    index = index + 1;
    colorRow = 10*(x-1) + x;
    colorColumn = 10*(y-1) + y;
    % Painting the color to grey.
    for i = 1:10
      for j = 1:10
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,1) = 0.5;
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,2) = 0.5;
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,3) = 0.5;
      end 
    end  
    % Saves the images as player_plane and displays it. 
    imwrite(playerPlane,"playerPlane.png");
    playerPlaneImage = imread("playerPlane.png");
    playerPlaneImage = im2double(playerPlaneImage);
    imshow(playerPlane,'InitialMagnification','fit');
end 
colorRow = 0;
colorColumn = 0;
end  
% Initialising variable
playerViewScreen = [];
% Concatenating vectors for combining image.
playerViewScreen = [playerViewScreen playerPlane SeperationVector enemyPlane];
% Saves the image as player_view.png and displays it.
imwrite(playerViewScreen,"playerViewScreen.png");
playerViewScreenImage = imread("playerViewScreen.png");
playerViewScreenImage = im2double(playerViewScreenImage);
imshow(playerViewScreen,'InitialMagnification','fit');

% Creating the a blue color 10 x 10 grid for enemy's computer copy.

% Creates a vector of size 110 x 110 with all entries one.

computerPlane = ones(110,110,3,"double");
% The for loop paints the white image into blue.
for  i = 1:size(computerPlane,1)
    % The nested loop is used to create black lines for grid.
    for j = 1:size(computerPlane,2)
        computerPlane(i,j,1) = 0;
        computerPlane(i,j,2) = 1;
        computerPlane(i,j,3) = 1;

        if mod(i,11)== 0 || mod(j,11)== 0  || i == 1 || j == 1
        computerPlane(i,j,1) = 0 ;
        computerPlane(i,j,2) = 0 ;
        computerPlane(i,j,3) = 0 ;
        end 
    end 
end

% Initialising variables
colorRow = 0;
colorColumn = 0;
index = 1;

while index <= 20
 % Randomly generating a vector for enemy's ship placement.
 x = randi(randi([1,10],1,1));
 y = randi(randi([1,10]),1,1);  
 colorRow = 11*(x-1);
 colorColumn = 11*(y-1);
 if computerPlane(11*(x-1) + (x+1) ,11*(y-1) + (y+1) ,1) == 0 && computerPlane(11*(x-1) + (x+1) ,11*(y-1) + (y+1) ,2) == 1 && computerPlane(11*(x-1) + (x+1) ,11*(y-1) + (y+1),3) == 1  
   index = index + 1;
  for i = 1:10
     for j = 1:10
          computerPlane(colorRow + (i),colorColumn + (j),1) = 0.5;
          computerPlane(colorRow + (i),colorColumn + (j) ,2) = 0.5;
          computerPlane(colorRow + (i) ,colorColumn + (j),3) = 0.5;
     end 
  end
  imwrite(computerPlane,"computerPlane.png")
  computer_Plane = imread("computerPlane.png");
  computer_Plane = im2double(computer_Plane);
  
 end 
 colorRow = 0;
 colorColumn = 0;   
end 
imwrite(computerPlane,"computerPlane.png")
computer_Plane = imread("computerPlane.png");
computer_Plane= im2double(computer_Plane);



% Player Attack 

% Initiailising variable
index = 1;
playerPoints = 0;
while index <= 15 

% Asking the user for input of where to attack.
 x = rowAttackPlacement(index);
 y = columnAttackPlacement(index);

% Condition for if the enemy's row's column number is grey.
  if computerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 0.5 && computerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 0.5 && computerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 0.5
    fprintf("Hit.\n")
 colorRow = 10*(x-1) + x ;
 colorColumn = 10*(y-1) + y ;
 for i = 1:10
     for j = 1:10
        enemyPlane(colorRow + (i-1) ,colorColumn + (j-1) ,1) = 1;
        enemyPlane(colorRow + (i-1) ,colorColumn + (j-1) ,2) = 0;
        enemyPlane(colorRow + (i-1) ,colorColumn + (j-1) ,3) = 0;
        computerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,1) = 1;
        computerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,2) = 0;
        computerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,3) = 0;
     end 
 end 

index = index+ 1;
% Adding point to the player because it is a hit.
playerPoints = playerPoints + 1;
% Saving image of enemy plane as enemy_plane.png.
imwrite(enemyPlane,"enemyPlane.png")
enemyPlaneImage = imread("enemyPlane.png");
% Initialsing variable
playerViewScreen = [];
% Concatenating vectors for combining image.
playerViewScreen = [playerViewScreen playerPlane SeperationVector enemyPlane];
% Saving the image as player_view.png and displaying it.
imwrite(playerViewScreen,"playerViewScreen.png");
playerViewScreenImage = imread("playerViewScreen.png");
playerViewScreenImage = im2double(playerViewScreenImage);
imshow(playerViewScreen,'InitialMagnification','fit');

% Condition for if the enemy's row's column number is not grey.
  elseif computerPlane(10*(x-1) + x+1,10*(y-1) + y+1 ,1) == 0 && computerPlane(10*(x-1) + x+1 ,10*(y-1) + y+1 ,2) == 1 && computerPlane(10*(x-1) + x+1 ,10*(y-1) + y+1,3) == 1 
    colorRow = 10*(x-1) + x ;
    colorColumn = 10*(y-1) + y ;
    fprintf("Miss\n");
    for i = 1:10
     for j = 1:10
        enemyPlane(colorRow + (i-1) ,colorColumn + (j-1) ,1) = 1;
        enemyPlane(colorRow + (i-1) ,colorColumn + (j-1) ,2) = 1;
        enemyPlane(colorRow + (i-1) ,colorColumn + (j-1) ,3) = 0;
        computerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,1) = 1;
        computerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,2) = 1;
        computerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,3) = 0;
     end 
    end 
index = index + 1;
% Saving image of enemy plane as enemy_plane.png.
imwrite(enemyPlane,"enemyPlane.png")
enemyPlaneImage = imread("enemyPlane.png");
% Initialsing variable
playerViewScreen = [];
% Concatenating vectors for combining image.
playerViewScreen = [playerViewScreen playerPlane SeperationVector enemyPlane];
% Saving the image as player_view.png and displaying it.
imwrite(playerViewScreen,"playerViewScreen.png");
playerViewScreenImage = imread("playerViewScreen.png");
playerViewScreenImage = im2double(playerViewScreenImage);
imshow(playerViewScreen,'InitialMagnification','fit');


% Condition for if the player has already hit the location.
  elseif (computerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 1 && computerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 1 && computerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 0) || ((computerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 1 && computerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 0 && computerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 0))
    fprintf("You already tried hitting this positon. Please try a different location.\n");
    colorRow = 0;
    colorColumn = 0;
  end
end 

