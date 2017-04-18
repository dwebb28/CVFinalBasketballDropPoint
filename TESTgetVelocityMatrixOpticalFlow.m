%Testing file for getVelocityMatrixOpticalFlow
[flow , VelX, Vely] = getVelocityMatrixOpticalFlow(imread('edited28.png'),imread('edited24.png'));

imshow(imread('edited24.png'));
hold on
plot(flow,'DecimationFactor',[2 2],'ScaleFactor',7)
hold off