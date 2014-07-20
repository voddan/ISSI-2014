% shows an arrow
% Color is an integer in 1:64

function showArrow(V, Start, Stop, Color)
    checkSize('V', V, [1, 2]);
    checkSize('Start', Start, [1, 2]);
    checkSize('Stop' , Stop , [1, 2]);
    checkSize('Color', Color, [1, 1]);

    % Color is an integer
    colors = colormap;
    Color = rem(Color, 64) + 1;
    c = colors(Color, :);
    
    ar = arrow(V(1) + Start, V(2) + Stop, 10, [], 20);
    %ar = arrow(Start, Stop);
    set( ar, 'EdgeColor', c);
    set( ar, 'FaceColor', c);
end