% Resizes the image A down by gridding it

function B  = grid(A, x, y)
	B = A(1:x:end, 1:y:end);
end