load('TDT2_data', 'fea', 'gnd');
K=size ( unique ( gnd ) , 1 ) ;
% YOUR CODE HERE
options=[];
options.NeighborMode='KNN';
options.WeightMode='HeatKernel';
options.k=K;
W=constructW( fea , options);

times = 100 ;
AC_spectral = 0 ;
MIhat_spectral = 0 ;
AC_kmeans = 0 ;
MIhat_kmeans=0;
for i=1:times
    trainLabel=spectral ( W , K ) ;
    trainLabel=bestMap ( gnd , trainLabel ) ;
    AC_spectral = AC_spectral + length ( find ( gnd == trainLabel ) )/ length ( gnd ) ;
    MIhat_spectral = MIhat_spectral + MutualInfo ( gnd , trainLabel ) ;

    trainLabel=litekmeans( fea , K ) ;
    trainLabel=bestMap ( gnd , trainLabel ) ;
    AC_kmeans = AC_kmeans + length ( find ( gnd == trainLabel ) ) /length ( gnd ) ;
    MIhat_kmeans = MIhat_kmeans + MutualInfo ( gnd , trainLabel ) ;
end
AC_spectral=AC_spectral/times;
MIhat_spectral=MIhat_spectral/times;
AC_kmeans=AC_kmeans/times;
MIhat_kmeans=MIhat_kmeans/times;
fprintf ( 'Total times %d , Spectral: Avg accracy : %f Avg mihtat :%f\n' , times , AC_spectral , MIhat_spectral );
fprintf ( 'Total times %d , Kmeans: Avg accracy : %f Avg mihtat :%f\n' , times , AC_kmeans , MIhat_kmeans ) ;