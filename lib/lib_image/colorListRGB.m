function R = colorListRGB
     colorMap = colormap;
%     R = [colorMap(1, :);
%          colorMap(23, :);
%          colorMap(31, :);
%          colorMap(37, :);
%          colorMap(40, :);
%          colorMap(48, :);
%          colorMap(53, :);
%          colorMap(59, :);
%          colorMap(64, :)];
    R = colorMap(colorList, :);
end

