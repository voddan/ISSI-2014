% returns some kind of norm for the transformation
% may be changed

function R = measureTransformation( trans, vector )
    checkSize('trans', trans, [3, 3]);
    checkSize('vector', vector, [5, NaN]);  

    transformed = transform(trans, vector(1:2, :));
    R           = measureTheDifference( transformed, vector(3:4, :) );
end

