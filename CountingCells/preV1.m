function final_image= preV1 (img)


thresh = multithresh(img,1);
BW = imquantize(img,thresh);

T = adaptthresh(img, 0);
BW_Adapt = imbinarize(img,T);

SE = strel('square',3);
final_image= imopen(BW_Adapt + BW,SE);


ff = final_image > 1;
final_image (ff ) = 1;
final_image (~ff ) = 0;

end