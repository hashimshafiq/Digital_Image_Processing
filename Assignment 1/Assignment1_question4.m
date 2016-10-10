%Assignment 1
%Question 4

clc
clear all
close all

img = double(imread('cameraman.tif'));

[row,col] = size(img);

counter = zeros(1,256);

for r=1:row
    for c=1:col
        a=img(r,c);
        counter(1,a) = counter(1,a)+1; 
    end
    
end
plot(counter);










