ccc

ccc
a=1;
n=500;
[D,G2]=meshgrid(linspace(1,10,n),linspace(1,5,n));
Ids=(G2<D/2);

p2plusp3p=@(dv,gv,alpha)(1/280)*(sqrt(8100*(alpha-1/2)^2*dv^6+(30360*(alpha^2+259/506*alpha+61/253))*gv*dv^5-(27996*(alpha^2-13164/2333*alpha-446/2333))*gv^2*dv^4-(148800*(alpha^2-389/1550*alpha-11/775))*gv^3*dv^3+(52512*(alpha^2-6210/547*alpha+379/1094))*gv^4*dv^2+(220032*(alpha^2-1203/382*alpha+19/191))*gv^5*dv+(88128*(alpha^2-124/51*alpha+4/51))*gv^6)+(-90*alpha+45)*dv^3+(-206*alpha+100)*gv*dv^2+(264*alpha+12)*gv^2*dv+(248*alpha-16)*gv^3)/((dv+2*gv)*(dv+26/35*gv));
p2plusp3pv=str2func(vectorize(p2plusp3p));
p2plusp3p_eval=p2plusp3pv(D,G2,a);
p2plusp3n=@(dv,gv,alpha)(1/280)*(-sqrt(8100*(alpha-1/2)^2*dv^6+(30360*(alpha^2+259/506*alpha+61/253))*gv*dv^5-(27996*(alpha^2-13164/2333*alpha-446/2333))*gv^2*dv^4-(148800*(alpha^2-389/1550*alpha-11/775))*gv^3*dv^3+(52512*(alpha^2-6210/547*alpha+379/1094))*gv^4*dv^2+(220032*(alpha^2-1203/382*alpha+19/191))*gv^5*dv+(88128*(alpha^2-124/51*alpha+4/51))*gv^6)+(-90*alpha+45)*dv^3+(-206*alpha+100)*gv*dv^2+(264*alpha+12)*gv^2*dv+(248*alpha-16)*gv^3)/((dv+2*gv)*(dv+26/35*gv));
p2plusp3nv=str2func(vectorize(p2plusp3n));
p2plusp3n_eval=p2plusp3nv(D,G2,a);

p2p=@(dv,gv,alpha)(sqrt(324*(alpha-1/2)^2*dv^4+(14088*alpha^2-6204*alpha+3252)*gv*dv^3-(6060*(alpha^2-92/505*alpha+57/505))*gv^2*dv^2-(34224*(alpha^2-267/713*alpha+130/713))*gv^3*dv-(15984*(alpha^2-44/111*alpha+20/111))*gv^4)+(18*alpha-9)*dv^2+(-62*alpha+46)*gv*dv+(-44*alpha+40)*gv^2)/(136*dv+112*gv);
p2pv=str2func(vectorize(p2p));
p2p_eval=p2pv(D,G2,a);


x=D;
x(~Ids)=nan;
y=G2;
y(~Ids)=nan;
z1=p2plusp3p_eval;
z1(~Ids)=nan;
z2=p2p_eval;
z2(~Ids)=nan;
hold on

surf(x,y,z1,'facecolor',[1 0 0],'edgecolor','none','FaceAlpha',0.3)
surf(x,y,z2,'facecolor',[1 0 0],'edgecolor','none','FaceAlpha',0.3)

g2x=linspace(1,5);
dx=linspace(1,10);
plot3(10+0*g2x,g2x,p2pv(10,g2x,a),'k','linewidth',1)
plot3(dx,1+0*dx,p2pv(dx,1,a),'k','linewidth',1)
plot3(10+0*g2x,g2x,p2plusp3pv(10,g2x,a),'k','linewidth',1)
plot3(dx,1+0*dx,p2plusp3pv(dx,1,a),'k','linewidth',1)
% shading interp
xlabel('$D$')
ylabel('$G_2$')
zlabel('$G_3$')
set(gca,'YDir','reverse')
view([-50-180 20])
axis equal
axis([0 10 0 10 -5 5])