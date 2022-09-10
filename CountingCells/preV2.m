function final_image= preV2 (img)


thresh = multithresh(img,1);
BW = imquantize(img,thresh);

T = adaptthresh(img, 0);
BW_Adapt = imbinarize(img,T);

SE = strel('square',3);
final_image= imopen(BW_Adapt + BW,SE);

SE = strel('square',3);
final_image= imerode(final_image,SE);
final_image= imerode(final_image,SE);

final_image= imdilate(final_image,SE);
SE = strel('square',2);
final_image= imdilate(final_image,SE);

ff = final_image > 1;
final_image (ff ) = 1;
final_image (~ff ) = 0;

end