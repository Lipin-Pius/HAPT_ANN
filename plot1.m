load ("mydata.mat")
hi=mydata(:,1);
%lambda=mydata(:,2);
accu=mydata(:,4);

plot (hi,accu);
xlabel("Hidden layer");
ylabel("% precision");
title("test");
