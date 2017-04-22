function [flow, VelX, VelY] = getVelocityMatrixOpticalFlow( I1,I2 )

opticFlow = opticalFlowLK('NoiseThreshold',0.055);
im1 = im2double(rgb2gray(I1));
im2 = im2double(rgb2gray(I2));
flow = estimateFlow(opticFlow, im1);
flow = estimateFlow(opticFlow, im2);
VelX = flow.Vx;
VelY = flow.Vy;