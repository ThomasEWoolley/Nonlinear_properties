ccc
n=200;
l=10;
[G1,G2,D]=meshgrid(linspace(0,l,n),linspace(0,l,n),linspace(0,l,n));

gu1=@(dv,gu,gv)-(1600*(gu - gv)^4*((-dv^6 + (14*gu - 8*gv)*dv^5 + (-67*gu^2 + 74*gu*gv - 22*gv^2)*dv^4 + (130*gu^3 - 208*gu^2*gv + 126*gu*gv^2 - 28*gv^3)*dv^3 + (-89*gu^4 + 180*gu^3*gv - 175*gu^2*gv^2 + 86*gu*gv^3 - 17*gv^4)*dv^2 + (10*gu^5 - 20*gu^4*gv + 40*gu^3*gv^2 - 40*gu^2*gv^3 + 20*gu*gv^4 - 4*gv^5)*dv - gu^4*gv^2)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + (dv^5 + (-12*gu + 7*gv)*dv^4 + (45*gu^2 - 50*gu*gv + 15*gv^2)*dv^3 + (-60*gu^3 + 95*gu^2*gv - 58*gu*gv^2 + 13*gv^3)*dv^2 + (21*gu^4 - 40*gu^3*gv + 40*gu^2*gv^2 - 20*gu*gv^3 + 4*gv^4)*dv - gu^4*gv)*(dv^2 + (-4*gu + 2*gv)*dv + gv^2))*((-dv^6 + (12*gu - 6*gv)*dv^5 + (-44*gu^2 + 38*gu*gv - 9*gv^2)*dv^4 + (52*gu^3 - 48*gu^2*gv + 20*gu*gv^2 - 4*gv^3)*dv^3 + (-10*gu^4 - 10*gu^3*gv + 5*gu^2*gv^2)*dv^2 + (8*gu^3*gv^2 - 2*gu^2*gv^3)*dv - gu^2*gv^4)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + (dv^5 + (-10*gu + 5*gv)*dv^4 + (26*gu^2 - 20*gu*gv + 4*gv^2)*dv^3 + (-16*gu^3 + 6*gu^2*gv)*dv^2 + (6*gu^3*gv - gu^2*gv^2)*dv - gv^3*gu^2)*(dv^2 + (-4*gu + 2*gv)*dv + gv^2)))/(9*(((-gu + 1)*dv + (gv - 2)*gu + gv)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + (gu - 1)*dv^2 + (-2*gu^2 + 4*gu - 2*gv)*dv - 2*gu^2 + (gv^2 + 2*gv)*gu - gv^2)^2*((-dv^3 + (8*gu - 5*gv)*dv^2 + (-11*gu^2 + 12*gu*gv - 4*gv^2)*dv + gv*gu^2)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv^4 + (-10*gu + 6*gv)*dv^3 + (25*gu^2 - 28*gu*gv + 9*gv^2)*dv^2 + (-10*gu^3 + 14*gu^2*gv - 12*gu*gv^2 + 4*gv^3)*dv + gu^2*gv^2)^2*(sqrt(2)*sqrt((gu - gv)*(-sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv - gv)) + 2*gu - 2*gv)^2*(sqrt(2)*sqrt((gu - gv)*(-sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv - gv)) - 2*gu + 2*gv)^2) + (400*(gu - gv)^4*(((11*dv^6)/10 + (-(143*gu)/10 + (77*gv)/10)*dv^5 + (121/2*gu^2 - 121/2*gu*gv + 33/2*gv^2)*dv^4 + (-473/5*gu^3 + 253/2*gv*gu^2 - 341/5*gu*gv^2 + 143/10*gv^3)*dv^3 + (407/10*gu^4 - 253/5*gu^3*gv + 44*gu^2*gv^2 - 22*gu*gv^3 + 22/5*gv^4)*dv^2 + (-77/10*gu^4*gv + 11/10*gv^2*gu^3)*dv + (11*gu^3*gv^3)/10)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + (-(11*dv^5)/10 + ((121*gu)/10 - (33*gv)/5)*dv^4 + (-77/2*gu^2 + 187/5*gu*gv - 99/10*gv^2)*dv^3 + (187/5*gu^3 - 44*gv*gu^2 + 22*gu*gv^2 - 22/5*gv^3)*dv^2 - (11*dv*gu^4)/2 + (11*gv^2*gu^3)/10)*(dv^2 + (-4*gu + 2*gv)*dv + gv^2))^2)/(9*(((-gu + 1)*dv + (gv - 2)*gu + gv)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + (gu - 1)*dv^2 + (-2*gu^2 + 4*gu - 2*gv)*dv - 2*gu^2 + (gv^2 + 2*gv)*gu - gv^2)^2*((-dv^3 + (8*gu - 5*gv)*dv^2 + (-11*gu^2 + 12*gu*gv - 4*gv^2)*dv + gv*gu^2)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv^4 + (-10*gu + 6*gv)*dv^3 + (25*gu^2 - 28*gu*gv + 9*gv^2)*dv^2 + (-10*gu^3 + 14*gu^2*gv - 12*gu*gv^2 + 4*gv^3)*dv + gu^2*gv^2)^2*(sqrt(2)*sqrt((gu - gv)*(-sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv - gv)) + 2*gu - 2*gv)^2*(sqrt(2)*sqrt((gu - gv)*(-sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv - gv)) - 2*gu + 2*gv)^2);
gu1v=str2func(vectorize(gu1));

gu1_eval=gu1v(D,G1,G2);

IDs=logical((G1>G2).*(G2>1).*(D>(sqrt(G1-G2)+sqrt(G1)).^2).*(G1>1));

sum(imag(gu1_eval(IDs))~=0)
Is=find(imag(gu1_eval(IDs))~=0);

x=G1(IDs);
y=G2(IDs);
z=D(IDs);
c=gu1_eval(IDs);

x(Is)=[];y(Is)=[];z(Is)=[];c(Is)=[];

tiledlayout('flow')
nexttile
hold on
scatter3(x,y,z,2,c)
colorbar
xlabel('$G_1$')
ylabel('$G_2$')
zlabel('$D$')
view([10 50])
% axis tight
axis([0 10 0 10 0 10])
set(gca,"FontSize",15)


IDb=0*IDs(:,:,end);
for i=1:n
    F=find(IDs(i,:,end));
    IDb(i,min(F))=1;
    IDb(i,max(F))=1;
end
IDb(21,22:61)=1;
Is=find(IDb);

IDlb=0*IDs;
for i=1:n
    [j1,j2]=find(IDs(:,:,i));
    try
        [~,ij1]=max(j1);
    IDlb(j1(ij1),j2(ij1),i)=1;
    end
end

Islb=find(IDlb);

scatter3(G1(Is),G2(Is),l,1,'k')
scatter3(G1(Islb),G2(Islb),D(Islb)-0.1,2,'k')
plot3([1 1],[1 1],[min(D(IDs)) l],'k','LineWidth',2)
g1=linspace(1.05,l);
d=(sqrt(g1-1)+sqrt(g1)).^2;
plot3(g1,0*g1+1,d,'k','LineWidth',2)

set(gca,"FontSize",20)
[max(c) min(c)]
export_fig('../pictures/Disc.png','-r300')