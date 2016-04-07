% Written by Aniket Ravan 
% Github link: https://github.com/AniketRavan/IISER-Pune
% Last modified: 4/7/16
figure,
for i = 6
    if i < 10
        fname = ['40x-dic-egfp-pc12-ngfxy0',num2str(i),'c2.tif'];
    end
    if i >= 10
        fname = ['40x-dic-egfp-pc12-ngfxy',num2str(i),'c2.tif'];
    end
    info = imfinfo(fname);
    number_of_images = numel(info);
    %Read TIF Stack
    for k = 1:number_of_images
        im = imread(fname,k);
        im = mat2gray(im);
        im = medfilt2(im,[5,5]);
        % Edge detection using standard deviation filter
        [imrgb,bw] = edgeTemp(im);
        rprop = regionprops(bw,'Area','MajorAxisLength','MinorAxisLength','Perimeter');
        % Extracting region properties of the cell
        majax(k) = rprop.MajorAxisLength;
        minax(k) = rprop.MinorAxisLength;
        area(k) = rprop.Area;
        perim(k) = rprop.Perimeter;
        subplot(4,2,k), imshow(imrgb);
    end
end