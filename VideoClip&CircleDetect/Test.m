function result = Test()
    videoFReader = vision.VideoFileReader('left_shot3.mp4');
    videoPlayer = vision.VideoPlayer;
    counter = 0;
    center(1) = 500;
    center(2) = 500;
    radi = 15;
    while ~isDone(videoFReader)
        frame = step(videoFReader);
        break;
        step(videoPlayer,frame);
        viscircles(center,radi);
        if(counter == 0)
            w = waitforbuttonpress;
        end
        counter = counter+1;
    end
    figure();imshow(frame);
    xinput = ginput(1);
    hold all;
    plot(xinput(1,1), xinput(1,2), '*');
    disp(xinput(1,1));
    disp(xinput(1,2));
    
    release(videoFReader);
    release(videoPlayer);
    result = 1;
end