function [plane] = savePlane(matrix,imagename,bool)

imwrite(matrix,imagename)
plane = imread(imagename);
plane = im2double(plane);

if bool == true
%The code below is sourced from: https://au.mathworks.com/help/images/display-an-image-in-a-figure-window.html
    imshow(plane,'InitialMagnification','fit');
end 
end
