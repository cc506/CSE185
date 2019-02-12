function img_filtered = median_filter(img, patch_size)

    % your code here
    I2 = zeros(size(img));
    var = floor(patch_size(1)/2);
    
    for u = 1 + var: size(img, 2)- var
        for v = 1 + var: size(img, 1)- var
            
            x1 = u - var; x2 = u + var;
            y1 = v - var; y2 = v + var;
            
            patch = img(y1:y2, x1:x2);
            
            patch = patch(:);
            value = median(patch);
            I2(v, u) = value;
        end
    end
    
    img_filtered = I2;
end
    