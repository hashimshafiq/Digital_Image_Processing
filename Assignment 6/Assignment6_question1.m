clear global
close all
clc
im = imread('cameraman.tif');
f_im = fft2(im);
Y = fftshift(f_im);
mag = abs(Y);
mag = log10(1+mag);
figure;
imshow(mag,[]);

reverse = ifft2(f_im);

figure;
imshow(reverse,[]);