% returns a logical index for 'table'
% of points that mach 'trans'
% with 'optionalAccuracy'
%
% defoult:
% optionalAccuracy = 5

function L = findFittingPoints(trans, table, optionalAccuracy)
    % optional
    if nargin < 3 || isnan(optionalAccuracy)
        optionalAccuracy = 5;
    end
    %\optional

    checkSize('trans', trans, [3, 3]);
    checkSize('table', table, [5, NaN]);
    checkSize('optionalAccuracy', optionalAccuracy, [1, 1]);
    
    transformed = transform(trans, table(1:2, :));  
    
    diff = (transformed - table(3:4, :));
    dist = sum(diff .^ 2); % array of the disstanse squares
    
    L = logical(dist < (optionalAccuracy^2));
end