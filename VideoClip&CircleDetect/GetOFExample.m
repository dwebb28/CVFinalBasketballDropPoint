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

% BegIndxFrame = 12;
% NumOfFrames = 5;
% 
% [Lc2, Rc2, Lr2, Rr2, Li_orig2, Ri_orig2, Li_edited2, Ri_edited2 , VelRx2, VelRy2, VelLx2, VelLy2, flowR2, flowL2] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame , 'LK');
% 
% figure(2);
% image = cell2mat(Li_orig2(NumOfFrames));
% imshow(image);
% hold on
% plot(flowL2,'DecimationFactor',[2 2],'ScaleFactor',10);
% hold off


% BegIndxFrame = 12;
% NumOfFrames = 5;
% [Lc3, Rc3, Lr3, Rr3, Li_orig3, Ri_orig3, Li_edited3, Ri_edited3 , VelRx3, VelRy3, VelLx3, VelLy3, flowR3, flowL3] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame , 'HS');
% 
% figure(3);
% image = cell2mat(Li_orig3(NumOfFrames - 1));
% imshow(image);
% hold on;
% plot(flowL3,'DecimationFactor',[2 2],'ScaleFactor',10)