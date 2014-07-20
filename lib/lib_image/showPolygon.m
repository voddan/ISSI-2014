% shows a polygon from the 'Points'
% 'optionalColor' is an integer in 1..64

function showPolygon(V, Points, optionalColor)
     % optional
    if nargin < 3 || isnan(optionalColor)
        optionalColor = 55;
    end
    %\optional
    
    checkSize('Points', Points, [2, NaN]);
    checkSize('V', V, [1, 2]);

	num = size(Points, 2);
    
    cMap = colormap;
	plot(V(1) + Points(1, [1:num, 1])',     ...
         V(2) + Points(2, [1:num, 1])',     ...
         'Color', cMap(optionalColor, :),   ...
         'LineStyle', '-');
end