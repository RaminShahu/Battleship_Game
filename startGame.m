function [] = startGame()
startGameCheck = false;
startGameImage = imread("startImage.png");
imshow(startGameImage,'InitialMagnification','fit');
 while ~(startGameCheck)
    Press = input("Press 's' to start the game: ","s");
    if strcmpi(Press,"s")
        startGameCheck = true;
    else 
        fprintf("Please press the enter key to start the game.\n")
    end 
 end 
fprintf("\n");
end 
