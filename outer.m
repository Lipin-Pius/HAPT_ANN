load('traindata.mat');
train_X=X;
train_y=y;
clear X y;
load('testdata.m');
test_X=X;
test_y=y;
clear X y;
for i=150:50:600
fid=fopen("result1.mat","a+");
    for j=[0.5 0.1 0.05 0.01 0.005 0.001]
		for k = [100 150 200]
	
				[Theta1 Theta2]=train(i,j,k,train_X,train_y);
				accuracy=ex3_nn(Theta1,Theta2,test_X,test_y);
				fprintf(fid,"%d\t%0.3f\t%d\t%0.5f\n",i,j,k,accuracy);
	
        endfor
    endfor
fclose(fid);
endfor	
clear all;
			
