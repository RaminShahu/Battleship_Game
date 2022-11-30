set(0,'DefaultFigureWindowStyle','docked') 
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
% Saves the image as enemy_plane and displays it.
imwrite(enemyPlane,"enemyPlane.png")
enemyPlaneImage = imread("enemyPlane.png");
enemyPlaneImage = im2double(enemyPlaneImage);
imshow(enemyPlane,'InitialMagnification','fit');



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
 x = randi([1,10],1,1);
 y = randi([1,10],1,1);  
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
  computerPlaneImage = imread("computerPlane.png");
  computerPlaneImage = im2double(computerPlaneImage);
  imshow(computerPlane,'InitialMagnification','fit');
 end 
 colorRow = 0;
 colorColumn = 0;   
end 
imwrite(computerPlane,"computerPlane.png")
computerPlaneImage = imread("computerPlane.png");
computerPlaneImage= im2double(computerPlaneImage);
imshow(computerPlane,'InitialMagnification','fit');

