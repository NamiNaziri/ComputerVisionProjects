function processedImage = Processing_V1(image)

image = imadjust(rgb2gray(image));

[Gmag, Gdir] = imgradient(image,'prewitt');
normImage = mat2gray(Gmag);
Gmag = im2double(normImage);
 
level = graythresh(image);
mask = imbinarize(image,level);
se = strel('disk',25);
mask = imerode(mask,se);
Gmag(imcomplement(mask)) = 0;

S = imfilter(image, fspecial('disk', 55),'replicate');
processedImage = image >= max(S(:));


processedImage = dilated - erodded;
end