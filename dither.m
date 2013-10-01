%% Problem 1 HW 2 - Dithering

function [g,fhatn] = dither(f,N)

%f = double(imread('boat.png'));

%N = 3;
[H,W,channels] = size(f);

%% Assume 8-bit starting image

fmin = min(f(:));
fmax = max(f(:));

deltaF = round((fmax - fmin) / (2^(N+1)));
noise = (rand(H,W) - .5) * 2*deltaF;

fn = f + noise;

%% calculate G
g = round((f(:)/(2*deltaF) - .5));
g = reshape(g,H,W,channels);

%% calculate g with noise added
gn = round((fn(:)/(2*deltaF) - .5));
gn = reshape(gn,H,W,channels);

%push negative numbers to 0
g(find(g<0)) = 0;
gn(find(gn<0)) = 0;
gn(find(gn>(2^N-1))) = 2^N - 1;

% give estimation of f
fhat = g*((fmax-fmin)/2^N) + deltaF/2;
%fhatn= gn*((fmax-fmin)/2^N) + deltaF/2;
fhatn = gn*2*deltaF + deltaF;

%% Display Output

imshow(fhatn/255);
title('Dithered Quantization');