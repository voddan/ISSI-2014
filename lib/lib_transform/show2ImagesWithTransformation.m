% shows two images one on the top of another
% with rectangles, replesenting the transformation

function show2ImagesWithTransformation( im1, im2, trans )
    checkImageSizes(im1, im2);
    checkSize('trans', trans, [3, 3]);
    
    clf;
    [V1, V2] = show2Images(im1, im2);
    
    hold on;
    showTransformation(V1, eye(3), sizeImage(im1));
    showTransformation(V2,  trans, sizeImage(im1));
end

