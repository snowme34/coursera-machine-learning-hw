function [gradApprox] = gradApprox(theta)
            


epsilon = 10^(-4);
n = size(theta,1);
for i = 1:n,
thetaPlus = theta;
thetaPlus(i) = theta(i) + epsilon;
thetaMinus = theta;
thetaMinus(i) = theta(i) - epsilon;
gradApprox(i) = (testF(thetaPlus(i)) - testF(thetaMinus(i)))/(2*epsilon);
end;