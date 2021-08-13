img = imread('10.jpg');
%I = rgb2gray(img);

kernel = imbinarize(rgb2gray(imread('hex_small.jpg')));
%kernel = double(rgb2gray(imread('circle_small.jpg')));
W = sum ( kernel(:) );
kernel = kernel/W;
disp(kernel);

[m,n,~] = size(img);
out = zeros(m,n);
Im = padarray(img,[ floor(size(kernel,1)/2), floor(size(kernel,2)/2)]);

imshow(img);
pause(2);

 for i = 1:m
    for j =1:n
        for k = 1:3
            temp = Im(i:i+size(kernel,1)-1, j:j+size(kernel,2)-1, k);
            temp = double(temp);
            conv = temp .* kernel;
            out(i,j,k) = sum( conv(:) );
        end
    end
end

out = uint8(out);

figure(1);
set(gcf,'Position',get(0,'screensize'));
subplot(1,2,1),imshow(img),title('original');
subplot(1,2,2),imshow(out),title('bokeh');

