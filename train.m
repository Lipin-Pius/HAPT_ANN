function [Theta1 Theta2]=train_script(hidden_layer_size,lambda,iter,X,y)



%load('traindata.mat');
m = size(X, 1);

input_layer_size  = 561;  
  
num_labels = 12;

%Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
%Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters 
%nn_params = [Theta1(:) ; Theta2(:)];




%lambda = 0;

%J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);





initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];



options = optimset('MaxIter', iter);

%lambda = 0.001;

costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);


Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));


%pred = predict(Theta1, Theta2, X);

%fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
clear lambda X y cost costFunction hidden_layer_size initial_Theta1 initial_Theta2 initial_nn_params input_layer_size m nn_paprams num_labels options;
end
