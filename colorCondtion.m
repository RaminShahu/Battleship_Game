function[bool] = colorCondtion(matrix,x,y,shade1,shade2,shade3)
bool = false;
if matrix(10*(x-1) + x+1,10*(y-1) + y+1 ,1) == shade1 && matrix(10*(x-1) + x+1 ,10*(y-1) + y+1,2) == shade2 && matrix(10*(x-1) + x+1 ,10*(y-1) + y+1,3) == shade3
    bool = true;
end 
end 