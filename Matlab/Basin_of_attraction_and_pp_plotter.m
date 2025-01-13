ccc
u0=1;
v0=1;
J=[1   1;
   -3 -2];
fu=J(1,1);
fv=J(1,2);
gu=J(2,1);
gv=J(2,2);

IC=[2 1 0.5 0.2;1.5 2 1 0.5];



load('BOA.mat')

BOA=sqrt((xend-u0).^2+(yend-v0).^2)<1e-1;
e1=pcolor(xi,yi,double(BOA));
shading interp
hold on
plot([0 u0+v0*gv/gu],[v0+u0*gu/gv,0],'--r','linewidth',1)
plot([0 u0+v0*fv/fu],[v0+u0*fu/fv,0],'--b','linewidth',1)
set(e1,'facealpha',0.3)
% axis equal
axis tight

for i=1:4
    
[t,y] = ode45(@(t,y)vdp1(u0,v0,J,t,y),[0 200],IC(:,i));

hold on
plot(y(1,1),y(1,2),'ko')
plot(y(:,1),y(:,2),'k')
end
xlabel('$u$')
ylabel('$v$')
export_fig('../Pictures/Basin_of_attraction.png','-r300')

function dydt = vdp1(u0,v0,J,t,y)
u=y(1);
v=y(2);
fu=J(1,1);
fv=J(1,2);
gu=J(2,1);
gv=J(2,2);


F=(u-u0)*u*v*fu/(u0*v0)+(v-v0)*u*v*fv/(u0*v0);
G=(u-u0)*u*v*gu/(u0*v0)+(v-v0)*u*v*gv/(u0*v0);

dydt = [F;G];
end