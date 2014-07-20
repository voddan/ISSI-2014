% shows one (resulting) image
% with dots,  represanting maches for the particular transformation
% with arrows, representin unmaches and the differenses for them
% optionalRadius is the accuracy for maches
%
% default:
%   optionalRadius = 5

function showImageWithTransformation( im1, im2, trans, table, optionalAccuracy)
    % optional
    if nargin < 5
        optionalAccuracy = 5;
    end
    %\optional

    checkImageSizes(im1, im2);
    checkSize('trans', trans, [3, 3]);
    checkSize('table', table, [5, NaN]);

    closeIndexes = findFittingPoints(trans, table, optionalAccuracy);
    
    tableArrows = table(:, ~closeIndexes);
    tableMarks  = table(:,  closeIndexes);
    
    arrows = tableArrows;
    marks  = [tableMarks(1:2, :); 
              30 * ones(1, size(tableMarks, 2)); 
              tableMarks(5, :)];
              
    %%%%%%%%%%%%%%%%%%%%%
    clf;
    imshow(im2);
              
    hold on;
    showMarks ([0, 0], marks );
    
    hold on;
    showArrows([0, 0], arrows);
end

