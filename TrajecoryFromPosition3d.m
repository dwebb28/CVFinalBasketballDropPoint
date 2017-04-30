function [resp,resr] = TrajecoryFromPosition3d(pcell,r)
%p: n*2 matrix representing n points;
%alpha, beta, rho, u0, v0: intrinsic parameters
alpha = 1.364814621127952e+03;
beta = 1.368750434258315e+03;
thet = 89.482506651068330;
u0 = 6.256611682184122e+02;
v0 = 3.527864605555271e+02;
%f: focal length
f = 4.15;
%D: actual diameter of basketball;
D = 724;
%further needed: y coordinate of hoop; x coordinate of backboard
%boardz = 16000;

n=size(pcell);
n=n(1);

p=cell2mat(pcell);

K=[alpha -alpha*cot(thet) u0; %need intrinsic parameter
    0 beta/sin(thet) v0;
    0 0 1];
p = [p,ones(n,1)];
pc = (K\(f*p'))';%coordinate in camera frame
rc = r*2/(alpha+beta);%ball radius pixels->length in in camera frame(x)

t=1:n;
rfit = polyfit(t,rc',2);
rc = rfit(1)*t'.^2+rfit(2)*t'+rfit(3);

z=D*f./(2*rc);%[n,1]
x=pc(:,1).*z/f;
y=pc(:,2).*z/f;
X=x+pc(:,1);
Y=y+pc(:,2);
Z=z+f;
Pw=[X,Y,Z];

dX=Pw(2:n,1)-Pw(1:n-1,1);
dY=Pw(2:n,2)-Pw(1:n-1,2);
dZ=Pw(2:n,3)-Pw(1:n-1,3);

kX=dX(1:n-2)\-dX(2:n-1)+1; 
kZ=dZ(1:n-2)\-dZ(2:n-1)+1;
k=(kX+kZ)/2;%wind resistance
a=sum((1-k)*dY(1:n-2)-dY(2:n-1))/(n-2); %gravitational acceleration
% k,a opposite to velocity 

pnew=Pw(n,:);
pnewSet=pnew;
newdX=dX(n-1);
newdY=dY(n-1);
newdZ=dZ(n-1);
count = 1;
while pnew(2)<0 %temporary, need consider hoop
    newdX=newdX*(1-kX);
    newdZ=newdZ*(1-kZ);
    newdY=newdY*(1-k)-a;
    pnew=[pnew(1)+newdX, pnew(2)+newdY, pnew(3)+newdZ];
    pnewSet=[pnewSet;pnew];
    count = count+1;
end
xnew=pnewSet(:,1)*f./pnewSet(:,3);
ynew=pnewSet(:,2)*f./pnewSet(:,3);
pxnewSet = [xnew/f,ynew/f,ones(count,1)];
resp = (K*(pxnewSet'))';
rnew = D*f./(2*pnewSet(:,3));
resr = rnew * (alpha+beta)/2;