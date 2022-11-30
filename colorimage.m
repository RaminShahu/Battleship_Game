image=zeros(300,400,3); %initialize
 image(:,1:100,1)=0.5;   %Red (dark red)
 image(:,101:200,1)=1;   %Red (maximum value)
 image(1:100,:,2)=rand(100,400);  %Green
 figure, imshow(image)