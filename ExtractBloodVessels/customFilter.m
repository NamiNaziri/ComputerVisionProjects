function [finalPic] = customFilter(J,massk,filterKernelSizeHeight, filterKernelSizeWidth)
    picHeight = size(J,1);
    picWidth = size(J,2);
    
    massk = im2uint8(massk);
    colorVector = [];
    J = im2uint8(J);
    finalPic= J;

    for u=1: picHeight
        for v=1 : picWidth
            if(massk(u,v) == 255)
                for k= -floor(filterKernelSizeHeight/2) : floor(filterKernelSizeHeight/2)
                    for p= -floor(filterKernelSizeWidth/2) : floor(filterKernelSizeWidth/2)
                        if  u+k > 0 && u+k < picHeight && v+p > 0  && v+p < picWidth
                            if J(u+k, v+p) ~= 255 && J(u+k, v+p) ~= 0
                                colorVector(end+1) = J(u+k, v+p);
                            end
                        end

                    end
                end

                if size(colorVector) ~= 0
                    finalPic(u,v) = mean(colorVector);
                end
                colorVector =[];
            end

        end
    end
    finalPic = im2double(finalPic);
    
end