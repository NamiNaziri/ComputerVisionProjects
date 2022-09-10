%For part 1

function labeledImage = LabelCellsInImage(img)

img = im2double(img);


final_image=preV1(img);
%final_image2=preV2(img);


% use the help of a bigger matrix
B=nan(size(final_image)+2);
B(2:end-1,2:end-1)=final_image;

% pre-define memory for result
tmpResult = 0*B;
result = 0 *final_image;
cellCount = 1;

% calculate!
for i=2:size(final_image,1)+1
  for j=2:size(final_image,2)+1
      
    if(B(i,j) == 1)
        if(tmpResult(i,j) == 0) % agar meghdar nadarad
            tmpResult(i,j) = cellCount;
            
            %function
            tmpResult = findNeighbours(B, tmpResult,i,j, cellCount);
            cellCount = cellCount + 1;
        end

    end
  end
end

labeledImage = tmpResult;
labeledImage(:,1) = [];
labeledImage(:,end) = [];
labeledImage(1,:) = [];
labeledImage(end,:) = [];

count = max(labeledImage(:));




end