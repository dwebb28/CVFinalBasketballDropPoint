% display image with ball
% isCircleOnly == true: return image only contain ball.
function [LCenDisp, RCenDisp, LradiDisp, RradiDisp, LImgCircle, RImgCircle] = CircleDetect(imL, imR, isCircleOnly)
    [framenumL, cellnum] = size(imL);
    [framenumR, cellnum] = size(imR);
    if(framenumL ~= framenumR)
        error('image frames count error');
    end
    frameCount = framenumL;
    avgSize = 7; %ball radi
    
    LradiDisp=zeros(frameCount, 1);
    RradiDisp=zeros(frameCount, 1);
    LCenDisp = cell(frameCount, 1);
    RCenDisp = cell(frameCount, 1);
    LImgCircle = cell(frameCount, 1);
    RImgCircle = cell(frameCount, 1);
    yellow = uint8([255 255 0]); % [R G B]; class of yellow must match class of I
    red = uint8([255 0 0]);
    blue = uint8([0 0 255]);
%     shapeInserter = vision.ShapeInserter('Shape','Circles','Fill', true, 'FillColor','Custom',...
%                     'CustomFillColor',yellow, 'Opacity', 1.0);
    
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
                LradiDisp(idx, 1) = Lradi;
                LCenDisp{idx} = Lcenter;
                %draw circles
                shapeInserter = vision.ShapeInserter('Shape','Circles','Fill', true, 'FillColor','Custom',...
                    'CustomFillColor',yellow, 'Opacity', 1.0);
                circles = int32([Lcenter(1) Lcenter(2) Lradi/10]);
                LImgCircle{idx} = step(shapeInserter, imL{idx}, circles);
%                 shapeInserter = vision.ShapeInserter('Shape','Circles','Fill', true, 'FillColor','Custom',...
%                     'CustomFillColor',red, 'Opacity', 1.0);
%                 circles = int32([Lcenter(1) Lcenter(2) Lradi/3*2]);
%                 LImgCircle{idx} = step(shapeInserter, LImgCircle{idx}, circles);
%                 shapeInserter = vision.ShapeInserter('Shape','Circles','Fill', true, 'FillColor','Custom',...
%                     'CustomFillColor',blue, 'Opacity', 1.0);
%                 circles = int32([Lcenter(1) Lcenter(2) Lradi/3]);
%                LImgCircle{idx} = step(shapeInserter, LImgCircle{idx}, circles);                
                if isCircleOnly == true
                    LImgCircle{idx} = LImgCircle{idx}-imL{idx};      
                end
                %imshow( LImgCircle{idx});
                break;%only feature work perfect
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
                RradiDisp(idx, 1) = Rradi;
                RCenDisp{idx} = Rcenter;
                %draw circles
                shapeInserter = vision.ShapeInserter('Shape','Circles','Fill', true, 'FillColor','Custom',...
                    'CustomFillColor',yellow, 'Opacity', 1.0);
                circles = int32([Rcenter(1) Rcenter(2) Rradi/10]);
                RImgCircle{idx} = step(shapeInserter, imR{idx}, circles);
%                 shapeInserter = vision.ShapeInserter('Shape','Circles','Fill', true, 'FillColor','Custom',...
%                     'CustomFillColor',red, 'Opacity', 1.0);
%                 circles = int32([Rcenter(1) Rcenter(2) Rradi/3*2]);
%                 RImgCircle{idx} = step(shapeInserter, RImgCircle{idx}, circles);
%                 shapeInserter = vision.ShapeInserter('Shape','Circles','Fill', true, 'FillColor','Custom',...
%                     'CustomFillColor',blue, 'Opacity', 1.0);
%                 circles = int32([Rcenter(1) Rcenter(2) Rradi/3]);
%                 RImgCircle{idx} = step(shapeInserter,  RImgCircle{idx}, circles);                
                if isCircleOnly == true
                    RImgCircle{idx} = RImgCircle{idx}-imR{idx};      
                end
                imshow( RImgCircle{idx});
                break; %only feature work perfect
            end
        end
        %viscircles(Rcenters,Rradii);
    end
end