%[timenode, S, I,S1, I1, Percent] = NonlinearSIS1(sigma, finaltime, interval) 

% �ı�\sigmma
% percent=�ضϣ� �ضϵĲ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.3,10,1000);
plot(timenode,Percent,'g');  %��
hold on
% percent=�ضϣ� �ضϵĲ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.32,10,1000);
plot(timenode,Percent,'b');  %��

% percent1=���ض� �����ضϵı�� = ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.3,10,1000);
plot(timenode,Percent1,'--');  
%hold on
% percent1=���ض� �����ضϵı�� = ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS3(0.32,10,1000);
plot(timenode,Percent1,'--');

legend('\sigma=0.3 with trancation','\sigma=0.32 with trancation','\sigma=0.3 without trancation','\sigma=0.32 without trancation')




