gears0 = imread('GearsAndWashers.png');
gears_bin = edge(gears0, 'Sobel');

%imwrite(gears_bin, 'gears2_bin.png')

strel_hor = strel('line', 3, 0);
strel_ver = strel('line', 3, 90);
gears_dil = imdilate(gears_bin, strel_hor);
gears_dil = imdilate(gears_dil, strel_ver);
gears_dil = imfill(gears_dil, 'holes');

%imwrite(gears_dil, 'gears2_dil.png')

gears_lab = bwlabel(gears_dil);
max_val = max(reshape(gears_lab, 1, []));
gears_lab = double(gears_lab) / max_val * 255;

%vislabels(gears_lab)

imshow(gears0)
hold on
boundaries = bwboundaries(gears_lab);

for i = 1:length(boundaries)
    boundary = boundaries{i};
    plot(boundary(:, 2), boundary(:, 1), 'r', ...
    'LineWidth', 2)
end