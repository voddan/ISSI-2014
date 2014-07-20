clf;
imshow(im1);

if size(table_iterate, 2) < 3
    disp('We have less than 3 points here, halted');
    return;
end

[set, trans, nextTable] = detectObject(table_iterate,     ...
                                 AMOUNT_OF_TRIPLES, ...
                                 ACCURACY,          ...
                                 REGION);
trans  % printing

if isnan(trans)
    return
end;

num1   = size(set, 2);
num2   = size(nextTable, 2);

marks1 = [set(1:2, :);       ...
         15 * ones(1, num1); ...
         200 * ones(1, num1)];
     
marks2 = [nextTable(1:2, :); ...
         15 * ones(1, num2); ...
         50 * ones(1, num2)];
     
showMarks([0, 0], marks1);
showMarks([0, 0], marks2);

table_iterate = nextTable;
