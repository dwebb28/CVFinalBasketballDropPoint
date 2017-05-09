LeftVideo = 'left_shot3.mp4';
RightVideo = 'right_shot3.mp4';
SpaceBetweenFrames = 1;
NumOfFrames = 2;
BegIndxFrame = 13;

[Lc2, Rc2, Lr2, Rr2, Li_orig2, Ri_orig2, Li_edited2, Ri_edited2 , VelRx2, VelRy2, VelLx2, VelLy2, flowR2, flowL2] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame , 'LK');

figure(2);
image = cell2mat(Li_orig2(NumOfFrames));
imshow(image);
hold on
plot(flowL2,'DecimationFactor',[2 2],'ScaleFactor',10);
hold off
