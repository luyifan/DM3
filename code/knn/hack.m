function digits = hack(img_name)
%HACK Recognize a CAPTCHA image
%   Inputs:
%       img_name: filename of image
%   Outputs:
%       digits: 1x5 matrix, 5 digits in the input CAPTCHA image.

load('hack_data');
% YOUR CODE HERE
X = extract_image ( img_name );
K=3;
X=double ( X );
X_train = double ( X_train );
y=knn(X, X_train, y_train, K);


show_image ( X , y ,K );
end