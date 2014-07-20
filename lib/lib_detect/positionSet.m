function R = positionSet(vector)
    checkSize('vector', vector, [2, NaN]);
    
    minX = min(vector(1, :));
    maxX = max(vector(1, :));
    
    minY = min(vector(2, :));
    maxY = max(vector(2, :));
    
    R = [minX, minY, (maxX - minX), (maxY - minY)];
end