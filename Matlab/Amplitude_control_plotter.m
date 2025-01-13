ccc
Z=load('../Comsol/Arbitrary_stst_amplitude_control.txt');
x=Z(:,1);
u=Z(:,2:2:9);
v=Z(:,3:2:9);
%%
close all
figure('Position',[0 0.1 .9 1/3])
subplot(1,2,1)
semilogy(x,u)

yticks(10.^[-2:4])
axis([0 10 1e-2 1e3])
xlabel('$x$')
ylabel('$u$')
% export_fig('../Pictures/u1v1.png','-r300')



subplot(1,2,2)
plot(x,v)
legend('$u_{0}=0.1$','$u_{0}=1$','$u_{0}=10$','$u_{0}=100$','location','best');
% yticks(10.^[-2:4])
% axis([0 10 1e-2 1e3])
xlabel('$x$')
ylabel('$v$')
export_fig('../Pictures/Amplitude_varying.png','-r300')