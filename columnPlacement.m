function [columnNumber] = columnPlacement(index)
columnNumber = 0;
 while ~(columnNumber > 0  && columnNumber <= 10 && mod(columnNumber,1) == 0)
  fprintf("Enter the column number for deployment of ship %.0f:",index);
  columnNumber = input(" ");
   if ~(columnNumber > 0  && columnNumber <= 10 && mod(columnNumber,1) == 0)
    fprintf("Please enter the value of column number as an integer between 1 to 10.\n");
   end 
 end 
end 