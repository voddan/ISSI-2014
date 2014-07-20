%
% default:
%   optionalMarker = NaN (showMark)

function showSets(V, set, frameSize, optionalMarker)
    % optional
    if (nargin < 4) || isnan(optionalMarker)
        optionalMarker = NaN;
    end
    %\optional
    
    checkSize('V', V, [1, 2]);
    checkSize('set', set, [1, NaN]);
    checkSize('frameSize', frameSize, [1, 2]);
    
    numSet = length(set);
    if numSet > length(colorList)
        warning([                                   ...
            'we have more sets than colors in "colorList"', ...
            ' ( ', int2str(numSet), ' over ',               ...
            int2str(length(colorList)), ' )']);
    end
    
    for i = 1:numSet
        table = set{i};
        
        checkSize('table', table, [5, NaN]);
        
        if i > length(colorList)
            break;
        end
        
        color = colorList(rem(((i - 1)), length(colorList)) + 1);
        numTable = size(table, 2);
        
        marks = [table(1:2, :);              ...
                 30 * ones(1, numTable);     ...
                 color * ones(1, numTable)]; ...
        
        showMarks(V, marks, optionalMarker);
    end
    
end