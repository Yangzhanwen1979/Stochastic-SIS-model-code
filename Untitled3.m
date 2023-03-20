%[timenode, S, I,S1, I1, Percent] = NonlinearSIS1(sigma, finaltime, interval) 

% 改变\sigmma
% percent=截断； 截断的不变号
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.3,10,1000);
plot(timenode,Percent,'g');  %绿
hold on
% percent=截断； 截断的不变号
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.32,10,1000);
plot(timenode,Percent,'b');  %蓝

% percent1=不截断 ；不截断的变号 = 虚线
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.3,10,1000);
plot(timenode,Percent1,'--');  
%hold on
% percent1=不截断 ；不截断的变号 = 虚线
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.32,10,1000);
plot(timenode,Percent1,'--');

legend('\sigma=0.3 with trancation','\sigma=0.32 with trancation','\sigma=0.3 without trancation','\sigma=0.32 without trancation')




