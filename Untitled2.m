%[timenode, S, I,S1, I1, Percent] = NonlinearSIS1(sigma, finaltime, interval) 

% 改变alpha
% percent=截断； 截断的不变号 = 直线
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.05,0.2,20);
plot(timenode,Percent,'g');  %绿
hold on
% percent1=不截断 ；不截断的变号 = 虚线
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.05,0.2,20);
plot(timenode,Percent1,'--');

% percent=截断； 截断的不变号
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.052,0.2,20);
plot(timenode,Percent,'b');  
hold on
% percent1=不截断 ；不截断的变号 
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.052,0.2,20);
plot(timenode,Percent1,'--');



