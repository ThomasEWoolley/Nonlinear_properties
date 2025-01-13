ccc
load('RGB_cols.mat')
G2=linspace(1,5);

hold on
p2p=@(gv)(-gv^2 - 40*gv + 225 + sqrt(-783*gv^4 - 17280*gv^3 - 35250*gv^2 + 696000*gv + 50625))/(4*(7*gv + 85));
p2vp=str2func(vectorize(p2p));
p2p_eval=p2vp(G2);


p2=@(gv)(-gv^2 - 40*gv + 225 - sqrt(-783*gv^4 - 17280*gv^3 - 35250*gv^2 + 696000*gv + 50625))/(4*(7*gv + 85));
p2v=str2func(vectorize(p2));
p2_eval=p2v(G2);


p3p=@(gv)(5*gv^2 - 10*gv - 75 + sqrt(9*gv^4 - 180*gv^3 - 250*gv^2 + 3500*gv + 5625))/(4*(5 + gv));
p3vp=str2func(vectorize(p3p));
p3p_eval=p3vp(G2);


p3=@(gv)(5*gv^2 - 10*gv - 75 - sqrt(9*gv^4 - 180*gv^3 - 250*gv^2 + 3500*gv + 5625))/(4*(5 + gv));
p3v=str2func(vectorize(p3));
p3_eval=p3v(G2);


p2np3=@(gv)(-31*gv^2 - 590*gv - 1575 + sqrt(945*gv^4 + 36180*gv^3 + 442950*gv^2 + 1852500*gv + 2480625))/(4*(5 + gv));
p2np3v=str2func(vectorize(p2np3));
p2np3_eval=p2np3v(G2);


% p2np3=@(gv)(-31*gv^2 - 590*gv - 1575 - sqrt(945*gv^4 + 36180*gv^3 + 442950*gv^2 + 1852500*gv + 2480625))/(4*(5 + gv));
% p2np3v=str2func(vectorize(p2np3));
% p2np3_eval=p2np3v(G2);
% plot(G2,p2np3_eval,'LineWidth',3)

p2pp3p=@(gv)(29*gv^3 + 345*gv^2 - 1325*gv - 5625 + sqrt(-1863*gv^6 - 70470*gv^5 - 821025*gv^4 - 1708500*gv^3 + 21144375*gv^2 + 83156250*gv + 31640625))/(4*(13*gv^2 + 240*gv + 875));
p2pp3vp=str2func(vectorize(p2pp3p));
p2pp3p_eval=p2pp3vp(G2);


p2pp3=@(gv)(29*gv^3 + 345*gv^2 - 1325*gv - 5625 - sqrt(-1863*gv^6 - 70470*gv^5 - 821025*gv^4 - 1708500*gv^3 + 21144375*gv^2 + 83156250*gv + 31640625))/(4*(13*gv^2 + 240*gv + 875));
p2pp3v=str2func(vectorize(p2pp3));
p2pp3_eval=p2pp3v(G2);


fill([G2 flip(G2)], [-5+0*p2pp3_eval flip(p2pp3_eval)],cols(1,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([G2 flip(G2)], [p2pp3_eval flip(p2_eval)],cols(2,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([G2 flip(G2)], [p2_eval flip(p2np3_eval)],cols(3,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([G2 flip(G2)], [p2np3_eval flip(p2pp3p_eval)],cols(4,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([G2 flip(G2)], [p2pp3p_eval flip(p2p_eval)],cols(5,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([G2 flip(G2)], [p2p_eval 5+0*flip(p2p_eval)],cols(1,:), 'EdgeColor','none','FaceAlpha',0.5)

p2=plot(G2,p2p_eval,'r','LineWidth',3);
plot(G2,p2_eval,'r','LineWidth',3);
p3=plot(G2,p3p_eval,'b','LineWidth',3);
plot(G2,p3_eval,'b','LineWidth',3);
p2np3=plot(G2,p2np3_eval,'k','LineWidth',3);
p2pp3=plot(G2,p2pp3p_eval,'g','LineWidth',3);
plot(G2,p2pp3_eval,'g','LineWidth',3);
n=100;
G3=linspace(-5,5,n);
G2p=1.5:1:4.5;
str={'(g)','(h)','(i)','(j)','(k)'}
G33=[-5 -3 -1 1 2];
plot(2+0*G33,G33,'ko','MarkerFaceColor','auto')
for i=1:5
text(2+.2,G33(i),str{i},'FontSize',15)
end
% for i=1:length(G3y)
%     surf([G2x;G2x],[G3y(i);G3y(i)],10+[G2x;G2x],'facecol','no','edgecol','interp','linew',2,'linestyle',sty{i});
% end
% colormap('copper')
xticks(0:5)
% legend([p2,p3,p2np3,p2pp3],'$p_2=0$','$p_3=0$','$p_3=p_2$','$p_3=-p_2$')
xlabel('$G_2$')
ylabel('$G_3$')
set(gca,'FontSize',15)
axis equal
axis([0 5 -5 5])

export_fig('../Pictures/DG2G3_points.png','-r300')
% 
%%
close all
f=figure;
% subplot(1,2,2)
p2=@(gv,gvv)-7*(gv^3 + (gvv/14 + 10)*gv^2 + (gvv^2 + 20/7*gvv - 75)*gv + (85*gvv^2)/7 - (225*gvv)/14)/(6*(gv - 5)*(gv + 15)*(gv + 9/2));
p2v=str2func(vectorize(p2));
p3=@(gv,gvv)-(gv^3 - (5*gv^2*gvv)/2 + (gvv^2 + 5*gvv - 25)*gv + 5*gvv^2 + (75*gvv)/2)/((gv - 5)*(5 + gv)*(gv + 9/2));
p3v=str2func(vectorize(p3));


hold on

fill([0 5 5 0], [0 -5 7 7],cols(1,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([0 5 0], [0 -5 -5],cols(2,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([0 -1 0], [0 -1 -1],cols(3,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([-1 0 -1], [1 0 -1],cols(4,:), 'EdgeColor','none','FaceAlpha',0.5)
fill([-7 0 0], [7 7 0],cols(5,:), 'EdgeColor','none','FaceAlpha',0.5)
    axis equal
    axis([-1 2 -1 2])
    grid off
    xlabel('$p_2$')
    ylabel('$p_3$')
    set(gca,'FontSize',15)
p2_eval=p2v(2,G33);
    p3_eval=p3v(2,G33);
plot(p2_eval,p3_eval,'ko','MarkerFaceColor','auto')

for i=1:5
text(p2_eval(i)+.1,p3_eval(i),str{i},'FontSize',15)
end

export_fig(f,'../Pictures/p2p3_points.png','-r300')
