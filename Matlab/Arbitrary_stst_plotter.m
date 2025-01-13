ccc
Z=load('../Comsol/Arbitrary_stst.txt');
x=Z(:,1);
u1=Z(:,2);
v1=Z(:,3);
u2=Z(:,4);
v2=Z(:,5);

figure('Position',[0 0.1 1 1/3])
subplot(1,3,1)
hold on
yline(pi,'b--','LineWidth',3)
yline(exp(1),'r--','LineWidth',3)
plot(x,u1,'b')
plot(x,v1,'r')
legend('$u_{st}$','$v_{st}$','$u$','$v$')
xlabel('$x$')
ylabel('Morphogen level')
export_fig('../Pictures/u1v1.png','-r300')
range(u1)
range(v1)


figure('Position',[0 0.1 1 1/3])
subplot(1,3,1)
hold on
yline(0.1,'b--','LineWidth',3)
plot(x,u2,'b')
legend('$u_{st}$','$u$')
xlabel('$x$')
ylabel('Morphogen level')

subplot(1,3,2)
hold on
yline(100,'r--','LineWidth',3)
plot(x,v2,'r')
legend('$v_{st}$','$v$')
xlabel('$x$')
ylabel('Morphogen level')
range(u2)
range(v2)

export_fig('../Pictures/u2v2.png','-r300')