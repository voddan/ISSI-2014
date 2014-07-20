% transforms a gray image to a grayImageNet with 'step'

function Net = gray2ImageNet(Im, step)
    checkSize('step', step, [1, 1]);

	[sizeX, sizeY] = size(Im);

	stepX = step;
	stepY = step;

	[X, Y] = meshgrid(1:stepX:sizeX, 1:stepY:sizeY);

	numX = floor(sizeX / stepX);
	numY = floor(sizeY / stepY);

	Net = zeros(numX, numY, 3);

	for i = 1:numX
		for j = 1:numY
			Net(i, j, 1) = Y(i, j);
			Net(i, j, 2) = sizeX - X(i, j);
			Net(i, j, 3) = Im(X(i, j), Y(i, j));
		end
	end
end