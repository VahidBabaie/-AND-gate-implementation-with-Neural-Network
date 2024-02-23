%implementation of AND gate by NN
clc; clear; close all; pause('on'); beep on;
p=[0 0 1 1;0 1 0 1]; %pattern
t=[0 0 0 1]; %target
w(:,:,1)=[0;1]; %weights inital conditions
a=zeros(4,1);
e=zeros(100,1);
b=[0;zeros(99,1)]; %bias inital condition
k=1;
for j=1:25
    for i=1:4
a(k)=hardlim(w(:,:,k)'*p(:,i)+b(k));
e(k)=t(i)-a(k);
 w(:,:,k+1)=w(:,:,k)+e(k)*p(:,i);
 b(k+1)=b(k)+e(k);
 p1=-3:3;
 p2=((-w(1,1,k)/w(2,1,k))*p1)-(b(k)/w(2,1,k));
 plot(p1,p2,'r')
 hold on;
 plotpv(p,t)
 beep;
 pause(1); %pause in second
 k=k+1;
    end
    if e(k-4:k-1)==zeros(4,1) 
        e=e(1:k-1);
        break;
    end
end    
 disp(['w1=' num2str(w(1,:,k-1)) '  w2=' num2str(w(2,:,k-1)) '  b=' num2str(b(k-1))]);
 disp(['number of epoches=' num2str(j)]);
