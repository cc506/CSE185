function [magnitude, orientation] = sobel_feature(img)

    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
    
    %% Sobel filtering
    Gx = imfilter(img, Hx);
    Gy = imfilter(img, Hy);
    
    %% compute gradient magnitude and orientation

    magnitude = sqrt((Gx .* Gx) + (Gy .* Gy)); % change img to your gradient magnitude
    orientation = atan2(Gy, Gx); % change img to your gradient orientation
end