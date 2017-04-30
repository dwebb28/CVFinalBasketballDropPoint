%init counter = 1, added by frame counter
%radi in this project should be around 12
function result = DrawPredict(video, cen, radi, beginIdx, space)
    [cen_num, coordNum] = size(cen);
    counter = 1;
    %circleList = zeros(cen_num, 1);
    center = zeros(1,2);
    figure();
    frameCounter = 1;
    %output video
    outputVideo = VideoWriter(fullfile('output.mp4'));
    outputVideo.FrameRate = video.FrameRate;
    open(outputVideo)
    while hasFrame(video)
        frame = readFrame(video);
        if (mod(frameCounter, space)==0)
            imshow(frame);
            if(frameCounter*space >= beginIdx)
                %circle
                for i=counter:cen_num
                    center(1) = cen(i, 1);
                    center(2) = cen(i, 2);
                    viscircles(center,abs(radi(i)));
                end
                %writeVideo(outputVideo,frame);
                counter = counter+1;
                %w = waitforbuttonpress;
            end
            f = getframe(gca);
            frame = frame2im(f);
            writeVideo(outputVideo,frame);
        end
        frameCounter = frameCounter+1;
    end
    close(outputVideo);
    result = 1;
end