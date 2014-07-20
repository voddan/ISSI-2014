% shows a transformed by 'trans' rectangles
% fitting the 'size'
% shifted to V

function showTransformation(V, trans, size, optionalColor)
    % optional
    if nargin < 4 || isnan(optionalColor)
        optionalColor = 55;
    end
    %\optional

    checkSize('V', V, [1, 2]);
    checkSize('trans', trans, [3, 3]);
    checkSize('size', size, [1, 2]);

    % because of matrixes !!!
	x = round( size(2) / 5);
	y = round( size(1) / 5);

	sizeMatrix = [x, 0;
				  0, y];

	table1 = sizeMatrix * [1, 4, 4, 1;
			 		   	   1, 1, 4, 4 ];

	table2 = sizeMatrix * [2, 3, 3, 2;
			 		   	   2, 2, 3, 3 ];

	table3 = sizeMatrix * [0, 5, 5, 0;
			 		   	   0, 0, 5, 5 ];

	transformed1 = transform(trans, table1);
	transformed2 = transform(trans, table2);
	transformed3 = transform(trans, table3);

    hold on;
	showPolygon(V, transformed1, optionalColor);
	showPolygon(V, transformed2, optionalColor);
	showPolygon(V, transformed3, optionalColor);
end