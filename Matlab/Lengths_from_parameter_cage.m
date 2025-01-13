ccc

n=100;
l=10;
[G1,G2,D]=meshgrid(linspace(0,l,n),linspace(0,l,n),linspace(0,l,n));

IDs=logical((G1>G2).*(G2>1).*(D>(sqrt(G1-G2)+sqrt(G1)).^2));
lc=pi./((1/2)*sqrt(2)*sqrt(D.*(D-G2+sqrt(D.^2-4*D.*G1+2*D.*G2+G2.^2)))./D);

a0=(1/2)*(((2*(G1-G2))*(dv-2*G1+G2)*lc^4-(4*(G1-G2))*Pi^2*(-7/4*G1+dv+G2)*lc^2+(-G1^2+(dv+4*G2)*G1-2*G2*(dv+G2))*Pi^4)*sqrt(dv^2+(-4*G1+2*G2)*dv+G2^2)-(2*(G1-G2))*(2*G1^2+(-4*dv-2*G2)*G1+(dv+G2)^2)*lc^4+(4*(3/2*(G1^2)+(-15/4*dv-7/4*G2)*G1+(dv+G2)^2))*(G1-G2)*Pi^2*lc^2-((-3*dv-3*G2)*G1^2+(dv^2+9*dv*G2+4*G2^2)*G1-2*(dv+G2)^2*G2)*Pi^4)/(((-dv-G2+2*G1)*sqrt(dv^2+(-4*G1+2*G2)*dv+G2^2)+2*G1^2+(-4*dv-2*G2)*G1+(dv+G2)^2)*((-G1+1)*lc^4-2*Pi^2*lc^2+Pi^4))
a1=(1/4)*(((5*(-4/5*gu+dv-(1/5)*gv))*(gu-gv)*l[c]^6-(16*(gu-gv))*(-5/8*gu+dv-(1/8)*gv)*Pi^2*l[c]^4+(16*(-3/4*(gu^2)+(dv+3/4*gv)*gu-(17/16*gv)*(dv-(1/17)*gv)))*Pi^4*l[c]^2-(2*((2*gv+dv)*gu-3*dv*gv))*Pi^6)*sqrt(dv^2+(-4*gu+2*gv)*dv+gv^2)-(5*(gu-gv))*(-2/5*(gu^2)+(-14/5*dv+8/5*gv)*gu+(dv-(1/5)*gv)*(dv+gv))*l[c]^6+(16*(gu-gv))*(-(1/2)*gu^2+(-21/8*dv+11/8*gv)*gu+(dv-(1/8)*gv)*(dv+gv))*Pi^2*l[c]^4-(16*((-11/4*dv+7/8*gv)*gu^2+(dv^2+(31/8*dv)*gv-gv^2)*gu-(17/16*gv)*(dv-(1/17)*gv)*(dv+gv)))*Pi^4*l[c]^2+(2*(-2*dv*gu^2+(dv^2+9*dv*gv-2*gv^2)*gu-3*dv*gv*(dv+gv)))*Pi^6)/(((-dv-gv+2*gu)*sqrt(dv^2+(-4*gu+2*gv)*dv+gv^2)+2*gu^2+(-4*dv-2*gv)*gu+(dv+gv)^2)*(Pi-l[c])*((-gu+1)*l[c]^4-2*Pi^2*l[c]^2+Pi^4)*(Pi+l[c]));
a2=

[faces,verts,colors] = isosurface(G1,G2,D,IDs,0,lc);
patch('Vertices',verts,'Faces',faces,'FaceVertexCData',colors,...
    'EdgeColor','interp')
colorbar
colormap cool
% scatter3(G1(IDs),G2(IDs),D(IDs));
% gu=G1(IDs);
% gv=G2(IDs);
% dv=D(IDs);
% lc=pi./((1/2)*sqrt(2)*sqrt(dv.*(dv-gv+sqrt(dv.^2-4*dv.*gu+2*dv.*gv+gv.^2)))./dv);
% 
% scatter3(G1(IDs),G2(IDs),D(IDs),10,lc);
