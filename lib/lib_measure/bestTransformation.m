% finds for the best transformation for the given vector
% retirns the tharnsformation, the norm of it and three main vectors
%
% default:
%   optionalAmountOfTriples = 400 
%   optionalRegion          = 30;

function [bestTrans, bestNorm, bestVec3] = bestTransformation(vector, optionalAmountOfTriples, optionalRegion)
    % optional
    if nargin < 2 || isnan(optionalAmountOfTriples)
        optionalAmountOfTriples = 400;
        % 5 objects, 3 triples per each
    end
    
    if nargin < 3 || isnan(optionalRegion)
       optionalRegion = 30;
    end
    %\optional
    
    checkSize('vector', vector, [5, NaN]);
    checkSize('optionalAmountOfTriples', optionalAmountOfTriples, [1, 1]);
      
    if size(vector, 2) < 3
        error('We have less than 3 points here');
    end
    
    % check the size, may be changed !!!
    if length(vector) < ((optionalAmountOfTriples * 4) ^ (1/3))   % means 1200 triples for 400 otherwise
        [bestTrans, bestNorm, bestVec3] = bestTransformation_tryAll(vector);
    else
        [bestTrans, bestNorm, bestVec3] = bestTransformation_tryFew(vector, optionalAmountOfTriples, optionalRegion);
    end
end

function   [bestTrans, bestNorm, bestVec3 ] ... 
                = bestTransformation_tryAll(vector)
            
    num = size(vector, 2);
    
    bestNorm = Inf;
    bestVec3 = [];
    
    for i = 1 : num
        for j = (i + 1) : num
            for k = (j + 1) : num

                vec3  = vector(:, [i, j, k]);
                trans = transformation(vec3);
                if isnan(trans)
                    continue; % a error in 'transformation'
                end
                
                norm = measureTransformation(trans, vector);

                % may be faster
                if norm < bestNorm
                    bestNorm = norm;
                    bestVec3 = vec3;
                end
                
            end
        end
    end
    
    if ~isempty(bestVec3)
        bestTrans = transformation(bestVec3);
    else
        % completely unsuccessful !
        bestTrans = [];
        %%% danger !!!
    end
end

function   [bestTrans, bestNorm, bestVec3 ] ... 
                = bestTransformation_tryFew(vector, amountOfTriples, region)
                        
    vector_2 = vector(1:2, :);     
    num      = size(vector, 2);
    
    bestNorm  = Inf;
    bestVec3  = [];
%     bestTrans = [];
    
    for count = 1 : amountOfTriples
        first = randomIndex(num);
        
        regionIndexes = regionSet(vector_2(:, first)', region, vector_2);
        regionVector  = vector(:, regionIndexes); % ? speed? 'find'
        regionNum     = size(regionVector, 2);
        
        
        if(regionNum < 3)
            continue; % a problem with the region
        end
        
        i = randomIndex(regionNum);
        j = randomIndex(regionNum);
        k = randomIndex(regionNum);

        vec3  = regionVector(:, [i, j, k]);
        
        %%%%%%%%%%%%%%
        trans = transformation(vec3);
        if isnan(trans)
            continue; % a error in 'transformation'
        end

        norm = measureTransformation(trans, vector);
        
        if norm < bestNorm
            bestNorm = norm;
            bestVec3 = vec3;
        end
        
    end
    %%%%%%%%%%%%%%%%%%%%%%
    
    if ~isempty(bestVec3)
        bestTrans = transformation(bestVec3);
    else
        % unsuccessful
        [bestTrans, bestNorm, bestVec3 ] ... 
                = bestTransformation_tryAll(vector);
    end
end

function r = randomIndex(a)
    r = floor(a * abs(rand - 0.01)) + 1;
end