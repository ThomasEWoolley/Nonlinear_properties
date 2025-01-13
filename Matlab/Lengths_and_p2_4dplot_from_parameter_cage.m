ccc

n=100;
l=5;
[G1,G2,D]=meshgrid(linspace(1,l,n),linspace(1,l,n),linspace(1,l,n));
IDs=logical((G1>G2).*(G2>1).*(D>(sqrt(G1-G2)+sqrt(G1)).^2));
lc=pi./((1/2)*sqrt(2)*sqrt(D.*(D-G2+sqrt(D.^2-4*D.*G1+2*D.*G2+G2.^2)))./D);


a0=(1./2).*(((2.*(G1-G2)).*(D-2.*G1+G2).*lc.^4-(4.*(G1-G2)).*pi.^2.*(-7./4.*G1+D+G2).*lc.^2+(-G1.^2+(D+4.*G2).*G1-2.*G2.*(D+G2)).*pi.^4).*sqrt(D.^2+(-4.*G1+2.*G2).*D+G2.^2)-(2.*(G1-G2)).*(2.*G1.^2+(-4.*D-2.*G2).*G1+(D+G2).^2).*lc.^4+(4.*(3./2.*(G1.^2)+(-15./4.*D-7./4.*G2).*G1+(D+G2).^2)).*(G1-G2).*pi.^2.*lc.^2-((-3.*D-3.*G2).*G1.^2+(D.^2+9.*D.*G2+4.*G2.^2).*G1-2.*(D+G2).^2.*G2).*pi.^4)./(((-D-G2+2.*G1).*sqrt(D.^2+(-4.*G1+2.*G2).*D+G2.^2)+2.*G1.^2+(-4.*D-2.*G2).*G1+(D+G2).^2).*((-G1+1).*lc.^4-2.*pi.^2.*lc.^2+pi.^4));
a1=(1./4).*(((5.*(-4./5.*G1+D-(1./5).*G2)).*(G1-G2).*lc.^6-(16.*(G1-G2)).*(-5./8.*G1+D-(1./8).*G2).*pi.^2.*lc.^4+(16.*(-3./4.*(G1.^2)+(D+3./4.*G2).*G1-(17./16.*G2).*(D-(1./17).*G2))).*pi.^4.*lc.^2-(2.*((2.*G2+D).*G1-3.*D.*G2)).*pi.^6).*sqrt(D.^2+(-4.*G1+2.*G2).*D+G2.^2)-(5.*(G1-G2)).*(-2./5.*(G1.^2)+(-14./5.*D+8./5.*G2).*G1+(D-(1./5).*G2).*(D+G2)).*lc.^6+(16.*(G1-G2)).*(-(1./2).*G1.^2+(-21./8.*D+11./8.*G2).*G1+(D-(1./8).*G2).*(D+G2)).*pi.^2.*lc.^4-(16.*((-11./4.*D+7./8.*G2).*G1.^2+(D.^2+(31./8.*D).*G2-G2.^2).*G1-(17./16.*G2).*(D-(1./17).*G2).*(D+G2))).*pi.^4.*lc.^2+(2.*(-2.*D.*G1.^2+(D.^2+9.*D.*G2-2.*G2.^2).*G1-3.*D.*G2.*(D+G2))).*pi.^6)./(((-D-G2+2.*G1).*sqrt(D.^2+(-4.*G1+2.*G2).*D+G2.^2)+2.*G1.^2+(-4.*D-2.*G2).*G1+(D+G2).^2).*(pi-lc).*((-G1+1).*lc.^4-2.*pi.^2.*lc.^2+pi.^4).*(pi+lc));
a2=(1./2).*(((2.*(G1-G2)).*(-(1./2).*G1-(1./2).*G2+D).*lc.^4-(3.*(G1-G2)).*(-2./3.*G2+D).*pi.^2.*lc.^2-pi.^4.*G2.*(D-G2)).*sqrt(D.^2+(-4.*G1+2.*G2).*D+G2.^2)-(2.*((1./2).*G2.^2+((1./2).*D+(1./2).*G1).*G2+D.*(D-5./2.*G1))).*(G1-G2).*lc.^4+(3.*(G1-G2)).*(2./3.*(G2.^2)+(1./3).*D.*G2+D.*(D-2.*G1)).*pi.^2.*lc.^2+G2.*(G2.^2+D.*(D-2.*G1)).*pi.^4)./(((-D-G2+2.*G1).*sqrt(D.^2+(-4.*G1+2.*G2).*D+G2.^2)+G2.^2+(2.*D-2.*G1).*G2+D.^2-4.*D.*G1+2.*G1.^2).*((-G1+1).*lc.^4-2.*pi.^2.*lc.^2+pi.^4));

ET=-(D.^4+(-7.*G1+3.*G2).*D.^3+(14.*G1.^2-11.*G1.*G2+3.*G2.^2).*D.^2+(-7.*G1.^3+6.*G1.^2.*G2-4.*G1.*G2.^2+G2.^3).*D+G1.^3.*G2).*(D.^3+(-5.*G1+2.*G2).*D.^2+(6.*G1.^2-4.*G1.*G2+G2.^2).*D-G1.^3).*sqrt(D.^2+(-4.*G1+2.*G2).*D+G2.^2)+D.^8+(-14.*G1+6.*G2).*D.^7+(77.*G1.^2-64.*G1.*G2+15.*G2.^2).*D.^6+(-210.*G1.^3+250.*G1.^2.*G2-116.*G1.*G2.^2+20.*G2.^3).*D.^5+(294.*G1.^4-432.*G1.^3.*G2+297.*G1.^2.*G2.^2-104.*G1.*G2.^3+15.*G2.^4).*D.^4+(-196.*G1.^5+308.*G1.^4.*G2-280.*G1.^3.*G2.^2+152.*G1.^2.*G2.^3-46.*G1.*G2.^4+6.*G2.^5).*D.^3+(49.*G1.^6-56.*G1.^5.*G2+70.*G1.^4.*G2.^2-56.*G1.^3.*G2.^3+28.*G1.^2.*G2.^4-8.*G1.*G2.^5+G2.^6).*D.^2-2.*G1.^6.*(G1+3.*G2).*D+G1.^6.*G2.^2;


% figure('position',[0 0 1 1/3])
% subplot(1,6,1)
% [faces,verts,colors] = isosurface(G1,G2,D,IDs,0,lc);
% patch('Vertices',verts,'Faces',faces,'FaceVertexCData',colors,...
%     'EdgeColor','interp')
% colorbar
% colormap cool; view([21,20])
% 
% subplot(1,6,2)
% [faces,verts,colors] = isosurface(G1,G2,D,IDs,0,a0);
% patch('Vertices',verts,'Faces',faces,'FaceVertexCData',colors,...
%     'EdgeColor','interp')
% colorbar
% colormap cool; view([21,20])
% 
% 
% subplot(1,6,3)
% [faces,verts,colors] = isosurface(G1,G2,D,IDs,0,a1);
% patch('Vertices',verts,'Faces',faces,'FaceVertexCData',colors,...
%     'EdgeColor','interp')
% colorbar
% colormap cool; view([21,20])
% 
% subplot(1,6,4)
% [faces,verts,colors] = isosurface(G1,G2,D,IDs,0,a2);
% patch('Vertices',verts,'Faces',faces,'FaceVertexCData',colors,...
%     'EdgeColor','interp')
% colorbar
% colormap cool; view([21,20])
% 
% %%


figure('position',[0 0 1 1/3])
subplot(1,6,1)
scatter3(G1(IDs),G2(IDs),D(IDs),10,lc(IDs));

colorbar
colormap cool; view([21,20])

subplot(1,6,2)
scatter3(G1(IDs),G2(IDs),D(IDs),10,a0(IDs));

colorbar
colormap cool; view([21,20])


subplot(1,6,3)
scatter3(G1(IDs),G2(IDs),D(IDs),10,a1(IDs));

colorbar
colormap cool; view([21,20])

subplot(1,6,4)
scatter3(G1(IDs),G2(IDs),D(IDs),10,a2(IDs));
colorbar
colormap cool; view([21,20])

subplot(1,6,5)
h=a1(IDs).^2-4*a0(IDs).*a2(IDs);
scatter3(G1(IDs),G2(IDs),D(IDs),10,h);
colorbar
colormap cool; view([21,20])

subplot(1,6,6)
scatter3(G1(IDs),G2(IDs),D(IDs),10,ET(IDs));
colorbar
colormap cool; view([21,20])
sum(IDs(:))-sum(imag(a1(IDs))==0)