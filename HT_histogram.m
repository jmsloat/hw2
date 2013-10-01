%% Half-Toning Histogram
function g = HT_histogram(f);
%f = double(imread('boat.png'));

[M,N,channels] = size(f);

g(f(:,:) < median(f(:))) = 0;
g(f(:,:) >= median(f(:))) = 1;


g = reshape(g,M,N,channels);


