function [flow, VelX, VelY] = GetVelocityMatrixOpticalFlow( ImageCell , OFMethod )

numImages = size(ImageCell, 1);

if strcmp(OFMethod,'Farneback')
    opticFlow = opticalFlowFarneback('NeighborhoodSize', 20, 'FilterSize', 15);
elseif strcmp(OFMethod, 'HS')
    opticFlow = opticalFlowHS;
elseif strcmp(OFMethod, 'LK')
    opticFlow = opticalFlowLK('NoiseThreshold',0.012);
else
    opticFlow = opticalFlowLK('NoiseThreshold',0.025);
end

smoothedImages = cell(numImages, 1);

for i = 1: numImages
    image = im2double(rgb2gray(cell2mat(ImageCell(i))));
    smoothedImages{i} = imgaussfilt(image, 1.1);
end

for i = 1: numImages
    flow = estimateFlow(opticFlow, cell2mat(smoothedImages(i)));
end
VelX = flow.Vx;
VelY = flow.Vy;