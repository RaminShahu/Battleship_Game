% Creates a vector for seperating player and enemy's plane
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
% Saves the image as white.png
imwrite(seperationVector,"seperationImage.png");
seperationImageVector = imread("seperationImage.png");