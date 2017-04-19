function result = RunExample()
    result = true;
    %params illustrate in function
    [imL, imR] = ReadVideo(2,5,4, false);
    [framenumL, cellnum] = size(imL);
%     for i = 1:framenumL
%         figure()
%         subplot(2,1,1);
%         imshow(imL{i});
%         subplot(2,1,2);
%         imshow(imR{i});
%     end
	%
    CircleDetect(imL, imR);
end