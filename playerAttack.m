% Player Attack 

% Initiailising variable
index = 1;
playerPoint = 0;
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
enemyPlane = imread("enemyPlane.png");
% Initialsing variable
playerViewScreen = [];
% Concatenating vectors for combining image.
playerViewScreen = [playerViewScreen player_plane V enemyPlane];
% Saving the image as player_view.png and displaying it.
imwrite(playerViewScreen,"playerViewScreen.png");
player_ViewScreen = imread("playerViewScreen.png");
player_ViewScreen = im2double(player_ViewScreen);
imshow(playerViewScreen);


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
enemyPlane = imread("enemyPlane.png");
% Initialising variable
playerViewScreen = [];
% Concatenating vectors for combining image.
playerViewScreen = [playerViewScreen player_plane V enemyPlane];
% Saving the image as player_view.png and displaying it.
imwrite(playerViewScreen,"playerViewScreen.png");
player_ViewScreen = imread("playerViewScreen.png");
player_ViewScreen = im2double(player_ViewScreen);
imshow(playerViewScreen);

% Condition for if the player has already hit the location.
  elseif (computerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 1 && computerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 1 && computerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 0) || ((computerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 1 && computerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 0 && computerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 0))
    fprintf("You already tried hitting this positon. Please try a different location.\n");
    colorRow = 0;
    colorColumn = 0;
  end
end 
