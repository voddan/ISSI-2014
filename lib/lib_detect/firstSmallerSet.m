function r = firstSmallerSet(sets, x)
    num = length(sets);
    for i = 1:num
        if size(sets{i}, 2) < x
            r = i;
            return;
        end
    end
    r = num + 1;
end