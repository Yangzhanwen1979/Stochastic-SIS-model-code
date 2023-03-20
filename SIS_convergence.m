% convergence收敛
Lambda=1.98; beta=0.5; mu=0.25; gamma=0.3; alpha=0.5; sigma=0.31;
m=4;
%nonlinearfunction=@(x,y)1;
nonlinearfunction=@(x,y)1./(1+m*x);
%初值
initialS=8; initialI=0.5;
%时间步长
initialtime=0; finaltime=1; interval=100.* 2.^[0,1,2,3,4,5];
stepsize = (finaltime - initialtime)/interval(end)
timenode = initialtime : stepsize : finaltime;
%随机信息
randn('state',100)
samplenumber=4000;
dW = sqrt(stepsize)*randn(samplenumber,length(timenode)-1);
Error=zeros(1,length(interval)-1);
Order=zeros(1,length(interval)-2);
SFinalValue=zeros(samplenumber,length(interval));IFinalValue=zeros(samplenumber,length(interval));
for j=1:length(interval)
Stepsize =(finaltime - initialtime)/interval(j);
Timenode = initialtime :Stepsize : finaltime;
DW=reshape(sum(reshape(dW, samplenumber, 2^(length(interval)-j), []), 2), samplenumber, []);
dW1=DW;
TruncateA = sqrt(abs(2*log(Stepsize)));
TruncateI = DW>=TruncateA;
DW(TruncateI) = TruncateA;
TruncateI = find(DW<=-TruncateA);
DW(TruncateI) = -TruncateA;
S=zeros(samplenumber,length(Timenode)); I=zeros(samplenumber,length(Timenode));
S(:,1)= initialS*ones(samplenumber,1); I(:,1)=initialI*ones(samplenumber,1);
for i=1:length(Timenode)-1
  Temp=1-Stepsize*(beta*nonlinearfunction(S(:,i),I(:,i)).*S(:,i)-mu-gamma-alpha);
  I(:,i+1)=  1./Temp.*(1+sigma*nonlinearfunction(S(:,i),I(:,i)).*S(:,i).*DW(:,i)).*I(:,i);
  S(:,i+1)= 1/(1+Stepsize*mu)*(S(:,i)+Stepsize*(Lambda-beta*nonlinearfunction(S(:,i),I(:,i)).*S(:,i).*I(:,i+1)+gamma*I(:,i+1))...
      -sigma*nonlinearfunction(S(:,i),I(:,i)).*S(:,i).*I(:,i).*DW(:,i));
end
SFinalValue(:,j)=S(:,end);
IFinalValue(:,j)=I(:,end);
end
for j=1:length(Error)
Error(j) = mean(abs(IFinalValue(:,j)-IFinalValue(:,j+1))); %I or S
end
for i=1:length(Order)
 Order(i) = log(Error(i)/Error(i+1))/log(2);
end
in=2.^[0,1,2,3,4,5];
s=stepsize./interval
loglog(s(1:end-1),Error,'b*-'),hold on
loglog(s(1:end-1),(s(1:end-1).^(.5)),'r--'),hold off