v = VideoReader('right_shot3.mp4');
frameCount = v.NumberOfFrames;
im1 = read(v, 15);
gray_image = rgb2gray(im1);
imshow(gray_image);
[centers, radii] = imfindcircles(gray_image,[15 30],'ObjectPolarity','dark','Sensitivity',0.935);