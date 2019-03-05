function [output, match] = template_matching_normcorr(img, template, threshold)
    
    output = img;
    var_u = floor(size(template,1)/2);
    var_v = floor(size(template,2)/2);

    %zero pad
    I1 = zeros(size(img,1)+var_u*(2),size(img,2)+var_v*(2));
    I1(1 + var_u: size(I1, 1)- var_u,1 + var_v: size(I1, 2)- var_v) = img;
    
    %% your code here
    for u = 1 + var_u: size(I1, 1)- var_u
        for v = 1 + var_v: size(I1, 2)- var_v
            
            x1 = u - var_u; x2 = u + var_u;
            y1 = v - var_v; y2 = v + var_v;
            patch = I1(x1:x2, y1:y2);

            % normcorr
            patch_m = mean(patch(:));
            template_m = mean(template(:));

            patch = patch(:) - patch_m;
            template = template(:) - template_m;
            patch_n = patch / (norm(patch));
            template_n = template/ (norm(template));

            value = dot(patch_n,template_n);
            output(u - var_u, v - var_v) = value;

        end
    end
    
    %% threshold
    match = (output > threshold);
    
end