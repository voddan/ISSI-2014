function Set = regionTable( point, radius, table )
    checkSize('point', point, [1, 2]);
    checkSize('table', table, [5, NaN]);
    checkSize('radius', radius, [1, 1]);
    
    indexes = regionSet(point, radius, table([1:2], :));
    
    Set = table(:, indexes);
end

