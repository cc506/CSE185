function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)

    %% apply FFT
    imgHeight = size(img,1);
    imgWidth = size(img,2);
    frequency_map = fft2(img);
    %figure, imshow( log(abs(frequency_map) + 1), []);
    
    
    %% shift the frequency map
    frequency_map_shifted = fftshift(frequency_map);

    %% compute low-frequency mask
    % create a rectangular mask whose:
    %       height = ratio * image height
    %       width = ratio * image width
    %       center of the rectangle is the center of the input image
    
    height = ratio * imgHeight/2;
    width = ratio * imgWidth/2;
    centerH = imgHeight/2;
    centerW = imgWidth/2;

    mask = zeros(size(img));
    mask(centerH - height : centerH + height , centerW - width : centerW + width, :) = 1;
    
    %% separate low-frequency and high-frequency maps
    low_frequency_map_shifted = frequency_map_shifted .* mask;
    high_frequency_map_shifted = frequency_map_shifted .* (1 - mask);
    
    %% shift frequency maps back
    low_frequency_map = ifftshift(low_frequency_map_shifted);
    high_frequency_map = ifftshift(high_frequency_map_shifted);
    
    %% apply Inverse FFT
    low_pass_img = real(ifft2(low_frequency_map)); % change frequency_map to your low-frequency map
    high_pass_img = real(ifft2(high_frequency_map)); % change frequency_map to your high-frequency map
    
end