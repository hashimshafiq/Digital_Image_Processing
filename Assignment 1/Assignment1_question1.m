% Assignment 1
% Question No1 
clc
close all
clear all
%reading imge
img = imread('tissue.png');
%seperating channels
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

%plotting
subplot(2,2,1),imshow(img),title('Original Image');
subplot(2,2,2),imshow(red),title('Red Plane');
subplot(2,2,3),imshow(green),title('Green Plane');
subplot(2,2,4),imshow(blue),title('Blue Plane');
