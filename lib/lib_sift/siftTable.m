% calculates a table of parameters SIFT
% sorts by [x1, y1]
% returns:
% R( 5 x N )
% R[ x1; y1;
%    x2; y2;
%    score]
%
% default:
%   optionalThreshold = 1.5

function R = siftTable(im1, im2, optionalThreshold)
    % optional
    if nargin < 3
        optionalThreshold = 1.5;
    end
    %\optional
    
    checkImageSizes(im1, im2);
    checkSize('optionalThreshold', optionalThreshold, [1, 1]);
    
    sim1 = single(rgb2gray(im1));
    sim2 = single(rgb2gray(im2));
    
    [frame1, discr1] = vl_sift(sim1);
    [frame2, discr2] = vl_sift(sim2);
    
    [matches, scores] =  vl_ubcmatch(discr1, discr2, optionalThreshold);
    
    % the unique step
    
    matchedFrames1 = frame1(:, matches(1, :));
    matchedFrames2 = frame2(:, matches(2, :));
    
    number = length(matchedFrames1);
    if length(matchedFrames2) ~= number
        error('internal error #1');
    end
    if length(scores) ~= number
        error('internal error #2');
    end
    
    %R = [matchedFrames1(1:2, :); matchedFrames2(1:2, :)] 
   
    R = [matchedFrames1; matchedFrames2; scores];
    R = sortrows(R', 1:2)';
    R = R([1, 2, 5, 6, 9], :);
end