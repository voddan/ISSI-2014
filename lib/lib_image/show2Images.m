% show two images of one size one on the top of another
% 'V1' and 'V2' are the left top corners of the images

function [V1, V2] = show2Images(im1, im2)
    checkImageSizes(im1, im2);
    
    imshow([im1; im2]);
    
    V1 = [0,  0];
    V2 = [0, size(im1, 1)];
end