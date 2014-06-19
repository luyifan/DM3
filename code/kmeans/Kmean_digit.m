load('digit_data.mat');
K=[10,20,50];
for i=1:length(K)
    [idx, ctrs, iter_ctrs] = kmeans(X, K(i));
    
    show_digit(ctrs);
end