function [row, col, radius]=houghAlgorithm(image)

processedImage = image;
height = size(processedImage,1);
width = size(processedImage,2);
d = round(sqrt(height*height + width*width));
 
H = zeros(1,1,1);

for r = 40 : 50
    rArrayIndex = r - 39;
    for i=1 : height
        for j=1 : width
            if(processedImage(i,j) > 0)
                 for tetha = 1 : 360
                    a = round(i - r*cos(tetha));
                    b = round(j - r*sin(tetha));
                    if(a > 0 && b > 0)
                        if(a > size(H,1) || b > size(H,2) || rArrayIndex > size(H,3))
                            H(a,b,rArrayIndex)= 1;

                        else
                            H(a,b,rArrayIndex) = H(a,b,rArrayIndex) + 1;
                        end
                    end
                 end
             end
         end
    end
     r
end
 
 ff = H(:);
 maxFF = max(ff);
 [row, col, page] = ind2sub(size(H), find(H == maxFF));
 radius = page + 39;

end