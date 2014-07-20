% Bluers the image A with the 'reduce' function
% Applyes the bluering 't' times
%
% The size IS allso reduced

function B = blur_r(A, t)
	B = A;
	for i = 1:t
		B = reduce(B, 2, 2);
	end
end