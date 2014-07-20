%
% default:
%   optionalThreshold       = NaN (detectobjects)
%   optionalAmountOfTriples = NaN (detectObjects)
%   optionalAccuracy        = NaN (detectObjects)
%   optionalRegion          = NaN (detectObjects)
% 
% to skip the default value set it to NaN

function sets = showImageWithDetectedObjectSets(im1, im2,       ...
                                optionalThreshold,       ...
                                optionalAmountOfTriples, ...
                                optionalAccuracy,        ...
                                optionalRegion)
    % optional
    if nargin < 3 || isnan(optionalThreshold)
        optionalThreshold = NaN;
    end
    
    if nargin < 4 || isnan(optionalAmountOfTriples)
        optionalAmountOfTriples = NaN;
    end
    
    if nargin < 5 || isnan(optionalAccuracy)
       optionalAccuracy = NaN;
    end
    
    if nargin < 6 || isnan(optionalRegion)
         optionalRegion = NaN;
    end
    %\optional             
    
    checkImageSizes(im1, im2);                                           
    
    sets = detectObjects(im1, im2,               ...
                        optionalThreshold,       ...
                        optionalAmountOfTriples, ...
                        optionalAccuracy,        ...
                        optionalRegion);
                            
    firstSmall = firstSmallerSet(sets, 4);                       
                           
    clf;
    warning('OFF', 'image:imshow:magnificationMustBeFitForDockedFigure'); 
    imshow(im1);
    
    % should work for small sets
    showSets([0, 0], sets(  1 : (firstSmall - 1)), sizeImage(im1), NaN);
    if firstSmall <= length(sets)
        showSets([0, 0], sets(firstSmall : end), sizeImage(im1), '+');
    end
    
    showColorList([0, 0], sizeImage(im1));
end