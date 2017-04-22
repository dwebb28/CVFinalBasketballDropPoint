LeftVideo = 'left_shot3.mp4';
RightVideo = 'right_shot3.mp4';
SpaceBetweenFrames = 1;
NumOfFrames = 3;
BegIndxFrame = 8;

[Lc, Rc, Lr, Rr, Li_orig, Ri_orig, Li_edited, Ri_edited , ROFVx, ROFVy , LOFVx, LOFVy, flowR, flowL] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame);

image = cell2mat(Ri_orig(3));
imshow(image);
hold on;
TestVelx = cell2mat(ROFVx(2));
center = cell2mat(Rc(2));
plot(flowR,'DecimationFactor',[2 2],'ScaleFactor',7)