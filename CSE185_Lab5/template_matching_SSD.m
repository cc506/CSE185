function [output, match] = template_matching_SSD(img, template, threshold)

    output = img;
    I2 = zeros(size(img));
    var = floor(template(1)/2);

    %% your code here
    for u = 1 + var: size(img, 2)- var
        for v = 1 + var: size(img, 1)- var
            
            x1 = u - var; x2 = u + var;
            y1 = v - var; y2 = v + var;
            patch = img(y1:y2, x1:x2);

            % SSD
            value = (patch - template).^2;
            value = value(:);
            value = sum(value);
            output(v, u) = value;

        end
    end
    
    %% threshold
    match = (output < threshold);
    
end