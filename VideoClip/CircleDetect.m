% display image with ball
function result = CircleDetect(imL, imR)
    [framenumL, cellnum] = size(imL);
    [framenumR, cellnum] = size(imR);
    if(framenumL ~= framenumR)
        error('image frames count error');
    end
    frameCount = framenumL;
    avgSize = 7; %ball radi
    
    for idx = 1:frameCount
    %for idx = frameCount-1:frameCount   
        %circle detect
        figure();
        imshow(imL{idx});
        [Lcenters, Lradii] = imfindcircles(imL{idx},[10 20],'ObjectPolarity', 'dark', 'Sensitivity',0.95);
        [num, coordnum] = size(Lcenters);
        Lcenter = zeros(1,2);
        for i = 1:num
            Lcenter(1) = Lcenters(i,1);
            Lcenter(2) = Lcenters(i,2);
            imClip = imL{idx}(Lcenter(2)-avgSize:Lcenter(2)+avgSize,...
                              Lcenter(1)-avgSize:Lcenter(1)+avgSize, :);
            cenR = mean2(imClip(:,:,1));
            cenG = mean2(imClip(:,:,2));
%             cenR = imL{idx}(int16(Lcenter(2)),int16(Lcenter(1)),1);
%             cenG = imL{idx}(int16(Lcenter(2)),int16(Lcenter(1)),2);
%             cenB = imL{idx}(int16(Lcenter(2)),int16(Lcenter(1)),3);
            %basket ball feature
            if(cenR/cenG>1.5)
                Lradi = Lradii(i);
                viscircles(Lcenter,Lradi);
                %break;
            end
        end
        %R
        figure();
        imshow(imR{idx});
        %xinput = ginput(1);
        %try1 = imR{idx}(int16(xinput(1,2)),int16(xinput(1,1)),:);
        [Rcenters, Rradii] = imfindcircles(imR{idx},[10 20],'ObjectPolarity', 'dark', 'Sensitivity',0.95);
        [num, coordnum] = size(Rcenters);
        Rcenter = zeros(1,2);
        for i = 1:num
            Rcenter(1) = Rcenters(i,1);
            Rcenter(2) = Rcenters(i,2);
            imClip = imR{idx}(Rcenter(2)-avgSize:Rcenter(2)+avgSize,...
                              Rcenter(1)-avgSize:Rcenter(1)+avgSize, :);
            cenR = mean2(imClip(:,:,1));
            cenG = mean2(imClip(:,:,2));
            %basket ball feature
            if(cenR/cenG>1.2)
                Rradi = Rradii(i);
                viscircles(Rcenter,Rradi);
                %break; %only feature work perfect
            end
        end
        %viscircles(Rcenters,Rradii);
    end
end