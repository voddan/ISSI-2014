% show set of arrows with different colors

function showArrows(V, Arrows)
    checkSize('V', V, [1, 2]);
    checkSize('Arrows', Arrows, [5, NaN]);
    
    for i = 1:size(Arrows, 2)
       ar = Arrows(:, i);
       showArrow(V, ar(1:2)', ar(3:4)', ar(5));
    end
end