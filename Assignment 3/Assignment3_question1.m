clc
clear global
close all

im = double(imread('cameraman.tif'));
[row,col] = size(im);
new_img = zeros(row,col);

sobel_h = [-1 -2 -1;0 0 0;1 2 1];
sobel_v = [-1 0 1; -2 0 2;-1 0 1];

for r=2:row-1
    for c=2:col-1
        Gx = sum(sum(im(r-1:r+1,c-1:c+1).*sobel_h));
        Gy = sum(sum(im(r-1:r+1,c-1:c+1).*sobel_v));   
        Gx = round(sqrt(Gx*Gx));
        Gy = round(sqrt(Gy*Gy));
        G = (Gx+Gy);
        new_img(r,c) = G;
    end
end



for r=1:row
    for c=1:col
        if(new_img(r,c)<=127)
            new_img(r,c) = 0;
        else
            new_img(r,c) = 1;
        end
    end
end


subplot(121);imshow(im,[]),impixelinfo,title('Original Image');
subplot(122);imshow(new_img,[]),impixelinfo,title('Sobel Image');