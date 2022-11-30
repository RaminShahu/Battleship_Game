% Creates a vector of size 110 x 110 with all entries one.
playerPlane = ones(110,110);

% Creates a plane with 10 x 10 grid.

% Paints the grids to black color.
for  i = 1:size(playerPlane,1)
    for j = 1:size(playerPlane,2)
        if mod(i,11)== 0 || mod(j,11)== 0
        playerPlane(i,j) = 0;
        end 
    end 
end 

for i = 1:size(playerPlane,1)
    for j = 1:size(playerPlane,2)
        if i == 1 || j == 1
            playerPlane(i,j) = 0;
        end 
    end 
end 
% Saves the image as plane and displays it.
imwrite(playerPlane,"plane.png")
plane = imread("plane.png");
imshow(plane);




