LeftVideo = 'left_shot3.mp4';
RightVideo = 'right_shot3.mp4';
SpaceBetweenFrames = 2;
NumOfFrames = 3;
BegIndxFrame = 4;

[Lc, Rc, Lr, Rr, Li_orig, Ri_orig, Li_edited, Ri_edited , ROFVx, ROFVy , LOFVx, LOFVy] = GetOpticalFlowFromVideo(LeftVideo, RightVideo,SpaceBetweenFrames, NumOfFrames, BegIndxFrame);

image = cell2mat(Ri_edited(1));
imshow(image);
TestVelx = cell2mat(ROFVx(1));
center = cell2mat(Lc(1));