fid=fopen("mydata.mat","a+");
for i = 5:5:50
        for j = [0.5 0.1 0.05 0.01 0.005 0.001]
		h=0.552;
                for k = [100 150 200]
                        fprintf(fid,"%d\t%0.3f\t%d\t%0.5f\n",i,j,k,h);
			h+=5;
                endfor
		clear h;
        endfor
endfor
fclose(fid);

