%
% default:
%   optionalThreshold       = NaN (detectobjects)
%   optionalAmountOfTriples = NaN (detectObjects)
%   optionalAccuracy        = NaN (detectObjects)
%   optionalRegion          = NaN (detectObjects)
% 
% to skip the default value set it to NaN

function sets = show2ImagesWithObjectTransformations(im1, im2,       ...
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
    [V1, V2] = show2Images(im1, im2);
    
    %%%%%%%%%%%%%%%%%%%%%%
    % should work for small sets
    % showSets([0, 0], sets(  1 : (firstSmall - 1)), sizeImage(im1), NaN);
    
    setsToDisplay = sets(1 : (firstSmall - 1));
    numSet = length(setsToDisplay);
    
    if numSet > length(colorList)
        warning([                                   ...
            'we have more sets than colors in "colorList"', ...
            ' ( ', int2str(numSet), ' over ',               ...
            int2str(length(colorList)), ' )']);
    end
    
    myColorListIndexes = [1, 8, 5, 2, 7, 9, 4, 6, 3];
    
    for i = 1: numSet
        table = setsToDisplay{i};
        checkSize('table', table, [5, NaN]);
        
        num = size(table, 2);
        
        color = colorList( myColorListIndexes(      ...
                    rem(i, length(colorList) + 1) ));
        
        showMarks(V1, [table(1:2, :); 30 * ones(1, num); color * ones(1, num)]);
        showMarks(V2, [table(3:4, :); 30 * ones(1, num); color * ones(1, num)]);
            
        pos = positionSet(table(1:2, :));
        showTransformationRectangle(V1, pos, eye(3), color);
        
        trans = bestTransformation(table);
        showTransformationRectangle(V2, pos,  trans, color);
    end

    showColorList(V1, sizeImage(im1));
    showColorList(V2, sizeImage(im2));
end