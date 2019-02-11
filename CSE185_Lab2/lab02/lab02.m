% task 1
I = imread('01.jpg');
I2 = zeros(300, 400, 3, 'uint8');

for y1 = 1 : 275
    for x1 = 1 : 400
        
        I2(y1 + 25, x1, :) = I(y1, x1, :);
        
    end
end

figure, imshow(I2);
imwrite(I2, 'translate.jpg');

% task 2
I3 = zeros(300, 400, 3, 'uint8');

x0 = 400/2;
y0 = 300/2;
theta = 60;
for y1 = 1 : 300
    for x1 = 1 : 400
 
        x2 = (cosd(theta)*(x1-x0)) + (sind(theta)*(y1-y0)) + x0;
        y2 = (-sind(theta)*(x1-x0)) + (cosd(theta)*(y1-y0)) + y0;
        
        if(y2 >= 1 && y2 <= 300 && x2 >= 1 && x2 <= 400)
            y2 = round(y2, 0);
            x2 = round(x2, 0);
            
            I3(y2, x2, :) = I(y1, x1, :);
        
        end
    end
end

figure, imshow(I3);
imwrite(I3, 'rotateF.jpg');

%task3
I4 = zeros(300, 400, 3, 'uint8');

x0 = 400/2;
y0 = 300/2;
theta = 60;

mat = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
for y2 = 1 : 300
    for x2 = 1 : 400
        
        x1 = (cosd(theta)*(x2-x0)) + (-sind(theta)*(y2-y0)) + x0;
        y1 = (sind(theta)*(x2-x0)) + (cosd(theta)*(y2-y0)) + y0;
        
        if(y1 >= 1 && y1 <= 300 && x1 >= 1 && x1 <= 400)
            y1 = round(y2, 0);
            x1 = round(x2, 0);
            
            I4(y2, x2, :) = I(y1, x1, :);
            
        end
    end
end

figure, imshow(I4);
imwrite(I4, 'rotateB.jpg');

%task 5
I5 = I((end:-1:1), : , :);
figure, imshow(I5);
imwrite(I5, 'flip.jpg');

%task 6
I6 = I(1:2:300,1:2:400, :);
figure, imshow(I6);
imwrite(I6, 'scale.jpg');