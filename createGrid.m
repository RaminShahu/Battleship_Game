function [ plane ] = createGrid()
% Creates a vector of size 110 x 110 with all entries one.
plane = ones(110,110,3,"double");
% The for loop paints the white image into blue.
for  i = 1:size(plane,1)
    % The nested loop is used to create black lines for grid.
    for j = 1:size(plane,2)
        plane(i,j,1) = 0;
        plane(i,j,2) = 1;
        plane(i,j,3) = 1;

        if mod(i,11)== 0 || mod(j,11)== 0  || i == 1 || j == 1
        plane(i,j,1) = 0 ;
        plane(i,j,2) = 0 ;
        plane(i,j,3) = 0 ;

        end 
    end 
end