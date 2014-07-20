%calculates the afine transformation by 3 points
%
% takes:
% A (4 x 3 )
% [ x1  x2  x3
%   y1  y2  y3
%   x1' x2' x3'
%   y1' y2' y3'
%    ~   ~   ~]
%
% returns:
% R ( 3 x 3 )
% [ a, b, c;
%   c, d, f;
%   0, 0, 1]

function R = transformation(vec3)  
    checkSize('vec3', vec3, [5, 3]); % for this project

    original = [vec3(1:2, :); ones(1, 3)];
    final    = [vec3(3:4, :); ones(1, 3)];

    if det(original) < 10^(-8)
        R = NaN;                % too Linearly Dependent
    else
        R = final / original;
    end
end