tic
psf=fspecial('gaussian',3,3);
toc
%NOTE:
%Choice of 'k' or the no. of eigen values and the corresponding eigen
%vectors u select (or the sizes of U,V,S) determine ur output..
%Generally the noise components are a part of the smaller eigen values .
%Choice of 'k' can be obtained from the graph ... 
%This method doesn't provide a 100% accuracy all the time 


%Uncomment one of the 3 images..
%'k' for 1st image is .....
%'k' for 2nd image is around 520 to 580
%'k' for 3rd image is 83

%X=(imread('cameraman.tif'));
X=uint8([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80;160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160;200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200;255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80;160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160;200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200;255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80;160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160;200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200;255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80;160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160;200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200]);
%X=imread('blur.jpg');
%X=rgb2gray(X);

[m,n]=size(X);

figure(1);
imshow(X);
X=double(X);

%t=imfilter(X,psf);
%t=uint8(t);
%figure(2);
%imshow(t);

A=convmtx2(psf,m,n);
b=A*X(:);
b=reshape(b,size(psf)+[m n]-1);
b=uint8(b);
figure(3);
imshow(b);
b=imnoise(b,'gaussian');
figure(4);
imshow(b);

k=83;
toc
[U, S, V]=svds(A,k);
s=diag(S);
toc
%for determinig Alpha
i= 1:k;
b=b(:);
b=double(b);
figure(5);
plot(i,log10(abs(U'*b ./s)),'c*',i,log10(abs(U'*b)),'b*',i,s,'r');

%trying to remove noise

Xsvd=V*(U'*b ./s);
Xsvd=reshape(Xsvd,m,n);
Xsvd=uint8(Xsvd);

figure(6);
imshow(Xsvd);
toc
