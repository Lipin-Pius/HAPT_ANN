function accuracy = ex3_nn(Theta1,Theta2,X,y)

%load('testdata.m');

pred = predict(Theta1, Theta2, X);

accuracy = mean(double(pred == y)) * 100;
clear Theta1 Theta2 X ans hidden_layer_size input_layer_size m num_labels pred rp sel y;
end

