clc
clear global
close all

%cutoff frequency for low pass
low  = 25;

im = double(imread('cameraman.tif'));

transform=fftshift(fft2(im));
real_part=real(transform);

[rows,columns ,depth]=size(im);

center=rows/2;
circle=zeros(size(im));

for u=1:rows
    for v=1:columns
           circle(u,v)=sqrt((u-center).^2+(v-center).^2);
    end
end

circle_low=circle<low;

%for low

new_fft=transform.*circle_low;


subplot(221);imshow(log2(real_part+1),[]);impixelinfo, title('fft of image');
subplot(222);imshow(circle_low,[]),impixelinfo, title('low pass circle');
subplot(223);imshow(log2(new_fft+1),[]),impixelinfo, title('retained fft from low pass');
subplot(224);imshow(ifft2(fftshift(new_fft)),[]),impixelinfo, title('image from low');




