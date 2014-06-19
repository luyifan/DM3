function y = knn(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%

% YOUR CODE HERE
D=EuDist2(X',X_train',2);
[ SortedD , Location ]=sort ( D , 2 , 'ascend' );
Location = Location ( : , 1:K );
Location(:)=y_train(Location(:));
Unique=unique ( Location );
[M,N]=hist(Location',Unique);
[C,I]=max(M);
y=ones(1,size(X,2));
y(:)=N(I(:));
end

