%[timenode, S, I,S1, I1, Percent] = NonlinearSIS1(sigma, finaltime, interval) 

% �ı�\interval
% percent=�ضϣ� �ضϵĲ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,2000);
plot(timenode,Percent,'g');  %��
hold on
% percent=�ضϣ� �ضϵĲ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,2000); % 1500
plot(timenode,Percent,'b');  
hold on
% percent1=���ض� �����ضϵı��
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,2000);
plot(timenode,Percent1,'--');
% percent1=���ض� �����ضϵı��
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS1(0.4,10,1500);
plot(timenode,Percent1,'--');

legend('h=0.005 with trancation','h=0.007 with trancation','h=0.005 without trancation','h=0.007 without trancation')


