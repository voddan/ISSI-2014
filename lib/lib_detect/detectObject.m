%
% default:
%   optionalAmountOfTriples = 100
%   optionalAccuracy        = 10
%   optionalRegion          = 30

function [Set, Trans, Table_next] =                 ...
            detectObject(  table,                   ...
                           optionalAmountOfTriples, ...
                           optionalAccuracy,        ...
                           optionalRegion )                  
    % optional
    if nargin < 2 || isnan(optionalAmountOfTriples)
        optionalAmountOfTriples = 100;
        % 400 for 5 objects, 3 triples per each
    end
    
    if nargin < 3 || isnan(optionalAccuracy)
       optionalAccuracy = 10;
    end
    
    if nargin < 4 || isnan(optionalRegion)
       optionalRegion = 30;
    end
    %\optional
    
    checkSize('table', table, [5, NaN]);
    checkSize('optionalAmountOfTriples', optionalAmountOfTriples, [1, 1]);
    checkSize('optionalAccuracy',        optionalAccuracy, [1, 1]);
    checkSize('optionalRegion',          optionalRegion, [1, 1]);
    
    if size(table, 2) < 3
         error('We have less than 3 points here');
    end
                       
    Trans = bestTransformation(table, optionalAmountOfTriples, optionalRegion);
    
    if isempty(Trans) % a error
        Set         = [];
        Trans       = [];
        Table_next  = [];
        return;
    end
    
    indexes = findFittingPoints(Trans, table, optionalAccuracy);
    
    Set         = table(:,  indexes);
    Table_next  = table(:, ~indexes);
end

