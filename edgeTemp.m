% Written by Aniket Ravan 
% Github link: https://github.com/AniketRavan/IISER-Pune
% Last modified: 4/7/16
% Edge Detection using Standard deviation filter
function [imrgb,bw] = edgeTemp(im)
win = 7; %Size of window
stdim = stdfilt(im,ones(win,win));
stdim = mat2gray(stdim);
thresh = graythresh(stdim);
bw = im2bw(stdim,thresh);
bw = imfill(bw,'holes');
perim = bwperim(bw);
imrgb = repmat(im,[1,1,3]);
[i,j] = find(perim == 1);
for l = 1:length(i)
    imrgb(i(l),j(l),1) = 1; % Overlaying red colored edge over original image
end