function [idx, ctrs, iter_ctrs] = kmeans(X, K)
%KMEANS K-Means clustering algorithm
%
%   Input: X - data point features, n-by-p maxtirx.
%          K - the number of clusters
%
%   OUTPUT: idx  - cluster label
%           ctrs - cluster centers, K-by-p matrix.
%           iter_ctrs - cluster centers of each iteration, K-by-p-by-iter
%                       3D matrix.

% YOUR CODE HERE
maxiter=100 ;
N=size(X,1);
R=randperm(N);
ctrs=X(R(1:K),:);
idx = zeros ( 1 , N ) ;
iter = 0 ;
iter_ctrs=[];
while (1)
    for j=1:K
        center = ctrs(j,:);
        D(j,:)= EuDist2( X , center );
    end
    
    [ Dmin , index ] = min ( D ) ;
    
    oldmu = ctrs ;
    moved = sum ( index ~= idx ) ;
    idx = index ;
    for i = 1:K
        ci = find(idx==i);
        ctrs(i,:)=mean(X(ci,:));
    end
    if ( moved==0) 
        break;
    end
    iter=iter+1
    iter_ctrs(:,:,iter)=ctrs;
    if iter > maxiter 
        break;
    end
end

end
