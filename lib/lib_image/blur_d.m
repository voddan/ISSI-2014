% Bluers the image A with the 'reduce' function and dublicates that
% Applyes the bluering 't' times
%
% The size IS NOT reduced

function B = blur_d(A, t)
	B = A;
	for i = 1:t
		B = reduce(B, 2, 2);
		B = duplicate(B, 2, 2);
	end
end