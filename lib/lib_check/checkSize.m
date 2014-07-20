% checks the size of the given matrix
% prints aerror massage if necessary
% if you do not care about a dimensioin, set it to Nan
%
% examples:
%   checkSize('myname', [4, 4, 4], [1, 3])      % ok
%   checkSize('myname', [4, 4, 4], [1, 2])      % error
%   checkSize('myname', [4, 4, 4], [1, 3, 2])   % error
%   checkSize('myname', [4, 4, 4], [1, NaN])    % ok

function checkSize(name, A, sizes)
    actualSize = size(A);
   
    stringSize = ['"', name, '" must be a (', int2str(sizes),')-matrix '];
    stringDims = ['"', name, '" must be a ', int2str(numel(sizes)),'-D matrix '];
    
    commentSize = ['(not a (', int2str(actualSize) ,')-one)'];
    commentDims = ['(not a ', int2str(numel(actualSize)) ,'-D one)'];
    
    comparison = ( compareOrSkip(actualSize, sizes) );
    if isnan(comparison)
        error([stringDims, commentDims]);
    elseif comparison
        % ok
    else
        error([stringSize, commentSize]);
    end
end

function R = compareOrSkip(A, B)
    numA = numel(A);
    numB = numel(B);
    
    if (numA ~= numB)
        tailB = B(numA + 1 : end);
        
        % two logical arrays
        if (tailB == 1) | (isnan(tailB))
            B = B(1:numA);
        else
            R = NaN;
            return;
        end
    end
    
    nanIndexes = logical(isnan(B));

    A(nanIndexes) = 0;
    B(nanIndexes) = 0;

    R = (A == B);
end