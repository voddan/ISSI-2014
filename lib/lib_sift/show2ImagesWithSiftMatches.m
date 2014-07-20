% shows two images one on the top of another
% with corresponding SIFT points
% 'optionalTreashold' is the treshold for SIFT
% 'optionalMaxMarkSize' is the max size for displaying marks

function show2ImagesWithSiftMatches(im1, im2, optionalThreshold, optionalMaxMarkSize)
    minMarkSize = 20;

    % optional
    if nargin < 3
        optionalThreshold = 1.5;
    end
    
    if nargin < 4
        optionalMaxMarkSize = 50;
    end
    
    if optionalMaxMarkSize < minMarkSize 
        optionalMaxMarkSize = minMarkSize;
    end
    %\optional

    checkImageSizes(im1, im2);
    checkSize('optionalThreshold'  , optionalThreshold  , [1, 1]);
    checkSize('optionalMaxMarkSize', optionalMaxMarkSize, [1, 1]);
    
    sift = siftTable(im1, im2, optionalThreshold);
    number = length(sift);

    %%%%%%%%%%%%%%%%%%%%
    % here you can change the way the information is displayed
    
    clf;
    [V1, V2] = show2Images(im1, im2);
    hold on;
    
    %table1 = [machedFrames1(1:2, :); 10 * ones(1, number); 15 * ones(1, number)];
    colorsAndSizes = [
        rem( range(0, 5, number), max(optionalMaxMarkSize - minMarkSize, 1) ) + minMarkSize;
        floor( range(1, 1, number) * 64 / number ) ];
    
    table1 = [  sift(1:2, :); colorsAndSizes];
    table2 = [  sift(3:4, :); colorsAndSizes];
    
    %%%%%%%%%%%%%%%%%%%%%
    hold on;
    showMarks(V1, table1);
    
    hold on;
    showMarks(V2, table2);
end