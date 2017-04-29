function [resp,resr] = TrajecoryFromPosition3d(pcell, alfa, beta, rho, u0, v0, f, D, boardx)
%p: n*2 matrix representing n points;
%alfa, beta, rho, u0, v0: intrinsic parameters
%f: focal length
%D: actual diameter of basketball;
%further needed: y coordinate of hoop; x coordinate of backboard
n=size(pcell);
n=n(1);
p=cell2mat(pcell);

K=[alfa -alfa*cot(rho) u0; %need intrinsic parameter
    0 beta/sin(rho) v0;
    0 0 1];
p = [p,ones(n,1)];
pc = (K\f*p')';%coordinate in camera frame

z=D*f./(2*r);%[n,1]
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
while pnew(1)>boardx %temporary, need consider hoop
    newdX=newdX*(1-k);
    newdZ=newdZ*(1-k);
    newdY=newdY*(1-k)-a;
    pnew=[pnew(1)+newdX, pnew(2)+newdY, pnew(3)+newdZ];
    pnewSet=[pnewSet;pnew];
end

unew=pnewSet(:,1)./(1+(pnewSet(:,3)-f)/f);
vnew=pnewSet(:,2)./(1+(pnewSet(:,3)-f)/f);
resp=[unew,vnew];
resr=f*D./2*(pnewSet(:,3)-f);
