function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);
qwe = zeros(n,m);

mu = (1/m)*sum(X)';
%mean
%sigma2 = (1/m)*(bsxfun(@minus,X,mu))*bsxfun(@minus,X,mu)';
%qwe = ((bsxfun(@minus,X',mu)').^2)';

sigma2 = (1/m)*sum(((bsxfun(@minus,X',mu)').^2)',2);
%for i = 1:n
%    sigma2(i,1) = (1/m)*sum(qwe(i,:));
%end

%sigma2 = var([zeros(m,1) X])';
%sigma2 = var(X)';
%mu = mu';
%sigma2 = sigma2';

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%


%mu(i) = (1/m)*sum(x(i,:));
%sigma2 = (1/m)*sum((x(i,:)-mu(i))*(x(i,:)-mu(i))');



%f1 = 1/(sigma_sq*(2*pi)^2);
%f2 = exp(-(1/2)*((x-u)/sigma_sq).^2);

% n is the number of different features
% every features has m data in it

%f3 = 1/(sigma_sq*(2*pi)^(m/2));
%f4 = exp( (-1/2) * ((x-u)') * (sigma_sq^(-1)) * (x-u) );


%Gaussian = f;
%Gaussiann = ff;













% =============================================================


end
