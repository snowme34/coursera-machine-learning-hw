function [imageD] = imageD(imagee)

%Works only for 8-pixel 255

imagee = double(imagee);
imagee = imagee(:);
me = mean(imagee);
range = max(imagee) - min(imagee);

imageD = bsxfun(@minus,imagee,me)/range;


end

