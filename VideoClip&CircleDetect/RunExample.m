function result = RunExample()
    result = true;
    
    videoL = VideoReader('E:\curriculum\ComputerVision\FinalProject\left_shot3.mp4');
    videoR = VideoReader('E:\curriculum\ComputerVision\FinalProject\right_shot3.mp4');
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
    
    result = 1;
end