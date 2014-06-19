function show_image(X , y , K )
%SHOW_IMAGE Show a CAPTCHA image
%   Inputs:
%       X: 140x5 matrix, 5 digits in an image, each digit is a 140x1 vector.
%       y: the predict label
num = size(X, 2);
X = reshape(X, 14, 10*num);

ti = sprintf('K = %g Predict Y1=%g Y2=%g Y3=%g Y4=%g Y5=%g',K , y(1),y(2),y(3),y(4),y(5))

imagesc(X); colormap(gray); title(ti) ,axis image;

end