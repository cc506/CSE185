
img1 = im2double(imread('lena_noisy.jpg'));
img2 = im2double(imread('lena.jpg'));
% 
% 
%% Median filter
patch_size = [3, 3];
patch_size1= [5, 5];

img_median = median_filter(img1, patch_size);
img_median1 = median_filter(img1, patch_size1);
figure, imshow(img_median);
figure, imshow(img_median1);
imwrite(img_median, 'median_3.jpg');
imwrite(img_median1, 'median_5.jpg');

%% Sobel filter
 H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
 h = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge

img_sobel = sobel_filter(img1, H);
img_sobel1 = sobel_filter(img1, h);
figure, imshow(img_sobel);
figure, imshow(img_sobel1);
imwrite(img_sobel, 'sobel_h.jpg');
imwrite(img_sobel1, 'sobel_v.jpg');


%% Gaussian filter
% hsize = 5; sigma = 2;
% hsize = 9; sigma = 4;

