LeftVideo = 'left_shot3.mp4';
RightVideo = 'right_shot3.mp4';
SpaceBetweenFrames = 1;
NumOfFrames = 2;
BegIndxFrame = 13;

[Lc, Rc, Lr, Rr, Li_orig, Ri_orig, Li_edited, Ri_edited , VelRx, VelRy, VelLx, VelLy, flowR, flowL] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame , 'Farneback');

figure(1);
image = cell2mat(Li_orig(NumOfFrames));
imshow(image);
hold on;
plot(flowL,'DecimationFactor',[3 3],'ScaleFactor',2)
hold off;