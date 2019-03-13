function [Gaussian] = gau(x)

m = size(x,1);

% The following function can only compute 1 dimention data, needing
% editing.

% size(u) should be m*1
% size(sigma_sq) should be m*m

u = (1/m)*sum(x);
sigma_sq = (1/m)*sum((x-u)*(x-u)');

% u is the mean of the data x
% sigma_sq is the square of variance sigma
% sigma is the normal variance


f1 = 1/(sigma_sq*(2*pi)^2);
f2 = exp(-(1/2)*((x-u)/sigma_sq).^2);

% n is the number of different features
% every features has m data in it

%f3 = 1/(sigma_sq*(2*pi)^(m/2));
%f4 = exp( (-1/2) * ((x-u)') * (sigma_sq^(-1)) * (x-u) );


Gaussian = f;
%Gaussiann = ff;

end

