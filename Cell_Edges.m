 % Written by Aniket Ravan 
 % Github link: https://github.com/AniketRavan/IISER-Pune
 % Last modified: 4/7/16
 % Edge Detection using Sobel
 figure,
 for i = 6
     number_of_images = numel(info);
     %Read TIF Stack
     for k = 1:number_of_images
         im = imread(fname,k);
         imfull = imread(fname,k);
         im = imfull(800:950,670:880);
         im = mat2gray(im);
         im = medfilt2(im,[5,5]);
         % Noise-filtering
         im = medfilt2(im,[15,15]);
         im = wiener2(im,[5,5]);
         % Edge detection
         edg = edge(im,'Sobel');
         se1 = strel('disk',3);
         se2 = strel('disk',5);
         bw = imdilate(edg,se1);
         bw = imfill(bw,'holes');
         bw = imopen(bw,se2);
         bw = bwareaopen(bw,200);
         % Overlaying red colored edge over the original image
         edg = ~bwperim(bw);
         edg = repmat(edg,[1 1 2]);
         imrgb = repmat(im,[1 1 3]);
         imrgb(:,:,2:3) = imrgb(:,:,2:3).*edg;
         imrgb(imrgb(:,:,3) == 0) = 1;
          subplot(4,2,k), imshow(imrgb);
      end
  end 