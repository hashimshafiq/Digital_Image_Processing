%Question1
clc
close all
clear all
img = imread('cameraman.tif');

[row,col] = size(img);
total_size = row*col;
hist = zeros(1,256);

for r=1:row
    for c=1:col
        a = img(r,c);
        hist(1,a) = hist(1,a)+1;
    end
end

pdf = zeros(1,256);
pdf(:,:) = hist(:,:)./total_size;



cdf = zeros(1,256);
cdf(1,1) = pdf(1,1);
for i=2:256
    cdf(1,i) = cdf(1,i-1)+pdf(1,i);
end

img_new = zeros(row,col);
for r=1:row
    for c=1:col
        img_new(r,c) = cdf(1,img(r,c));
    end
end

% figure,plot(hist);
% figure,plot(pdf);
% figure,plot(cdf);
subplot(1,2,1),imshow(img),title('Original Image');
subplot(1,2,2),imshow(img_new),title('Histogram Equilized Image');







