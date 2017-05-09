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
 
%change
% p=p(1:10,:,:);
% r = r(1:10);
% n=10;
 
K=[alpha -alpha*cot(thet) u0; %need intrinsic parameter
    0 beta/sin(thet) v0;
    0 0 1];
p = [p,ones(n,1)];
pc = (K\(f*p'))';%coordinate in camera frame
rc = r*2/(alpha+beta);%ball radius pixels->length in in camera frame(x)
 
%change
%  rc = ones(n,1)*mean(rc);
 
% t=1:n;
% rfit = polyfit(t,rc',2);
% rc = rfit(1)*t'.^2+rfit(2)*t'+rfit(3);
 
z=D*f./(2*rc);%[n,1]
x=pc(:,1).*z/f;
y=pc(:,2).*z/f;
 
X=x+pc(:,1);
Y=y+pc(:,2);
Z=z+f;
 
t=1:n;
 
xfit = polyfit(t,X',1);
yfit = polyfit(t,Y',2);
zfit = polyfit(t,Z',1);
X=xfit(1)*t'+xfit(2);
Y=yfit(1)*t'.^2+yfit(2)*t'+yfit(3);
Z=zfit(1)*t'+zfit(2);
 
Pw=[X,Y,Z];
 
dX=Pw(2:n,1)-Pw(1:n-1,1);
dY=Pw(2:n,2)-Pw(1:n-1,2);
dZ=Pw(2:n,3)-Pw(1:n-1,3);
 
%change
dX = mean(dX);
dZ = mean(dZ);
% kX = dX/mean(Pw(:,1));
% kZ = dZ/mean(Pw(:,3));
 
% kX=1-(dX(1:n-2)\-dX(2:n-1)); 
% kZ=1-(dZ(1:n-2)\-dZ(2:n-1));
% k=(kX+kZ)/2;%wind resistance
 
 
% a=mean(dY(2:n-1)-(1-k)*dY(1:n-2)); %gravitational acceleration
a=mean(dY(2:n-1)-dY(1:n-2)); %gravitational acceleration
% k,a opposite to velocity 
 
pnew=Pw(n,:);
pnewSet=pnew;
% newdX=dX(n-1);
% newdY=dY(n-1);
% newdZ=dZ(n-1);
%change
newdX=dX;
newdY=dY(n-1);
newdZ=dZ;
count = 1;
while count < 20 %temporary, need consider hoop
%     newdX=newdX*(1-kX);
%     newdZ=newdZ*(1-kZ);
%     newdY=newdY*(1-k)-a;
%change
%     newdX = newdX + dX;
%     newdZ = newdZ + dZ;
 
    newdY=newdY+a;

    pnew=[pnew(1)+newdX, pnew(2)+newdY, pnew(3)+newdZ];
    pnewSet=[pnewSet;pnew];
    count = count+1;
end
xnew=pnewSet(:,1)*f./pnewSet(:,3);
ynew=pnewSet(:,2)*f./pnewSet(:,3);
pxnewSet = [xnew/f,ynew/f,ones(count,1)];
resp = (K*(pxnewSet'))';
resp = resp(:,1:2);
rnew = D*f./(2*pnewSet(:,3));
resr = rnew * (alpha+beta)/2;