img = imread('1.jpg');
I = rgb2gray(img);

N = 3;
kernel = ones(N,N);
kernel = kernel/(N^2);

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

figure(1);
set(gcf,'Position',get(0,'screensize'));
subplot(1,2,1),imshow(I),title('original');
subplot(1,2,2),imshow(out),title('mean blur');

