%[timenode, S, I,S1, I1, Percent] = NonlinearSIS1(sigma, finaltime, interval) 

% 改变\interval
% percent=截断； 截断的不变号
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,2000);
plot(timenode,Percent,'g');  %绿
hold on
% percent=截断； 截断的不变号
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,2000); % 1500
plot(timenode,Percent,'b');  
hold on
% percent1=不截断 ；不截断的变号
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,2000);
plot(timenode,Percent1,'--');
% percent1=不截断 ；不截断的变号
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,1500);
plot(timenode,Percent1,'--');

legend('h=0.005 with trancation','h=0.007 with trancation','h=0.005 without trancation','h=0.007 without trancation')


