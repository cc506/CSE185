% task 1
I = imread('01.jpg');
I(:, :, 1)=0;
figure, imshow(I);
imwrite(I, 'red.jpg');

% task 2
a = imread('02.jpg');
gray = (0.299 * a(:, :, 1)) + (0.587 * a(:, :, 2)) + (0.114 * a(:, :, 3));
figure, imshow(gray);
imwrite(gray, 'gray.jpg'); 

% task 3
b = imread('03.jpg');
figure, imshow(b);
imwrite(imrotate(b,90), 'rotate.jpg');

% task 4
c = imread('04.jpg');
figure, imshow(c);
imwrite(c(30:270, 30:270, :), 'crop.jpg');

% task 5
d = flip(c,2);
figure, imshow(d);
imwrite(d, 'flip.jpg');

% task 6
I = imread('01.jpg');
a = imread('02.jpg');
canvas = zeros(300 * 2 + 15, 400 * 2 + 15, 3 ,'uint8');

canvas(1:300, 1:400, :) = I;
canvas(1:300, 416:815, :)= a;
canvas(316:615, 1:400, :)= b;
canvas(316:615, 416:815, :)=c;

figure, imshow(canvas);
imwrite(canvas, 'combine.jpg');

% task 7
f = imread('flip.jpg');
avg = reshape((f(:) + c(:))/2, 300, 400, 3);
figure, imshow(avg);
imwrite(avg, 'average.jpg');



