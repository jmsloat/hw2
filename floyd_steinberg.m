%% Floyd-Steinberg Dithering

function [h,fhat_h] = floyd_steinberg(f,N)

%f = double(imread('boat.png'));
%N = 3;

[H,W,channels] = size(f);

%pad f with zeros so we don't have to worry about corner / edge cases in
%the loop
fpad = zeros(H+2,W+2);
fpad(2:1:H+1,2:1:W+1) = f;

fmax = max(f(:));
fmin = min(f(:));

dF = round((fmax-fmin) / 2^(N+1));
fhat_h = zeros(H,W);

for x = 2:H+1
    for y = 2:W+1
        h(x-1,y-1) = round(fpad(x,y)/(2*dF) - .5);
        fhat_h(x-1,y-1) = fmin + h(x-1,y-1)*2*dF + dF;
        e = fhat_h(x-1,y-1) - fpad(x,y);
        fpad(x,y+1) = fpad(x,y+1) - (7/16)*e;
        fpad(x+1,y-1) = fpad(x+1,y-1) - (3/16)*e;
        fpad(x+1,y) = fpad(x+1,y) - (5/16)*e;
        fpad(x+1,y+1) = fpad(x+1,y+1) - (1/16)*e;
    end
end

imshow(fhat_h/255);
title('Floyd-Steinberg Dithering');