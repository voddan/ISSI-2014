function R = sortSet(set, optionalDIM)
    % optional
    if nargin < 2
        optionalDIM = 2;
    end
    %\optional

    num = length(set);
    ar = zeros(num, 2);
    
    for i = 1:num
        ar(i, 1) = size(set{i}, optionalDIM);
        ar(i, 2) = i;
    end
    
    ar = sortrows(ar, -1);
    
    R = set(ar(:, 2));
end