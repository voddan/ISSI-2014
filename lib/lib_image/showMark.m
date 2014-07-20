% shows a mark 'A' on the 'V' image
% ----- colors are in 1..64
%
% default:
%   optionalMarker = 'filled o'

function showMark(V, Mark, optionalMarker)
    % optional
    if nargin < 3 || isnan(optionalMarker)
        optionalMarker = 'filled o';
    end
    %\optional

    checkSize('V', V, [1, 2]);
    checkSize('Mark', Mark, [4, 1]);
    checkSize('optionalMarker', optionalMarker, [1, NaN]);

    V1= V(1);
    V2= V(2);
    
    X = Mark(1);
    Y = Mark(2);
    S = Mark(3);
    C = Mark(4);
    
    colorMap = colormap;
    Color = colorMap(rem(C, 64) + 1, :);
    
    scatter(V1 + X, V2 + Y, S, Color, optionalMarker);
end