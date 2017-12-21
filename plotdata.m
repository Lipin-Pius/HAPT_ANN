load('iter_150.mat');
plot3(iter_150(:,2),iter_150(:,1),iter_150(:,3));


ylabel('No.of Hidden Layers');
xlabel('lambda');
zlabel('% of Accuracy');
title('No.of Iteration=150, stepfactor = 5');
clear;

