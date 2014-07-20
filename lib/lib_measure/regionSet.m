function R = regionSet( point, radius, vector )
    checkSize('point', point, [1, 2]);
    checkSize('vector', vector, [2, NaN]);
    checkSize('radius', radius, [1, 1]);
    
    num = size(vector, 2);
    radiusSqr = radius^2;
    
    indexes = zeros(1, num);
    
    for i = 1 : num
       if distanceSqr(point, vector(:, i)') <= radiusSqr
           indexes(1, i) = 1;
       end 
    end
   
    R = logical(indexes);
end

function r = distanceSqr(vec1, vec2)
    checkSize('vec1', vec1, [1, 2]);
    checkSize('vec2', vec2, [1, 2]);
    
    r = sum( (vec1 - vec2).^2 );
end

