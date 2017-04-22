%init counter = 1, added by frame counter
%radi in this project should be around 12
function result = DrawPredict(img, cen, radi, counter)
    [cen_num, coordNum] = size(cen);
    %circleList = zeros(cen_num, 1);
    center = zeros(1,2);
    figure();
    imshow(img);
    for i=counter:cen_num
        center(1) = cen(i, 1);
        center(2) = cen(i, 2);
        viscircles(center,radi);
    end
    result = 1;
end