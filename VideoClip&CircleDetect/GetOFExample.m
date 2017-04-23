LeftVideo = 'left_shot3.mp4';
RightVideo = 'right_shot3.mp4';
SpaceBetweenFrames = 1;
NumOfFrames = 6;
BegIndxFrame = 13;

[Lc, Rc, Lr, Rr, Li_orig, Ri_orig, Li_edited, Ri_edited , VelRx, VelRy, VelLx, VelLy, flowR, flowL] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame);

image = cell2mat(Ri_orig(numFrames));
imshow(image);
hold on;
plot(flowR,'DecimationFactor',[3 3],'ScaleFactor',7)