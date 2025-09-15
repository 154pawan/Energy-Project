%load the image
img = imread("C:\Users\Pawan\Downloads\HZB-Perowskitfilm1.jpg");
imshow(img);

%check for image property
imageSize = size(img);
imageClass = class(img);
fprintf("size of img is: %d x %d\n", imageSize(1), imageSize(2));
fprintf("class of img is: %d\n", imageClass);

%convert the image to grayscale and binary
gray_img = rgb2gray(img);
binary_img = imbinarize(gray_img);
imshow(gray_img);
figure, 
imshow(binary_img);

%image manipulation
img_resized = imresize(img, 0.5);
figure, 
imshow(img_resized);
title("Resized image(50%)");

img_resized2 = imresize(img,[200,300]);

%Rotated the image
img_rotated = imrotate(img, 45);
figure,
imshow(img_rotated);
title("Rotated image (45 degree)");

%Flip the image horizontal and vertical
img_flippedH = fliplr(img);
figure,
imshow(img_flippedH);
title("flipped Horizontally");

img_flippedV = flipud(img);
figure,
imshow(img_flippedV);
title("flipped Vertically");

%adjust brightness & contrast
bright_img = img*1.5;
figure,
imshow(bright_img);
title("Bright image");

dark_img = img*0.5;
figure,
imshow(dark_img);
title("Dark image");

contrast_img = imadjust(img, [0.3, 0.7], [0, 1]);
figure,
imshow(contrast_img);
title("Contrast Adjusted image");

%Fitting and Noise Removal
h = fspecial("gaussian", [5,5], 2);
img_blur = imfilter(img, h);
figure,
imshow(img_blur);
title("Gaussian Blured image");

img_med = medfilt2(gray_img, [3,3]);
figure,
imshow(img_med);
title("Medium filtered image");

img_sharp = imsharpen(img);
figure,
imshow(img_sharp);
title("Sharpen image");

h_lap = fspecial("laplacian", 0.2);
img_lap = imfilter(gray_img, h_lap);
figure,
imshow(img_lap, []);
title("laplacian filtered image");

%Edge detection
edge_sobel = edge(gray_img, "sobel");
figure,
imshow(edge_sobel);
title("sobel edge detection");

edge_prewitt = edge(gray_img, "prewitt");
figure,
imshow(edge_prewitt);
title("prewitt edge detection");

edge_canny = edge(gray_img, "canny");
figure,
imshow(edge_canny);
title("canny edge detection");

edge_roberts = edge(gray_img, "roberts");
figure,
imshow(edge_roberts);
title("roberts edge detection");

edge_log = edge(gray_img, "log");
figure,
imshow(edge_log);
title("laplacian of gaussian (LOG)");

%Morphological image processing
se = strel("disk", 3);
img_dilated = imdilate(binary_img, se);
figure, 
imshow(img_dilated);
title("Dilated image");

img_eroded = imerode(binary_img, se);
figure, 
imshow(img_eroded);
title("Eroded image");

img_open = imopen(binary_img, se);
figure, 
imshow(img_open);
title("Opening operation");

img_close = imclose(binary_img, se);
figure, 
imshow(img_close);
title("Closing operation");

img_filled = imfill(binary_img, "holes");
figure,
imshow(img_filled);
title("Filled holes");

%Imaage segmentation
level = graythresh(gray_img);
binary_otsu = imbinarize(gray_img, level);
figure,
imshow(binary_otsu);
title("otsu thresholding");

D = -bwdist(~binary_img);
L = watershed(D);
binary_watershed = binary_img;
binary_watershed(L == 0) = 0;
figure,
imshow(binary_watershed);
title("watershed segmentation");

stats = regionprops(binary_img, "BoundingBox", "Area");
imshow(binary_img);
hold on;
for i = 1:length(stats)
    Rectangle("Position",stats(i).BoundingBox, "Edge Color", 8, "linewidth", 2);
end
hold off;
title("Detected objects");


