% shows an image with arrows, represention the movements of sift-points

function showImageWithSiftMovements(im1, im2, optionalThreshold)
    % optional
    if nargin < 3
        optionalThreshold = 1.5;
    end
    %\optional
    
    checkImageSizes(im1, im2);
    checkSize('optionalThreshold', optionalThreshold, [1, 1]);

    sift = siftTable(im1, im2, optionalThreshold);
    num = length(sift);

    %%%%%%%%%%%%%%%%%%%%
    % here you can change the way the information is displayed
    
    clf;
    imshow(im1);
    hold on;

    table = [ sift(1:2, :); sift(3:4, :); round(sift(5, :) / 1000) + 1];
    
    %%%%%%%%%%%%%%%%%%%%%
    hold on;
    showArrows([0, 0], table);
end