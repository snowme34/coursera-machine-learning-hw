function [error_test] = error_test(Xtest, ytest,theta)

error_test = 0;

m = size(Xtest, 1);

lambda = 3;
    
h = Xtest*theta';
error_test = (1/(2*m))*(sum((h-ytest).^2));
    

end