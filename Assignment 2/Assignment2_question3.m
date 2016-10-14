%question 3

clc
clear all
close all

img = imread('cameraman.tif');
[row,col] = size(img);
img_new = zeros(row,col);
med_filter = zeros(3,3);
x=0;
y=0;
for r=2:row-1
    for c=2:col-1
        for i=1:3
            for j=1:3
                med_filter(i,j) = img(r+x-1,c+y-1);
                y = y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        med_filter = sort(med_filter);
        img_new(r,c) = med_filter(2,2);
    end
end

% test1 = medfilt2(img);

subplot(1,2,1),imshow(img),title('Original Image');
subplot(1,2,2),imshow(img_new,[]),title('Image After 3x3 Median Filter');
%subplot(1,3,3),imshow(test1),title('test image');