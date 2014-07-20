% color is an integer in 1..64
function R = int2color(color)
    colorMap = colormap;
    R = colorMap(rem(color, 64) + 1);
end