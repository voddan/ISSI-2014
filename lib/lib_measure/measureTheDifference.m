% returns the differense between (x1, y1) and (x2, y2)
% may be changed

function R = measureTheDifference(A, B)
    checkSize('A', A, [2, NaN]);
    checkSize('B', B, [2, NaN]);

    Diff = (A - B);
    Dist = sqrt( sum( sqr(Diff) ) );
    R = sum( Dist );
end

function R = sqr(A)
    R = A.^2;
end