function [matrix] = colorGrid(matrix,colorRow,colorColumn,shade1,shade2,shade3)
 for i = 1:10
      for j = 1:10
        matrix(colorRow + (i-1) ,colorColumn + (j-1) ,1) = shade1;
        matrix(colorRow + (i-1) ,colorColumn + (j-1) ,2) = shade2;
        matrix(colorRow + (i-1) ,colorColumn + (j-1) ,3) = shade3;
      end 
 end  
end