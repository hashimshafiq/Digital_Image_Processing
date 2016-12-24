clc
close all
clear global
k = 0.04;
Threshold = 50000;
sigma = 1;
halfwid = sigma * 3;
[xx, yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);
Gxy = exp(-(xx .^ 2 + yy .^ 2) / (2 * sigma ^ 2));
Gx = xx .* exp(-(xx .^ 2 + yy .^ 2) / (2 * sigma ^ 2));
Gy = yy .* exp(-(xx .^ 2 + yy .^ 2) / (2 * sigma ^ 2));
I = imread('cameraman.tif');
numOfRows = size(I, 1);
numOfColumns = size(I, 2);
Ix = conv2(Gx, I);
Iy = conv2(Gy, I);
size(Ix)
Ix2 = Ix .^ 2;
Iy2 = Iy .^ 2;
Ixy = Ix .* Iy;
Sx2 = conv2(Gxy, Ix2);
Sy2 = conv2(Gxy, Iy2);
Sxy = conv2(Gxy, Ixy);
im = zeros(numOfRows, numOfColumns);
for x=1:numOfRows
    for y=1:numOfColumns
        H = [Sx2(x, y) Sxy(x, y); Sxy(x, y) Sy2(x, y)];
        R = det(H) - k * (trace(H) ^ 2);
        if (R > Threshold)
        im(x, y) = R; 
        end
    end
end
output = im > imdilate(im, [1 1 1; 1 0 1; 1 1 1]);
figure, imshow(I);
figure, imshow(output)

max_val = max(max(output));
for i=1:size(output,1)
    for j=1:size(output,2)
        if max_val==output(i,j)
            i_max = i;
            j_max = j;
            break;
            
        end
    end 
end


my = zeros(size(output));
my(i_max,j_max) = 1;
figure, imshow(my,[]);

figure,imshow(I,[]);
