

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
    imshow(playerPlaneImage,'InitialMagnification','fit');
end 
colorRow = 0;
colorColumn = 0;
end  
% Initialising variable
playerViewScreen = [];
% Concatenating vectors for combining image.
playerViewScreen = [playerViewScreen playerPlaneImage SeperationVector enemy_plane];
% Saves the image as player_view.png and displays it.
imwrite(playerViewScreen,"playerViewScreen.png");
playerViewScreenImage = imread("playerViewScreen.png");
playerViewScreenImage = im2double(playerViewScreenImage);
imshow(playerViewScreen,'InitialMagnification','fit');




