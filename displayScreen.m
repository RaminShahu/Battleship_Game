function[] = displayScreen(playerPlane,sepeartionImageVector,enemyPlane)
% Initialising variable
playerViewScreen = [];
% Concatenating vectors for combining image.
playerViewScreen = [playerViewScreen playerPlane sepeartionImageVector enemyPlane];
% Saves the image as player_view.png and displays it.
imwrite(playerViewScreen,"playerViewScreen.png");
playerViewScreenImage = imread("playerViewScreen.png");
playerViewScreenImage = im2double(playerViewScreenImage);

% The code below is sourced from: https://au.mathworks.com/help/images/display-an-image-in-a-figure-window.html
imshow(playerViewScreen,'InitialMagnification','fit');
end 