    %clip1: 20, 10;
    %clip2: 20,10;
    %clip3: 20, 52;
    %left_shot3 15, 8
function result = RunExample(frameCount, startFrame, FileName)
    result = true;
    
    videoL = VideoReader(FileName);
    videoR = VideoReader('right_shot3.mp4');
    %params illustrate in function
    [imL, imR] = ReadVideo(videoL, videoR, 1,frameCount,startFrame, false);
%    [framenumL, cellnum] = size(imL);
%     for i = 1:framenumL
%         figure()
%         subplot(2,1,1);
%         imshow(imL{i});
%         subplot(2,1,2);
%         imshow(imR{i});
%     end
	%
    [Lc, Rc, Lr, Rr, Li, Ri] = CircleDetect(imL, imR, false, false);
    %disp = Disparity(cell2mat(Lc), cell2mat(Rc));
    
    %res = TrajecoryFromPosition2d(Lc,1280,720);
    [resc, resr] = TrajecoryFromPosition3d(Lc, Lr);
    
    videoL = VideoReader(FileName);
    videoR = VideoReader('right_shot3.mp4');
    DrawPredict(videoL, resc, resr, startFrame+frameCount, 1);
    
    result = 1;
end