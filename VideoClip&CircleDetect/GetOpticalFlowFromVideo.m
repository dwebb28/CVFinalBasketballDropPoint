function [Lc, Rc, Lr, Rr, Li_orig, Ri_orig, Li_edited, Ri_edited , ROFVx, ROFVy , LOFVx, LOFVy , flowL , flowR] = GetOpticalFlowFromVideo(LeftVid, RightVid, SpaceBetweenFrames, NumOfFrames, BegIndxFrame)

videoL = VideoReader( LeftVid );
videoR = VideoReader( RightVid );
[imL, imR] = ReadVideo(videoL, videoR, SpaceBetweenFrames ,NumOfFrames ,BegIndxFrame, false);
[Lc, Rc, Lr, Rr, Li_edited, Ri_edited] = CircleDetect(imL, imR, false);

Li_orig = imL;
Ri_orig = imR;

LOFVx = cell((NumOfFrames - 1) , 1);
LOFVy = cell((NumOfFrames - 1), 1);
ROFVx = cell((NumOfFrames - 1) , 1);
ROFVy = cell((NumOfFrames - 1) , 1);

i = 1;
j = 2;

while j <= NumOfFrames
    [flowR , VelRx , VelRy] = GetVelocityMatrixOpticalFlow( cell2mat(Li_edited(j)) , cell2mat(Li_edited(i)));
    ROFVx{i} = VelRx;
    ROFVy{i} = VelRy;
    [flowL , VelLx , VelLy] = GetVelocityMatrixOpticalFlow( cell2mat(Ri_edited(j)) , cell2mat(Ri_edited(i)));
    LOFVx{i} = VelLx;
    LOFVy{i} = VelLy;
    i = i + 1;
    j = j + 1;
end