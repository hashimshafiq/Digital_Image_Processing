clc
clear global
close all

im = double(imread('cameraman.tif'));
[row,col] = size(im);

seg_img = zeros(row,col);

k=2;

cluster1 = [];
cluster2 = [];

c1_center = round(rand()*255);
c2_center = round(rand()*255);
c1 = 0;
c2 = 0;

while(c1~=c1_center && c2~=c2_center)
    for r=1:row
        for c=1:col
            x1 = round(sqrt((im(r,c)-c1_center)^2));
            x2 = round(sqrt((im(r,c)-c2_center)^2));
            if(x1 > x2)
                cluster2=im(r,c);
            else
                cluster1=im(r,c);
            end
        end
        
    end
    c1 = c1_center;
    c2 = c2_center;
    c1_center = mean(cluster1);
    c2_center = mean(cluster2);
end    
            
for r=1:row
    for c=1:col
        x1 = round(sqrt((im(r,c)-c1_center)^2));
        x2 = round(sqrt((im(r,c)-c2_center)^2));
        if(im(r,c) > 127)
            seg_img(r,c) = 1;
        %else
          %  seg_img(r,c) = 0;
        end
    end
end        

subplot(121);imshow(im,[]),impixelinfo,title('Original Image')
subplot(122);imshow(seg_img,[]),impixelinfo,title('Segmented Image')