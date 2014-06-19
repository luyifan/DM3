function getTrainData 
X_train=[];
y_train=[];
y_array = [ [ 2 , 4 , 4 , 1 , 0 ];
            [ 7 , 0 , 0 , 5 , 7 ];
            [ 2 , 4 , 6 , 3 , 5 ];
            [ 3 , 2 , 0 , 0 , 7 ];
            [ 5 , 3 , 3 , 3 , 5 ];
            [ 1 , 1 , 3 , 0 , 5 ];
            [ 2 , 3 , 7 , 0 , 7 ];
            [ 5 , 5 , 5 , 0 , 3 ];
            [ 1 , 5 , 6 , 7 , 2 ];
            [ 0 , 0 , 7 , 3 , 4 ];
            [ 6 , 6 , 4 , 1 , 3 ];
            [ 1 , 0 , 2 , 5 , 8 ];
            [ 0 , 8 , 7 , 0 , 6 ];
            [ 5 , 2 , 1 , 5 , 4 ];
            [ 5 , 4 , 0 , 6 , 1 ];
            [ 3 , 7 , 2 , 7 , 5 ];
            [ 6 , 6 , 2 , 6 , 7 ];
            [ 6 , 1 , 8 , 8 , 0 ];
            [ 1 , 6 , 2 , 8 , 5 ];
            [ 2 , 7 , 1 , 4 , 1 ] ];
for i = 1:20 
 filename = strcat('data/' , int2str (i) );
 filename = strcat ( filename , '.png' );
 X = extract_image( filename );
 y = y_array ( i , : );
 X_train = [ X_train , X ] ;
 y_train = [ y_train , y ] ;
end
save hack_data X_train y_train
end