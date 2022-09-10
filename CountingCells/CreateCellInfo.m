%For part 2


function CreateCellInfo(img, fileName)

img = im2double(img);

labeledImage = LabelCellsInImage(img);

count = max(labeledImage(:));

for i=1: count
    massk = img;
    massk(labeledImage~=i) = 0;
    massk(labeledImage==i )= 255;
    
    J = img;
    J(~massk) = 0;
    
    J = im2uint8(J);
    
    sumOfBrightness = sum(J(:));
    logicalMask = logical(massk);
    
    Area(i,1) = sum(logicalMask(:));
    Average_Brightness(i,1) = sumOfBrightness / Area(i);
    Label(i,1) = i;

end

T = table(Label,Area,Average_Brightness);

writetable(T,fileName,'Sheet',1)
T(:,:)

%figure;imshow(img,[]);
%figure;imshow(labeledImage,[]);



end