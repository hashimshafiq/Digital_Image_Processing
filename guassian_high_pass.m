clc
clear global
close all


low = 50;
im = double(imread('cameraman.tif'));
transform=fftshift(fft2(im));
real_part=real(transform);



circle=zeros(size(im));
center=rows/2;
[rows,columns]=size(im);



for u=1:rows
    for v=1:columns
       circle(u,v)=   exp(-(sqrt((u-center).^2+(v-center).^2).^2/low^2));
    end
end
circle = 1 - circle;
new_fft=transform.*circle;


subplot(221);imshow(log2(real_part+1),[]);impixelinfo, title('fft')
subplot(222);imshow(circle,[]),impixelinfo, title('High Pass circle')
subplot(223);imshow(log2(new_fft+1),[]),impixelinfo, title('retained fft')
subplot(224);imshow(ifft2(fftshift(new_fft)),[]),impixelinfo, title('image from retained fft')
