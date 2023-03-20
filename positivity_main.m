%[timenode, S, I,S1, I1, Percent] = NonlinearSIS1(sigma, finaltime, interval) 
[timenode, S, I,S1, I1, Percent, Percent1] = NonlinearSIS1(1,10,100);
plot(timenode,Percent);
hold on
[timenode, S, I,S1, I1, Percent,Percent1] = NonlinearSIS1(1,10,100);
plot(timenode,Percent1);

