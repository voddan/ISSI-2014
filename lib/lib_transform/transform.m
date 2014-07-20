% transforms 'table' with afine 'trans'

function R = transform(trans, table)
    checkSize('trans', trans, [3, 3]);
    checkSize('table', table, [2, NaN]);
    
    B = [table; ones(1, length(table))]; % for an afine transformation
    C = trans * B;
    
    R = C(1:2, :);
end