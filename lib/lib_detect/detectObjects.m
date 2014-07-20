%
% default:
%   optionalThreshold       = depends on 'im1', 'im2'
%   optionalAmountOfTriples = 100
%   optionalAccuracy        = depends on 'tableSize' % 10
%   optionalRegion          = depends on 'tableSize' % 30
% 
% to skip the default value set it to NaN

function R = detectObjects(im1, im2,                ...
                           optionalThreshold,       ...
                           optionalAmountOfTriples, ...
                           optionalAccuracy,        ...
                           optionalRegion )
                       
    checkImageSizes(im1, im2);  
    tableSize = sizeImage(im1);
    averageTableSize  = sqrt( tableSize(1) * tableSize(2) );
    
    % optional
    if nargin < 3 || isnan(optionalThreshold)
        % optionalThreshold = 1.5;
        optionalThreshold = NaN;
    end
    
    if nargin < 4 || isnan(optionalAmountOfTriples)
        optionalAmountOfTriples = 100;
        % 400 for 5 objects, 3 triples per each
    end
    
    if nargin < 5 || isnan(optionalAccuracy)
       % optionalAccuracy = max(averageTableSize / 100 , 10);
       optionalAccuracy = 12;
    end
    
    if nargin < 6 || isnan(optionalRegion)
        optionalRegion = 4 * optionalAccuracy;
        % optionalRegion = max(floor(sqrt(tableSize(1) * tableSize(2) / 100)), 30);
    end
    %\optional 
    
    checkSize('optionalAmountOfTriples', optionalAmountOfTriples, [1, 1]);
    checkSize('optionalAccuracy', optionalAccuracy, [1, 1]);
    checkSize('optionalRegion', optionalRegion, [1, 1]);
    
%     table = siftTable(im1, im2, optionalThreshold);
    if ~isnan(optionalThreshold)
        table = siftTable(im1, im2, optionalThreshold);
    else
        optionalThreshold = 1.5;
        for count = 1:7 % not too much
            table = siftTable(im1, im2, optionalThreshold);
            
            if      size(table, 2) > averageTableSize * 3 / 4
                        optionalThreshold = optionalThreshold + 0.2;
            elseif  size(table, 2) < averageTableSize * 1 / 4
                        optionalThreshold = optionalThreshold - 0.3;
            else
                        break;
            end
        end
    end
    
    %%%%%%%%%%
    table_iterate = table;

    count = 0;
    
    R{1} = NaN;
    while size(table_iterate, 2) >= 3
        count = count + 1;

        [set, trans, nextTable] =                  ...
                 detectObject( table_iterate,      ...
                          optionalAmountOfTriples, ...
                          optionalAccuracy,        ...
                          optionalRegion);
        
        if isempty(trans) || isempty(set) || isempty(nextTable)
            break;
        end;
        
        R{count} = set; % it's ok
        table_iterate = nextTable;   
    end
    
    R = sortSet(R);
end