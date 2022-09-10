function out = RGBMid(noisyRGB, k)

    % Extract the individual red, green, and blue color channels.
    redChannel = noisyRGB(:, :, 1);
    greenChannel = noisyRGB(:, :, 2);
    blueChannel = noisyRGB(:, :, 3);
    
    
    % Median Filter the channels:
    redMF = medfilt2(redChannel, [k k]);
    greenMF = medfilt2(greenChannel, [k k]);
    blueMF = medfilt2(blueChannel, [k k]);
    
    % Find the noise in the red.
    noiseImage = (redChannel == 0 | redChannel == 255);
    % Get rid of the noise in the red by replacing with median.
    noiseFreeRed = redChannel;
    noiseFreeRed(noiseImage) = redMF(noiseImage);
    % Find the noise in the green.
    noiseImage = (greenChannel == 0 | greenChannel == 255);
    % Get rid of the noise in the green by replacing with median.
    noiseFreeGreen = greenChannel;
    noiseFreeGreen(noiseImage) = greenMF(noiseImage);
    % Find the noise in the blue.
    noiseImage = (blueChannel == 0 | blueChannel == 255);
    % Get rid of the noise in the blue by replacing with median.
    noiseFreeBlue = blueChannel;
    noiseFreeBlue(noiseImage) = blueMF(noiseImage);
    % Reconstruct the noise free RGB image
    out = cat(3, noiseFreeRed, noiseFreeGreen, noiseFreeBlue);



end