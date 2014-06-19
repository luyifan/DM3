img = imread('sample0.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
% YOUR (TWO LINE) CODE HERE
K=[8,16,32,64];
for i=1:length(K)
    [idx, ctrs, iter_ctrs] = kmeans(fea, K(i));
    fea(:,:)=ctrs(idx(:),:);
    figure;
    title(K(i));
    imshow(uint8(reshape(fea, size(img))));
    hold on;
end