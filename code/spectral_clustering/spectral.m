function idx = spectral(W, k)
%SPECTRUAL spectral clustering
%   Input:
%     W: Adjacency matrix, N-by-N matrix
%     k: number of clusters
%   Output:
%     idx: data point cluster labels, n-by-1 vector.

% YOUR CODE HERE
D=diag(sum(W));
L=D-W;
[newW , eigenValue ] = eigs ( L , k , 'SA');

idx = kmeans( newW, k ) ;
end
