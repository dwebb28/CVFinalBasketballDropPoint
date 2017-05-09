function [Lc, Rc, Lr, Rr, Li_orig, Ri_orig, Li_edited, Ri_edited , VelRx, VelRy, VelLx, VelLy , flowL , flowR] = GetOpticalFlowFromVideo(LeftVid, RightVid, SpaceBetweenFrames, NumOfFrames, BegIndxFrame , OFMethod)

videoL = VideoReader( LeftVid );
videoR = VideoReader( RightVid );
[imL, imR] = ReadVideo(videoL, videoR, SpaceBetweenFrames ,NumOfFrames ,BegIndxFrame, false);
[Lc, Rc, Lr, Rr, Li_edited, Ri_edited] = CircleDetect(imL, imR, false);

Li_orig = imL;
Ri_orig = imR;


[flowR , VelRx , VelRy] = GetVelocityMatrixOpticalFlow( Ri_orig , OFMethod);
[flowL , VelLx , VelLy] = GetVelocityMatrixOpticalFlow( Li_orig , OFMethod);