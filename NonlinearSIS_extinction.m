% extinction
%已知参数
Lambda=1.98; beta=0.5; mu=0.25; gamma=0.3; alpha=0.5; sigma=0.6;
m=1;
nonlinearfunction=@(x,y)1./(1+m*x);
%初值
initialS=8; initialI=0.5;
%时间步长
initialtime=0; finaltime=100; interval=10000;
stepsize=(finaltime - initialtime)/interval;
timenode = initialtime :stepsize : finaltime;
%随机信息
randn('state',100)
samplenumber=1000;
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
plot(timenode,I)
