numFrames = 20;
startFrame = 1;
video = VideoReader('right_shot3.mp4');
frames = cell(numFrames, 1);
lastFrame = startFrame + numFrames -1;
index = 1;
for i = startFrame: lastFrame
    frames{index} = read(video,i);
    index = index + 1;
end


[flow, VelX, VelY] = GetVelocityMatrixOpticalFlow( frames );

image = cell2mat(frames(numFrames));
imshow(image);
hold on;
plot(flow,'DecimationFactor',[3 3],'ScaleFactor',2)