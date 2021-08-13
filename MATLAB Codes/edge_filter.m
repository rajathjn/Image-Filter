img = imread('5.jpg');

I = rgb2gray(img);

N = 5;
kernel = [-1 0 1; -N 0 N; -1 0 1];

[m,n] = size(I);
out = zeros(m,n);
Im = padarray(I,[1,1]);

imshow(img);
pause(1);
count=0;
 for i = 1:m
    for j =1:n
        temp = Im(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp .* kernel;
        out(i,j) = sum( conv(:) );
    end
    if mod(i,10) == 0
        cla reset
        imshow(uint8(out));
        drawnow;
        count=count+1;
    end
end
disp(count);
out = uint8(out);

figure(1);
set(gcf,'Position',get(0,'screensize'));
subplot(1,2,1),imshow(img),title('original');
subplot(1,2,2),imshow(out),title('Edge filter');

