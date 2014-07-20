imageNames = {
%     'F029.jpg', 'F030.jpg';
    'F039.jpg', 'F040.jpg';
%     'F120.jpg', 'F121.jpg';
    %%%% 'IMG_1501.JPG', 'IMG_1502.JPG';
%     'iphone1.jpg', 'iphone2.jpg';
%     'phones_pair_1.jpg', 'phones_pair_2.jpg'
    };

num = size(imageNames, 1);

%%%%%%%%%%%%
clc;
disp(['please, select a folder for keeping the resulting images (', int2str(num) ,')']);
% for my computer only
path = uigetdir;

clf;
for count = 1:num    
    name1 = imageNames{count, 1};
    name2 = imageNames{count, 2};
    
    % should work with '.jpg'
    name = name1(1 : (end - 4));
     
    % printing
    disp(['images: ', name1, ', ',               ...
          name2, ' (', int2str(size(im1)), ')']);
    
    im1 = imread(name1);
    im2 = imread(name2);
    
    % clf;
    showImageWithDetectedObjectSets(im1, im2);
    %waitforbuttonpress;
    
    capture = imcapture;
    capName = [ name, '_dos' ,'.jpg' ];
    imwrite(capture, [path, '/', capName]);
    disp(['"', capName, '" (', int2str(size(capture)) , ...
          ') was written to ', path]);
end