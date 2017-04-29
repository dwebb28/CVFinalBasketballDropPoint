function [flow, VelX, VelY] = GetVelocityMatrixOpticalFlow( ImageCell )

numImages = size(ImageCell, 1);
%opticFlow = opticalFlowLK('NoiseThreshold',0.033);
%opticFlow = opticalFlowHS;
opticFlow = opticalFlowFarneback('NeighborhoodSize', 3, 'FilterSize', 7);
smoothedImages = cell(numImages, 1);

for i = 1: numImages
    image = im2double(rgb2gray(cell2mat(ImageCell(i))));
    smoothedImages{i} = imgaussfilt(image, 0.6);
end

for i = 1: numImages
    flow = estimateFlow(opticFlow, cell2mat(smoothedImages(i)));
end
VelX = flow.Vx;
VelY = flow.Vy;