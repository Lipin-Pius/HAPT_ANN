/* Main Script */
load('traindata.mat');
train_X=X;
train_y=y;
clear X y;
load('testdata.m');
test_X=X;
test_y=y;
clear X y;
for i=10:5:100
 /*NO.OF HIDDEN NODES AFTER 100 i=150:50:600 IS USED*/
fid=fopen("result1.mat","a+");
for j=[0.5 0.1 0.05 0.01 0.005 0.001]/*LEARNING RATE*/
for k = [100 150 200] /*NO.OF ITERATIONS*/

[Theta1 Theta2]=train(i,j,k,train_X,train_y); 
/*TRAINING NEURAL NETWORK*/
accuracy=ex3_nn(Theta1,Theta2,test_X,test_y);
 /*EVALUATING THETRAINED  NEURAL NETWORK*/
fprintf(fid,"%d\t%0.3f\t%d\t%0.5f\n",i,j,k,accuracy);
 /*STORING THE OUTPUT*/

endfor
endfor
fclose(fid);
endfor	
clear all;

/* End of Main Script */


/* TRAIN FUNCTION 'train.m' */

function [Theta1 Theta2]
 =train_script(hidden_layer_size,lambda,iter,X,y)

m = size(X, 1);

input_layer_size  = 561;  
  
num_labels = 12;
% Unroll parameters 
initial_Theta1 = randInitializeWeights(
 input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(
 hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

options = optimset('MaxIter', iter);
costFunction = @(p) nnCostFunction(p, input_layer_size
 , hidden_layer_size, num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction,
 initial_nn_params, options);


Theta1 = reshape(nn_params(1:hidden_layer_size 
* (input_layer_size + 1)), hidden_layer_size,
 (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size 
* (input_layer_size + 1))):end), num_labels,
 (hidden_layer_size + 1));

clear lambda X y cost costFunction hidden_layer_size
 initial_Theta1 initial_Theta2 initial_nn_params
  input_layer_size m nn_paprams num_labels options;
end

/* EVALUATION FUNCTION 'ex3_nn.m' */


function accuracy = ex3_nn(Theta1,Theta2,X,y)

pred = predict(Theta1, Theta2, X);

accuracy = mean(double(pred == y)) * 100;
clear Theta1 Theta2 X ans hidden_layer_size
 input_layer_size m num_labels pred rp sel y;

end


