% Bluers the image A with the 'blur_avarage' function
% Applyes the bluering 't' times
%
% The size IS NOT reduced

function B = blur_a(A, t)
	B = A;
	for i = 1:t
		B = blur_average(B);
	end
end

function B = blur_average(A)
	[zx, zy] = size(A);
	for ix = 2 : zx - 1
		for iy = 2 : zy - 1
			B(ix, iy) = mean( cross(A, ix, iy) );
		end
	end

	for i = 1 : zy
		B(1,  i) = A(1 , i);
		B(zx, i) = A(zx, i);
	end

	for i = 1 : zx
		B(i,  1) = A(i , 1);
		B(i, zy) = A(zy, i);
	end
end

function a = cross(A, i, j)
	a = [ 	A(i - 1	, j		),
			A(i		, j		),
			A(i + 1	, j		),
			A(i		, j - 1	),
			A(i		, j + 1	) ];
end