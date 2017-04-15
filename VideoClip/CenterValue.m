function [cenR, cenG, cenB] = CenterValue(imClip, fsize, sigma)
    cenR = 0.0;
    cenG = 0.0;
    cenB = 0.0;
    %gaussian filter
    filter = fspecial('gaussian', [fsize, fsize], sigma);
    
    imR = imfilter(imClip(:,:,1), filter);
    imG = imfilter(imClip(:,:,2), filter);
    imB = imfilter(imClip(:,:,3), filter);
    
    cenR = imR(fsize+1,  fsize+1);
    cenG = imG(fsize+1,  fsize+1);
    cenB = imB(fsize+1,  fsize+1);
end