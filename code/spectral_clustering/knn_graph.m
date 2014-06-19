function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.

% YOUR CODE HERE
N=size(X,1);
W=zeros(N,N);
[distance,index]=pdist2(X,X,'euclidean','Smallest',k);
for i=1:N
    for j =1:k
        if ( distance ( j, i ) < threshold )
            W( i , index ( j , i ) ) = exp ( - norm ( distance ( j , i ) ) / 2 );
            W ( index ( j , i ) , i ) = W ( i , index ( j , i ) );
        end
    end
end
end
