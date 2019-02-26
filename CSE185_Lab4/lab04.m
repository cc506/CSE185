%% Task 1: Split Frequency
img = im2double(imread('images/cameraman.jpg'));

ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

figure, imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'cameraman_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'cameraman_high_0.1.jpg');

% ratio 0.2
ratio = 0.2;
[low_pass_img1, high_pass_img1] = separate_frequency(img, ratio);

figure, imshow(low_pass_img1);
figure, imshow(high_pass_img1 + 0.5);
imwrite(low_pass_img1, 'cameraman_low_0.2.jpg');
imwrite(high_pass_img1 + 0.5, 'cameraman_high_0.2.jpg');

%% Task 2: Hybrid Image
name1 = 'images/cat.jpg';
name2 = 'images/dog.jpg';

img1 = im2double(imread(name1));
img2 = im2double(imread(name2));

ratio = 0.2;
img_merged = hybrid_image(img1, img2, ratio);

figure,imshow(img_merged);
imwrite(img_merged, 'hybrid_1.jpg');

% 0.1
ratio = 0.1;
img_merged1 = hybrid_image(img2, img1, ratio);

figure,imshow(img_merged1);
imwrite(img_merged1, 'hybrid_2.jpg');

