% Increase the size of the image A with ratious 'nx' and 'ny', duplicating the pixels 

function B = duplicate(A, nx, ny)
	if(nx <= 0 || ny <= 0)
		error('duplicate(A, nx, ny): nx and ny must be positive');
	end

	B = duplicateX(A , nx) ;
	B = duplicateX(B', ny)';
end

function B = duplicateX(A, n)
	[zx, zy] = size(A);
	for ix = 1:zx
		for t = 1:n
			B(end + 1, :) = A(ix, :);
		end
	end
end