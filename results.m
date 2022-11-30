function [] = results(playerScore,enemyScore)
  if playerScore > enemyScore
    winScreen = imread("youWin.png");
    fprintf("You win.\n");
    imshow(winScreen,'InitialMagnification','fit');
  elseif enemyScore > playerScore
    loseScreen = imread("Youlose.png");
    fprintf("You lose.\n");
    imshow(loseScreen,'InitialMagnification','fit');
  else 
    matchTieScreen = imread("tieGame.png");
    fprintf("The game got tied.\n");
    imshow(matchTieScreen,'InitialMagnification','fit');
  end 
end 
    

