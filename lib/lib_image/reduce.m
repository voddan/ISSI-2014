% Reduces the image A with ratious 'nx' and 'ny', aprocsimating the pixels
%
% The size IS reduced

function B = reduce(A, nx, ny)
	if(nx <= 0 || ny <= 0)
		error('reduce(A, nx, ny): nx and ny must be positive');
	end

	B = reduceX(A , nx) ;
	B = reduceX(B', ny)';
end

function B = reduceX(A, n)
	[zx, zy] = size(A);
	for iy = 1:zy
		zxn = idivide(zx, n);
		for ix = 1 : zxn
			ixn = ix * n;
			B(ix, iy) = mean( A((ixn - n + 1) : ixn , iy) );
		end
	end
end