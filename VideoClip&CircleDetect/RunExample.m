function result = RunExample()
    result = true;
    
    videoL = VideoReader('E:\curriculum\ComputerVision\FinalProject\left_shot3.mp4');
    videoR = VideoReader('E:\curriculum\ComputerVision\FinalProject\right_shot3.mp4');
    %params illustrate in function
    %manual cut from frame 8
    [imL, imR] = ReadVideo(videoL, videoR, 1,15,8, false);
%    [framenumL, cellnum] = size(imL);
%     for i = 1:framenumL
%         figure()
%         subplot(2,1,1);
%         imshow(imL{i});
%         subplot(2,1,2);
%         imshow(imR{i});
%     end
	%
    [Lc, Rc, Lr, Rr, Li, Ri] = CircleDetect(imL, imR, false, true);
    
    res = TrajecoryFromPosition2d(Lc,1280,720);
    
    DrawPredict(imL{9}, res, 12, 1);
    
    result = 1;
end