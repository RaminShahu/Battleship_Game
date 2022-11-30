
% Enemy Attack
% Initialising a boolean operator.
checkEnemyAttack= true;
enemyPoints = 0;
while checkEnemyAttack
% Generating random values of row and column number for attacking the
% player.
 x = randi([1,10],1,1);
 y = randi([1,10],1,1);
% Condition for if the player's row's column number is grey.
  if playerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 0.5 && playerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 0.5 && playerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 0.5
    fprintf("Enemy hits you.\n");
    colorRow = 10*(x-1) + x ;
    colorColumn = 10*(y-1) + y ;
    for i = 1:10
      for j = 1:10
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,1) = 1;
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,2) = 0;
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,3) = 0;
      end 
   end 
 checkEnemyAttack = false;
 % Adding point to the player because it is a hit.
enemyPoints = enemyPoints + 1;

% Condition for if the player's row's column number is not grey.
 elseif playerPlane(10*(x-1) + x,10*(y-1) + y ,1) == 0 && playerPlane(10*(x-1) + x ,10*(y-1) + y ,2) == 1 && playerPlane(10*(x-1) + x ,10*(y-1) + y,3) == 1
     fprintf("Enemy misses you.\n");
     colorRow = 10*(x-1) + x ;
     colorColumn = 10*(y-1) + y ;
  for i = 1:10
     for j = 1:10
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,1) = 1;
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,2) = 1;
        playerPlane(colorRow + (i-1) ,colorColumn + (j-1) ,3) = 0;
     end 
  end 
 checkEnemyAttack = false;
 end 
colorRow = 0;
colorColumn = 0;
end 

