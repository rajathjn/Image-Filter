img = imread('text.jpg');
I = rgb2gray(img);

sigma = 25;
N = 5;
kernel = zeros(N,N);
W = 0;

for i = 1:N
    for j =1:N
        sq = (i-3)^2 + (j-3)^2;
        kernel(i,j) = (1/(2*pi*sigma^2))*exp(-1*sq/(2*sigma^2));
        W = W + kernel(i,j);
    end
end

kernel = kernel/W;
[m,n] = size(I);
out = zeros(m,n);
Im = padarray(I,[ floor(N/2) , floor(N/2) ]);

 for i = 1:m
    for j =1:n
        temp = Im(i:i+N-1, j:j+N-1);
        temp = double(temp);
        conv = temp .* kernel;
        out(i,j) = sum( conv(:) );
    end
end

out = uint8(out);
imwrite(out,'gauss.jpg');

figure(1);
set(gcf,'Position',get(0,'screensize'));
subplot(1,2,1),imshow(I),title('original');
subplot(1,2,2),imshow(out),title('gauss blur');

