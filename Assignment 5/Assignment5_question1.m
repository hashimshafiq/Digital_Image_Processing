% Haris Corner Detection

im = double(imread('cameraman.tif'));
sobel_x = [1 2 1; 
           0 0 0;
           -1 -2 -1
           ];
       
sobel_y = transpose(sobel_x);

Ix = conv2(im,sobel_x,'same');
Iy = conv2(im,sobel_y,'same');
Ixy = Ix .* Iy;
R = zeros(size(im));
k = 0.05;
for i=1:size(im,1)
    for j=1:size(im,1)
        M = [Ix(i,j).^2 Ixy(i,j);
             Ixy(i,j) Iy(i,j).^2  
            ];
        e = eig(M);
        det = e(1) * e(2);
        trace = e(1) + e(2);
        t = det - (k*(trace.^2));
        if(t<-100000000)
            R(i,j) =255;
        else
            R(i,j) = 0;
        end
    end
end
max(max(R))
new_img = zeros(size(R));

for r=1:size(R,1)
    for c=1:size(R,2)
        
        
    end
end

figure,imshow(R,[]);





        

