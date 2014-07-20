function R = compareImages(A, B) 
    checkSizeImages(A, B);

	R = gray2bw(50 - abs(A - B));
end