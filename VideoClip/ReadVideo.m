%params:
%space: frame space per video-clip
%frameCount: total number of clip we want
%beginIdx: cut first number of clip(ball with hand)
function [imL, imR] = ReadVideo(space, frameCount, beginIdx, isDispImg)
    videoL = VideoReader('E:\curriculum\ComputerVision\FinalProject\left_shot3.mp4');
    videoR = VideoReader('E:\curriculum\ComputerVision\FinalProject\right_shot3.mp4');
    
    %frame
    imL = cell(frameCount, 1);
    imR = cell(frameCount, 1);
    frameIdx = 1;
    frameCounter = 0;  
    while hasFrame(videoL)
        frame = readFrame(videoL);
        if(mod(frameCounter, space)==0) && (frameCounter > beginIdx*space)
            %read frame
            imL{frameIdx} = frame;
            if isDispImg == true
                figure();
                imshow(imL{frameIdx});
            end
            frameIdx = frameIdx+1;
        end
        frameCounter = frameCounter + 1;
        if(frameIdx > frameCount)
            break;
        end
    end
    
    frameIdx = 1;
    frameCounter = 0;
    while hasFrame(videoR)
        frame = readFrame(videoR);
        if(mod(frameCounter, space)==0) && (frameCounter > beginIdx*space)
            %read frame
            imR{frameIdx} = frame;
            if isDispImg == true
                figure();
                imshow(imR{frameIdx});
            end
            frameIdx = frameIdx + 1;
        end
        frameCounter = frameCounter + 1;
        if(frameIdx > frameCount)
             break;
        end
    end
end