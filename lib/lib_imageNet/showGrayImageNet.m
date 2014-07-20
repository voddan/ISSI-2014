% shows a grayImageNet with 'step' (is not used)

function showGrayImageNet(Net, step)
    checkSize('step', step, [1, 1]);
    checkSize('GrayImageNet', Net, [NaN, NaN, 3]);

	smallRad = 12;
    bigRad   = 40;

    clf;
	hold on;

	for i = 2 : (size(Net, 1) - 1)
		for j = 2 : (size(Net, 2) - 1)
			local = Net((i - 1) : (i + 1), (j - 1) : (j + 1), :);
            
            scatter(local(2, 2, 1), local(2, 2, 2), bigRad, local(2, 2, 3), 'filled');

			plot([local(2, 2, 1), local(2, 3, 1)], [local(2, 2, 2), local(2, 3, 2)], 'Color', gray2rgb(local(2, 2, 3)), 'LineWidth', 3);
			plot([local(2, 2, 1), local(3, 2, 1)], [local(2, 2, 2), local(3, 2, 2)], 'Color', gray2rgb(local(2, 2, 3)), 'LineWidth', 3);

			% plot([local(2, 2, 1), local(3, 3, 1)], [local(2, 2, 2), local(3, 3, 2)], 'Color', gray2rgb(local(2, 2, 3)), 'LineWidth', 3);
			% plot([local(2, 2, 1), local(1, 3, 1)], [local(2, 2, 2), local(1, 3, 2)], 'Color', gray2rgb(local(2, 2, 3)), 'LineWidth', 3);

            % scatter(local(2, 2, 1), local(2, 2, 2), smallRad, local(2, 2, 3), 'filled');
		end
	end
end

function R = gray2rgb(gray)
	c = (gray / 256);
	R = [c, c, c];
end