fea = importdata('matrix.txt');
K=5;
% YOUR CODE HERE
options=[];
options.NeighborMode='KNN';
options.WeightMode='HeatKernel';
options.k=K;
WW=constructW( double(W) , options);
trainLabel=spectral ( WW , K );
for i = 1:5
   size(find( trainLabel(:)==i))
end

f=fopen('ans.txt' ,'wt');
for i =1:size(trainLabel)
    fprintf( f , '%d %d\n' , i , trainLabel (i) )
end
fclose ( f );