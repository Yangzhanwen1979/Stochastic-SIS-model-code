
%已知参数
function [timenode, S, I,S1, I1, Percent,Percent1] = NonlinearSIS2(sigma, finaltime, interval)

Lambda=2000; beta=0.80; mu=30; gamma=5; alpha=2; 
%sigma=2;
m=1;
nonlinearfunction=@(x,y)1./(1+m*y);
%初值
initialS=10.0; initialI=0.5;
%时间步长
initialtime=0; 
%finaltime=1; interval=100;
stepsize=(finaltime - initialtime)/interval;
timenode = initialtime :stepsize : finaltime;
%随机信息
randn('state',100)
samplenumber=4000;
dW = randn(samplenumber,length(timenode)-1);
dW1=dW;
TruncateA = sqrt(abs(2*log(stepsize)));
TruncateI = dW>=TruncateA;
dW(TruncateI) = TruncateA;
TruncateI = find(dW<=-TruncateA);
dW(TruncateI) = -TruncateA;
S=zeros(samplenumber,length(timenode)-1); I=zeros(samplenumber,length(timenode)-1);
S(:,1)= initialS*ones(samplenumber,1); I(:,1)=initialI*ones(samplenumber,1);
for i=1:length(timenode)-1
  Temp=1-stepsize*(beta*nonlinearfunction(S(:,i),I(:,i)).*S(:,i)-mu-gamma-alpha);
  I(:,i+1)=  1./Temp.*(1+sqrt(stepsize)*sigma*nonlinearfunction(S(:,i),I(:,i)).*S(:,i).*dW(:,i)).*I(:,i);
  S(:,i+1)= 1/(1+stepsize*mu)*(S(:,i)+stepsize*(Lambda-beta*nonlinearfunction(S(:,i),I(:,i)).*S(:,i).*I(:,i+1)+gamma*I(:,i+1))...
      -sqrt(stepsize)*sigma*nonlinearfunction(S(:,i),I(:,i)).*S(:,i).*I(:,i).*dW(:,i));
end
%plot(timenode,I)
%plot(timenode,S,timenode,I)
S1=zeros(samplenumber,length(timenode)-1); I1=zeros(samplenumber,length(timenode)-1);
S1(:,1)= initialS*ones(samplenumber,1); I1(:,1)=initialI*ones(samplenumber,1);
for i=1:length(timenode)-1
  Temp=1-stepsize*(beta*nonlinearfunction(S1(:,i),I1(:,i)).*S1(:,i)-mu-gamma-alpha);
  I1(:,i+1)=  1./Temp.*(1+sqrt(stepsize)*sigma*nonlinearfunction(S1(:,i),I1(:,i)).*S1(:,i).*dW1(:,i)).*I1(:,i);
  S1(:,i+1)= 1/(1+stepsize*mu)*(S1(:,i)+stepsize*(Lambda-beta*nonlinearfunction(S1(:,i),I1(:,i)).*S1(:,i).*I1(:,i+1)+gamma*I1(:,i+1))...
      -sqrt(stepsize)*sigma*nonlinearfunction(S1(:,i),I1(:,i)).*S1(:,i).*I1(:,i).*dW1(:,i));
end
Percent = zeros(size(timenode));
Index = 1:samplenumber;
for i = 1 : length(Percent)-1
    Index1 = find(I(Index,i)>0);
    Percent(i+1) = Percent(i) + length(Index) - length(Index1);
    Index = Index1;
end
Percent = Percent/samplenumber;
Percent1 = zeros(size(timenode));
Index = 1:samplenumber;
for i = 1 : length(Percent1)-1
    Index1 = find(I1(Index,i)>0);
    Percent1(i+1) = Percent1(i) + length(Index) - length(Index1);
    Index = Index1;
end
Percent1 = Percent1/samplenumber;

%plot(timenode,Percent)
end