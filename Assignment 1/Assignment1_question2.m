%Assignment 1
%Question 2

clear all
close all
clc

c  = zeros(300,300);
c(:,:) = 255;
for x =1 :300
    for y =1 :300
        r = (x-150)*(x-150) + (y-150)*(y-150);
        r = sqrt(r);
        r = uint8(r);
        if(r==100)
            c(x,y) = 0;
         end
    end
end

figure; imshow(c);
