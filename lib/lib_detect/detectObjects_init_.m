TRESHOLD            = 1.5;  % 1.5
AMOUNT_OF_TRIPLES   = 100; % 400
ACCURACY            = 10;  % 5
REGION              = 30;  % 30

warning('off','all');
% warning;

im1 = imread('F029.jpg');
im2 = imread('F030.jpg');

table = siftTable(im1, im2, TRESHOLD);

show2ImagesWithSiftMatches(im1, im2, TRESHOLD);

table_iterate = table;
