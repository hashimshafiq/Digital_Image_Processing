%Question 2

clc
close all
clear all

img = imread('cameraman.tif');
[row,col] = size(img);

filter3x3 = ones(3,3)/9;
filter5x5 = ones(5,5)/25;

%leave the first row and first column because filter does not fit 
%%-------------------3x3 Filter Code-----------------------------------%
sum=0;
x=0;
y=0;
img_new = zeros(row,col);
for r=2:row-1
    for c=2:col-1
        
        for fr=1:3
            for fc=1:3
                sum = sum + img(r+x-1,c+y-1)*filter3x3(fr,fc);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        img_new(r,c) = sum;
        sum=0;
    end
end
%%-------------------------End of 3x3 Filter-----------------------------%

%%---------------------5x5 Filter Code-----------------------------------%%
sum=0;
x=0;
y=0;
img_new1 = zeros(row,col);
for r=3:row-2
    for c=3:col-2
        
        for fr=1:5
            for fc=1:5
                sum = sum + img(r+x-2,c+y-2)*filter5x5(fr,fc);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        img_new1(r,c) = sum;
        sum=0;
    end
end
%---------------------------End of 5x5 Filter----------------------%%

subplot(1,3,1),imshow(img),title('Original Image');
subplot(1,3,2),imshow(img_new,[]),title('3x3 Filter Applied');
subplot(1,3,3),imshow(img_new1,[]),title('5x5 Filter Applied');

