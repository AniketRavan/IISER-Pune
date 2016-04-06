function [imrgb,bw] = edgeTemp(im)
win = 7;
stdim = stdfilt(im,ones(win,win));
stdim = mat2gray(stdim);
thresh = graythresh(stdim);
bw = im2bw(stdim,thresh);
bw = imfill(bw,'holes');
perim = bwperim(bw);
imrgb = repmat(im,[1,1,3]);
[i,j] = find(perim == 1);
for l = 1:length(i)
    imrgb(i(l),j(l),1) = 1;
end
%imshow(imrgb);