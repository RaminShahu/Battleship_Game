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
        playerPlane(i,j,1) = 0;
        playerPlane(i,j,2) = 0;
        playerPlane(i,j,3) = 0;

        end 
    end 
end 

% Saves the image as player_plane and displays it.
imwrite(playerPlane,"playerPlane.png")
playerPlaneImage = imread("playerPlane.png");
imshow(playerPlane);

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
    % Painting row's column to grey.
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
    imshow(playerPlane);
end 
colorRow = 0;
colorColumn = 0;
end  
% Saves the images as player_plane and displays it. 
imwrite(playerPlane,"playerPlane.png");
playerPlaneImage = imread("playerPlane.png");
imshow(playerPlane);
