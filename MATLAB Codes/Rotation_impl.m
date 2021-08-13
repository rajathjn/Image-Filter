img=imread('9.jpg'); 
img = rgb2gray(img);
figure(1);
imshow(img);
[rowsi,colsi]= size(img); 

angle=45;

rads=2*pi*angle/360;  
R = [cos(rads) -sin(rads); sin(rads) cos(rads)];
%calculating array dimesions such that  rotated image gets fit in it exactly.
%we are using absolute so that we get  positve value in any case ie.,any quadrant.
rowsf = ceil( rowsi*abs(cos(rads)) + colsi*abs(sin(rads)) );                      
colsf = ceil( rowsi*abs(sin(rads)) + colsi*abs(cos(rads)) );                     

% define an array withcalculated dimensionsand fill the array  with zeros ie.,black
C=uint8(zeros([rowsf colsf]));

%calculating center of original 
xo=ceil(rowsi/2);                                                            
yo=ceil(colsi/2);
%final image
midx=ceil(rowsf/2);
midy=ceil(colsf/2);

% in this loop we calculate corresponding coordinates of pixel of A 
% for each pixel of C, and its intensity will be  assigned after checking
% weather it lie in the bound of A (original image)
% Here we will be using inverse as we will be getting the co-ordinates of
% the new image from the old one

for i=1:rowsf
    for j=1:colsf
         cor = R \ [(i-midx) ; (j-midy)];                            
         x=round(cor(1))+xo;
         y=round(cor(2))+yo;
         if (x>=1 && y>=1 && x<=size(img,1) &&  y<=size(img,2) ) 
              C(i,j)=img(x,y);  
         end
    end
end

figure(2);
imshow(C);