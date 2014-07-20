% checks if 'im1' and 'im2' have the same size

function checkImageSizes(im1, im2)
    size1 = sizeImage(im1);
    size2 = sizeImage(im2);
    
    message = 'sizes of images do not mach';
    comment = [': (', int2str(size1), ') vs (', int2str(size2), ')'];
    
    if size1 == size2
    else
        error([message, comment]);
    end
end