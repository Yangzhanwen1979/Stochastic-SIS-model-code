%[timenode, S, I,S1, I1, Percent] = NonlinearSIS1(sigma, finaltime, interval) 

% �ı�alpha
% percent=�ضϣ� �ضϵĲ���� = ֱ��
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.05,0.2,20);
plot(timenode,Percent,'g');  %��
hold on
% percent1=���ض� �����ضϵı�� = ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.05,0.2,20);
plot(timenode,Percent1,'--');

% percent=�ضϣ� �ضϵĲ����
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.052,0.2,20);
plot(timenode,Percent,'b');  
hold on
% percent1=���ض� �����ضϵı�� 
[timenode, S, I, S1, I1, Percent, Percent1] = NonlinearSIS2(0.052,0.2,20);
plot(timenode,Percent1,'--');



