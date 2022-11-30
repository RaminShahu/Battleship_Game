function [rowNumber] = rowAttackPlacement(index)
rowNumber = 0;
 while ~(rowNumber > 0  && rowNumber <= 10 && mod(rowNumber,1) == 0)
  fprintf("Enter the row number for bomabarding enemy's ship %.0f:",index);
  rowNumber = input(" ");
   if ~(rowNumber > 0  && rowNumber <= 10 && mod(rowNumber,1) == 0)
    fprintf("Please enter the value of row number as an integer between 1 to 10.\n");
   end 
 end 
end 