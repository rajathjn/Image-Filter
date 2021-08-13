img = imread('5.jpg');
I = rgb2gray(img);
%I = imbinarize(rgb2gray(img),0.6);
[m,n] = size(I);
N = 3;

minf = @(x) min(x(:));
maxf = @(x) max(x(:));
medianf = @(x) median(x(:));

out = zeros(m,n);

set(gcf,'Position',get(0,'screensize'));
subplot(2,2,1);
imshow(I);
title('original');

for i = 1:(m-N)
    for j =1:(n-N)
        temp = minf( I(i:i+N, j:j+N));
        out(i,j) = temp;
    end
end
out = uint8(out);
subplot(2,2,2);
imshow(out);
title('min filter (darken)');

for i = 1:(m-N)
    for j =1:(n-N)
        temp = maxf( I(i:i+N, j:j+N));
        out(i,j) = temp;
    end
end
out = uint8(out);
subplot(2,2,3);
imshow(out);
title('max filter (lighten)');

for i = 1:(m-N)
    for j =1:(n-N)
        temp = medianf( I(i:i+N, j:j+N));
        out(i,j) = temp;
    end
end
out = uint8(out);
subplot(2,2,4);
imshow(out);
title('median filter (smoother)');
