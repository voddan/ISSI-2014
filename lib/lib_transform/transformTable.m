% transforms points of 'table' with 'trans'
% and attaches them to the bottom

function R = transformTable(trans, table)
    checkSize('trans', trans, [3, 3]);
    checkSize('table', table, [2, NaN]);

    R = [ table; transform(trans,table) ];
end