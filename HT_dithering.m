%% Half- Tone Dithering
%function h = HT_dithering(f)

f = double(imread('boat.png'));

[M,N,channels] = size(f);
fhat = zeros(M,N);
for x=1:M
    for y=1:N
        r = rand();
        if(r > f(x,y)/255)
            fhat(x,y) = 0;
        else
            fhat(x,y) = 255;
        end
    end 
end

%r = rand();
%fhat(r > f(:,:)/255) = 0;
%fhat(r <= f(:,:)/255) = 255;