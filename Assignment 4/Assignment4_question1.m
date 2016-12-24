clc
clear global
close all

img = double(imread('cameraman.tif'));
[row,col] = size(img);
I = edge(img,'canny');
[M,N] = size(I);

r_min = round(-sqrt(M^2+N^2));
r_min = abs(r_min)+1;
r_max = r_min + round(sqrt(M^2+N^2));

A = zeros(180,r_max);

for x=1:M
    for y=1:N
        if I(x,y)==1
            for t=1:180
                r = x*cos(deg2rad(t))+y*sin(deg2rad(t));
                r = round(r);
                if r>0
                    A(t,r+r_min) = A(t,r+r_min)+1;
                end
            end
        end
    end
end

imshow(A,[]);
t1 = zeros(3,1);
r1 = zeros(3,1);


count =1;
while count<=3
    max_A = max(max(A));
    for i=1:size(A,1)
        for j=1:size(A,2)
            if A(i,j) == max_A
                t1(count,1)=i;
                r1(count,1) = j-r_min;
                A(i,j) = 0;
            end
        end
    end
    count = count+1;
end


for p=1:3
    x=0:max(M,N);
    y=round((r1(p,1)-x*cos(deg2rad(t1(p,1))))/sin(deg2rad(t1(p,1))));
    figure,imshow(I,[]);
    hold on;
    plot(y,x,'r');
end

    