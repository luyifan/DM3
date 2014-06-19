load('kmeans_data.mat');
K=2
times=10;
for i=1:times
    [idx, ctrs, iter_ctrs] = kmeans(X, K);
   
    kmeans_plot(X, idx, ctrs, iter_ctrs);
end