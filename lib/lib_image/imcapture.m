% gets the matrix of the current image on the current figure

function R = imcapture
    fPos    = get(gcf, 'position');
    aPos_n  = get(gca, 'position');
    
    w = fPos(3);
    h = fPos(4);
    
    aPos = aPos_n * ...
    [ w 0 0 0       
      0 h 0 0
      0 0 w 0
      0 0 0 h];
    
    R = screencapture(gcf, aPos);    
end