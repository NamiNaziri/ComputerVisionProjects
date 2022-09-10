%train 85.7106   87.8030   87.4971
%test  85.2628   89.7801   89.1573

%whole picture
% train 0.8480    0.9224    0.9157
% test 0.8436    0.9351    0.9268

clc; close all; clear;
%ImageDatasetPath = 'Training/images/';
%GT_DateseetPath = 'Training/1st_manual/';
%MaskDatasetPath = 'Training/mask/';

ImageDatasetPath = 'Test/images/';
GT_DateseetPath = 'Test/1st_manual/';
MaskDatasetPath = 'Test/mask/';

TrainDataset =  LoadDataset(ImageDatasetPath);
GT_Dateseet = LoadDataset(GT_DateseetPath);
MaskDataset = LoadDataset(MaskDatasetPath);




for imageNum=1:size(TrainDataset,1)
    
numOfImage = imageNum;

originalWidth = size(TrainDataset{numOfImage,2},2);
originalHeight = size(TrainDataset{numOfImage,2},1);     


OriginalMask = MaskDataset{numOfImage,2};
SE = strel('disk',5);
mask = imerode(OriginalMask,SE);

img = im2double(rgb2gray(TrainDataset{numOfImage,2}));


numOfThresh = 5;

T = im2uint8( adaptthresh(img));

level = multithresh(T,numOfThresh);
seg_I = imquantize(T,level);

final = logical(img*0);

for i=1: numOfThresh + 1
    massk = img;
    massk(seg_I~=i) = 0;
    massk(seg_I==i )= 255;

    J = img;
    J(~massk) = 0;
    
    S = customFilter(J,massk,15,15);
    S(~massk) = 0;
    k = 0.97;
    T = k*S;
    processedImage = J < T;
        
    
    

    final = final | processedImage;
end
final(~mask) = 0;

processedImage = bwareaopen(final, 4);
processedImage = bwmorph(processedImage,'bridge');
processedImage = bwmorph(processedImage,'bridge');
processedImage = bwmorph(processedImage,'spur');
processedImage = bwmorph(processedImage,'fill'); 
processedImage = bwmorph(processedImage,'fill'); 

SE = strel('disk', 1);
processedImage = imdilate(processedImage,SE);
SE = strel('square', 2);
processedImage = imerode(processedImage,SE);
SE = strel('square', 1);
processedImage = imerode(processedImage,SE);
SE = strel('square', 2);
processedImage = imdilate(processedImage,SE);
final = processedImage;


GT = GT_Dateseet{numOfImage,2};

[sen,spec,acc] = measure(final, GT);

Results(imageNum,1) = sen;
Results(imageNum,2) = spec;
Results(imageNum,3) = acc;


imageNum
end

[mean(Results(:,1)) mean(Results(:,2)) mean(Results(:,3))]



