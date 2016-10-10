%Assignment 1
%Question 3

clc
clear all
close all

img = double(imread('cameraman.tif'));
[row,col] = size(img);
row= row/2;
col=col/2;
img_new = zeros(row,col);
for r=1:1:256
    for c=1:1:256
        img_new(round(r/2),round(c/2)) = img(r,c);
    end
end

row=row/2;
col=col/2;
img_new1 = zeros(row,col);
for r=1:1:128
    for c=1:1:128
        img_new1(round(r/2),round(c/2)) = img_new(r,c);
    end
end

img_new = uint8(img_new);
img_new1 = uint8(img_new1);

imwrite(img_new,'128x128.jpg','jpg');
imwrite(img_new1,'64x64.jpg','jpg');

subplot(1,3,1),imshow(img,[]),title('Original Image');
subplot(1,3,2),imshow(img_new),title('Image Size 1/2');
subplot(1,3,3),imshow(img_new1),title('Image Size 1/4');