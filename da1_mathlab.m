%histogram
i = imread('abi.jpg.jpeg'); 
ih = histeq(i); 
subplot(2,2,1), imshow(i), title('Original Image'); 
subplot(2,2,2), imshow(ih), title('Histogram Equalized Image'); 
subplot(2,2,3), imhist(i), title('Histogram of Original Image'); 
subplot(2,2,4), imhist(ih), title('Histogram of Equalized Image'); 



%image enhancement 
clear; 
close all; 
I = imread('abi.jpg.jpeg'); 
subplot(2, 3, 1); 
imshow(I); 
se = strel('disk', 15); 
Background = imopen(I, se); 
subplot(2, 3, 2); 
imshow(Background); 
enhancedI = I - Background; 
subplot(2, 3, 3); 
imshow(enhancedI); 
J = imadjust(rgb2gray(I)); 
subplot(2, 3, 4); 
imshow(J);  
IJ = imnoise(J, 'gaussian', 0, 0.0001); 
subplot(2, 3, 5); 
imshow(IJ);


%morphological filtering 
x=imread('abi.jpg.jpeg'); 
imshow(x); 
title('Original Image'); 
se=ones(3,3); 
I=imnoise(x,'salt & pepper',0.5); 
figure; 
imshow(I); 
title('Image with Salt & Pepper Noise'); 
figure; 
imshow(imclose(imopen(x,se),se)); 
title('Morphologically Filtered Image'); 


%contrast adjustment
clc 
clear 
close all 
A = imread('abi.jpg.jpeg'); 
B = A*1.5; 
subplot(1, 2, 1); 
imshow(A); 
title('Original Image'); 
subplot(1, 2, 2); 
imshow(B); 
title('Image after Contrast Adjustment'); 


%unsharp masking
x=imread('abi.jpg.jpeg'); 
figure; 
imshow(x); 
title('Original Image'); 
I_sharpen=imsharpen(x,'amount',3); 
figure; 
imshow(I_sharpen); 
title('Sharpened Image');


%decorrelation stretch 
clc 
clear 
close all 
I = imread('abi.jpg.jpeg'); 
S = imadjust(I,stretchlim(I)); 
subplot(2,2,1); 
imshow(I); 
title('Original Image'); 
subplot(2,2,2); 
imshow(S); 
title('Contrast Stretched Image'); 
subplot(2,2,3); 
imhist(I); 
title('Histogram of Original Image'); 
subplot(2,2,4); 
imhist(S); 
title('Histogram of Decorrelation Stretched Image'); 


%linear contrast adjustment 
i = imread('abi.jpg.jpeg');
i = rgb2gray(i);
[rows,columns] = size(i);
o = zeros(rows,columns);
x1 = double(min(min(i)));
x2 = double(max(max(i)));
y1 = double(0);
y2 = double(255);
m= (y2-y1)/(x2-x1);
c = y1-m*x1;
for k = 1:rows
for j = 1:columns
o(k,j)=m*i(k,j)+c;
end
end
figure(1)
imshow(i)
figure(2)
imshow(uint8(o))
title('Adjusted Image');


%CLAHE
clc 
clear 
close all 
I = imread('abi.jpg.jpeg'); 
M = rgb2lab(I); 
H = histeq(I); 
L = M(:,:,1)/100; 
L = adapthisteq(L,'NumTiles',[8 8],'ClipLimit',0.005); 
M(:,:,1) = L*100; 
R = lab2rgb(M); 
subplot(2,2,1); 
imshow(H); 
title('Histogram Equalized Image'); 
subplot(2,2,2); 
imhist(H); 
title('Histogram Equalization'); 
subplot(2,2,3); 
imshow(R); 
title('CLAHE Image'); 
subplot(2,2,4); 
imhist(R); 
title('CLAHE Histogram'); 



