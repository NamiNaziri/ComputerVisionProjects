function processedImage = Processing_V2(image)

image = imadjust(rgb2gray(image));

[Gmag, Gdir] = imgradient(image,'prewitt');
normImage = mat2gray(Gmag);
Gmag = im2double(normImage);
 
level = graythresh(image);
mask = imbinarize(image,level);
se = strel('disk',25);
mask = imerode(mask,se);
Gmag(imcomplement(mask)) = 0;

level = graythresh(Gmag);
processedImage = imbinarize(Gmag,level);


end