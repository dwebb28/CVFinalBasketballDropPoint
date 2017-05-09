LeftVideo = 'left_shot3.mp4';
RightVideo = 'right_shot3.mp4';
SpaceBetweenFrames = 1;
NumOfFrames = 2;
BegIndxFrame = 13;

[Lc3, Rc3, Lr3, Rr3, Li_orig3, Ri_orig3, Li_edited3, Ri_edited3 , VelRx3, VelRy3, VelLx3, VelLy3, flowR3, flowL3] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame , 'HS');

figure(3);
image = cell2mat(Li_orig3(NumOfFrames - 1));
imshow(image);
hold on;
plot(flowL3,'DecimationFactor',[2 2],'ScaleFactor',10)