close all;
clear;
clc;

I = imread("binary7.png"); % read image

G = rgb2gray(I); %converting image to grayscalee

BW = G<128; % converting grayscale image to binary image

%BW = ~BW;%invert image

[rows, cols] = size(BW);
labels = zeros(rows,cols);%matrix to store labels for connected components

currentLab = 0;

for r= 1:rows
    for c = 1:cols

        %checking if pixel belongs to an object1 // labeled yet
        if BW (r,c) ==1 && labels(r,c) ==0

            currentLab = currentLab +1;%new compenent - inc label number
            stack = [r,c];

            %while stack not empty
            while ~isempty(stack) 
                pixel = stack(end, :);%take last pixel from satck
                stack(end,:)= [];%remove last pixel from stak

                x= pixel(1);%row
                y = pixel(2);%col


                %checking if the pixel is inside image boundaries
                if x>=1 && x<=rows && y>=1 && y<=cols
                    
                    if BW(x,y) ==1 && labels(x,y)==0

                    labels(x,y) = currentLab; % Assign label to the current pixel
                    stack = [stack; x+1 y; x-1 y; x y+1; x y-1]; % Add neighboring pixels to stack
                    
                             
                    end
                end
            end
        end
    end
end


%[L,num] = bwlabel(BW, 8);


%RGB = label2rgb(L, 'jet', 'white', 'shuffle');

figure
imagesc(labels) %display label matrix
%colormap(jet)
colormap([0 1 0; lines(currentLab)])
%imshow(RGB)
colorbar %to display color scalebar
axis image
title('Connected Components in Different colors');

disp(currentLab)
%imwrite(RGB, 'connectedbinary7.png');
