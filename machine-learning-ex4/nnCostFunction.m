function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%2 layer nn

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1);

%Target

J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

%Feedforward
eye_matrix = eye(num_labels);
y_matrix = eye_matrix(y,:);

a1 = [ones(m,1) X];
z2 = a1*Theta1';
a2= sigmoid(z2);
a2 = [ones(size(a2, 1),1) a2];
z3 = a2*Theta2';
a3 = sigmoid(z3);

h = a3;

J = 0;
R = (lambda / (2 * m)) * (sum(sum(Theta1(:,2:size(Theta1,2)).^2))+sum(sum(Theta2(:,2:size(Theta2,2)).^2)));
J = 1/m*sum(sum((-y_matrix.*log(h)-(1-y_matrix).*log(1-h)))) + R;

%Backpropagation

d3 = a3 - y_matrix;
d2 = (d3 * Theta2(:,2:end)) .* sigmoidGradient(z2);
D1 = d2' * a1;
D2 = d3' * a2;

Theta1_grad = (1/m) * (D1);
Theta2_grad = (1/m) * (D2);

%Reg

Theta1_grad = (1/m) * (D1) + (lambda/m)*[zeros(size(Theta1,1),1) Theta1(:,2:end)];
Theta2_grad = (1/m) * (D2) + (lambda/m)*[zeros(size(Theta2,1),1) Theta2(:,2:end)];

%grad

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
