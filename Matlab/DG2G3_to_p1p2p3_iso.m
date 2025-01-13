ccc
a=1;
n=100;
[D,G2,G3]=meshgrid(linspace(0,10,n),linspace(1,5,n),linspace(-5,5,n));


Ids=(G2<D/2);

p1=@(dv,gv,gvv,alpha)gv*sqrt(2)./((dv+2*gv-1)*pi);
p1v=str2func(vectorize(p1));
p1_eval=p1v(D,G2,G3,a);

p2=@(dv,gv,gvv,alpha)(1/18)*((80*alpha^2-44*alpha+20)*gv^3+((80*alpha^2-44*alpha+20)*dv+44*gvv*alpha-40*gvv)*gv^2+((-60*alpha^2+33*alpha-15)*dv^2+(62*alpha*gvv-46*gvv)*dv+56*gvv^2)*gv-18*dv*((alpha-1/2)*dv-34/9*gvv)*gvv)/((dv+2/3*gv)*(dv-2*gv)*(dv+2*gv-1));
p2v=str2func(vectorize(p2));
p2_eval=p2v(D,G2,G3,a);

p3=@(dv,gv,gvv,alpha)((-16*alpha^2+28*alpha-4)*gv^3+(-28*alpha+8)*gvv*gv^2+((4*alpha^2-7*alpha+1)*dv^2+(6*alpha-2)*gvv*dv+8*gvv^2)*gv+(6*((alpha-1/2)*dv+2/3*gvv))*dv*gvv)/((dv+2*gv-1)*(dv^2-4*gv^2));
p3v=str2func(vectorize(p3));
p3_eval=p3v(D,G2,G3,a);

region1=(p2_eval>0).*((p2_eval+p3_eval)>0);
region2=(p2_eval>0).*((p2_eval+p3_eval)<0).*((p2_eval-p3_eval)>0);
region3=(p2_eval<0).*((p2_eval+p3_eval)<0).*((p2_eval-p3_eval)>0);
region4=(p2_eval<0).*((p2_eval+p3_eval)<0).*((p2_eval-p3_eval)<0);
region5=(p2_eval<0).*((p2_eval+p3_eval)>0).*((p2_eval-p3_eval)<0);

load('RGB_cols.mat','cols')
figure('units','normalized','position',[0 0.1 1 1/3])
for i=1:5
    subplot(1,5,i)
isoplotter(eval(['region',num2str(i)]),i,Ids,cols,D,G2,G3)
set(gca,'FontSize',15)
end

% axis([0 10 0 10 -5 5])
% legend(Names,'location','eo')

export_fig('../Pictures/DG2G3_iso.png','-r300')

function isoplotter(p,i,Ids,cols,D,G2,G3)
smoothedV = imgaussfilt3(p.*Ids, 2); % Sigma = 1 for moderate smoothing

[faces,verts] =isosurface(D,G2,G3,smoothedV,0.5);
patch('Vertices',verts,'Faces',faces,...
    'FaceColor',cols(i,:),'EdgeColor','none')
% camlight('headlight');
camlight('left');
camlight('right');
lighting flat;
% material dull;
material([0.5, 0.5, 0.1]);
xlabel('$D$')
ylabel('$G_2$')
zlabel('$G_3$')
set(gca,'YDir','reverse')
view([-50-180 20])
axis equal
axis([0 10 0 5 -5 5])
end

function shellMatrix = convert2shell(logicalMatrix)
    % Ensure the input is a logical 3D matrix
    if ~islogical(logicalMatrix) || ndims(logicalMatrix) ~= 3
        error('Input must be a 3D logical matrix.');
    end

    % Initialize the shell matrix with NaNs
    shellMatrix = NaN(size(logicalMatrix));

    % Find the interior region (exclude the boundary)
    interiorMatrix = false(size(logicalMatrix));
    interiorMatrix(2:end-1, 2:end-1, 2:end-1) = true;

    % Define a 3x3x3 kernel to check the neighborhood
    kernel = ones(3, 3, 3);

    % Convolve the logical matrix to count the neighbors
    neighborCount = convn(double(logicalMatrix), kernel, 'same');

    % Identify the shell (elements that are 1, not on boundary, and have neighbors < 27)
    shellMask = logicalMatrix & interiorMatrix & (neighborCount < 27);

    % Assign shell values (keep as 1 for the shell)
    shellMatrix(shellMask) = 1;
end
