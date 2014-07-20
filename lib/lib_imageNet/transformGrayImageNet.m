% transforms a grayImageNet with 'trans'

function R = transformGrayImageNet(trans, net)
    checkSize('trans', trans, [3, 3]);
    checkSize('GrayImageNet', net, [NaN, NaN, 3]);

    [sizeX,sizeY, ~] = size(net);
   
   table = zeros(3, sizeX * sizeY);
   
   for i = 1:sizeX
       for j = 1:sizeY
           table(1, i*sizeY + j) = net(i, j, 1);
           table(2, i*sizeY + j) = net(i, j, 2);
           table(3, i*sizeY + j) = net(i, j, 3);
       end
   end
   
   transformed = transform(trans, table(1:2, :));
   
   R = zeros(sizeX, sizeY, 3);
   
   for i = 1:sizeX
       for j = 1:sizeY
           R(i, j, 1) = transformed(1, i*sizeY + j);
           R(i, j, 2) = transformed(2, i*sizeY + j);
           R(i, j, 3) =       table(3, i*sizeY + j);
       end
   end
end