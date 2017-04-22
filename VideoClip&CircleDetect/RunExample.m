    result = true;
    
    videoL = VideoReader('left_shot3.mp4');
    videoR = VideoReader('right_shot3.mp4');
    %params illustrate in function
    [imL, imR] = ReadVideo(videoL, videoR, 2,3,4, false);
%    [framenumL, cellnum] = size(imL);
%     for i = 1:framenumL
%         figure()
%         subplot(2,1,1);
%         imshow(imL{i});
%         subplot(2,1,2);
%         imshow(imR{i});
%     end
	%
    [Lc, Rc, Lr, Rr, Li, Ri] = CircleDetect(imL, imR, true);
    figure(7);
    imshow(cell2mat(Ri(1)));