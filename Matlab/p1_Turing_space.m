ccc
n=200;
l=10;
[G1,G2,D]=meshgrid(linspace(0,l,n),linspace(0,l,n),linspace(0,l,n));

gu1=@(dv,gu,gv)-4*((-dv^2 + (3*gu - gv)*dv - gu*gv)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + (dv^2 + (-4*gu + 2*gv)*dv + gv^2)*(-gu + dv))*(gu - gv)^2*sqrt(2)/(sqrt((gu - gv)*(-sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv - gv))*pi*(-sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + dv - gv)*(((-dv + gv - 2)*gu + dv + gv)*sqrt(dv^2 + (-4*gu + 2*gv)*dv + gv^2) + (-2*dv - 2)*gu^2 + (dv^2 + gv^2 + 4*dv + 2*gv)*gu - (dv + gv)^2));
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
export_fig('../pictures/p1.png','-r300')