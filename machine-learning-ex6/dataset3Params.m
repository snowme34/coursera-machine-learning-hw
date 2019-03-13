function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
cc = [ 0.01 0.03 0.1 0.3 1 3 10 30]';
preValError = zeros(length(cc));
c11 = 0;
c22 = 0;
%preValErrorSingleC = 0;
%preValErrorSingleS = 0;
Error_min = 0;

for i = 1:length(cc)
    c1 = cc(i);
    for j = 1:length(cc)
        c2 = cc(j);
        model= svmTrain(X, y, c1, @(x1, x2) gaussianKernel(x1, x2, c2));
        predictions = svmPredict(model, Xval);
        preValError(i,j) = mean(double(predictions ~= yval));
    end
end

Error_min = min(preValError(:));
[c11,c22] = find(preValError == Error_min);
C = cc(c11);
sigma = cc(c22);

%[preValErrorSingleC,c11] = min(preValError);
%C = cc(c11);
%sigma = cc(c22);
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%







% =========================================================================

end
