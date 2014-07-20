function showColorList(V, ImageSize)
    checkSize('V', V, [1, 2]);
    checkSize('ImageSize', ImageSize, [1, 2]);
    
    x = ImageSize(1) + V(1);
    y = ImageSize(2) + V(2);
    
    list = colorListRGB;   
    num = length(list);
    
    step = floor( y / num );
    width = 5;
    
%     rectangle('Position', [0, x - width, y, width], 'FaceColor', 'r');
    
    for i = 1 : (num - 1)
        rectangle('Position',                          ...
            [step * (i - 1), x - width, step, width],  ...
            'FaceColor', list(i, :));                  ...
    end

    rectangle('Position',                          ...
            [step * (num - 1), x - width, y - step * (num - 1), width],  ...
            'FaceColor', list(num, :));     
end