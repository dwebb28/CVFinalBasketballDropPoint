function res = TrajecoryFromPosition2d(p, width, height)%p:n*2 matrix
n=size(p);
n=n(1);
%t=(1:1:n-1)';
du=p(2:n,1)-p(1:n-1,1);
dv=p(2:n,2)-p(1:n-1,2);

k=du(1:n-2)\-du(2:n-1)+1; %wind resistance
a=sum((1-k)*dv(1:n-2)-dv(2:n-1))/(n-2); %gravitational acceleration
% k,a opposite to velocity 

pnew=p(n,:);
res=pnew;
newdu=du(n-1);
newdv=dv(n-1);
while pnew(1)>0 && pnew(1)<width && pnew(2)>0 && pnew(2)<height %temporary, need consider hoop
    newdu=newdu*(1-k);
    newdv=newdv*(1-k)-a;
    pnew=[pnew(1)+newdu,pnew(2)+newdv];
    res=[res;pnew];
end

% test:
% height = 2000;
% width = 2000;
% u=1750:-50:1500;
% v=(u-1000).^2/1000+50;
% p=[u',v'];
% q=TrajecoryFromPosition2d(p, width, height);
% plot(u,v);
% ax=gca;
% ax.YDir='reverse';
% hold on;
% plot(q(:,1),q(:,2));