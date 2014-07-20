% shows set of marks (filled circles)
% in the 'V' part of the frame
% colors are in 1..64
%
% default:
%   optionalMarker = NaN (showMark)

function showMarks(V, Marks, optionalMarker)
    % optional
    if nargin < 3 || isnan(optionalMarker)
        optionalMarker = NaN;
    end
    %\optional
    
    checkSize('V', V, [1, 2]);
    checkSize('Marks', Marks, [4, NaN]);
    
    hold on;
    for i = 1 : size(Marks, 2)
       showMark(V, Marks(:, i), optionalMarker);
    end
end