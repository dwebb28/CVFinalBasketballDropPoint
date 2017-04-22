function imedited = AddColorFearure(imorig, X, Y)
    yellow = uint8([255 255 0]); % [R G B]; class of yellow must match class of I
    red = uint8([255 0 0]);
    blue = uint8([0 0 255]);
    green = uint8([0 255 0]);
    purple = uint8([0 255 255]);
    
    imedited = imorig;
    imedited(X-2,Y,1)=255;imedited(X-2,Y,2)=255;imedited(X-2,Y,3)=0;
    imedited(X-1,Y,1)=255;imedited(X-1,Y,2)=0;imedited(X-1,Y,3)=0;
    imedited(X,Y,1)=0;imedited(X,Y,2)=0;imedited(X,Y,3)=255;
    imedited(X+1,Y,1)=0;imedited(X+1,Y,2)=255;imedited(X+1,Y,3)=0;
    imedited(X+2,Y,1)=0;imedited(X+2,Y,2)=255;imedited(X+2,Y,3)=255;
end