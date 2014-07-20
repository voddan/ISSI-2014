% shows a transformed by 'trans' rectangles
% table (1, 4)
% [x, y, w, h]

function showTransformationRectangle(V, rect, trans, optionalColor)
    % optional
    if nargin < 4 || isnan(optionalColor)
        optionalColor = NaN;
    end
    %\optional
    
    checkSize('V'    , V    , [1, 2]);
    checkSize('rect' , rect , [1, 4]);
    checkSize('trans', trans, [3, 3]);

	showTransformation(V + rect(1:2), trans, [rect(4), rect(3)], optionalColor);
end