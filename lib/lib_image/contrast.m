% increase the contrast of the 'A' image
function B = contrast(A, x)
	B = (A / x) * x;
end