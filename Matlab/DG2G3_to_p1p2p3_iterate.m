ccc
l=1;
figure('units','normalized','Position',[0 0.1 1 0.5])
tiledlayout('flow')
% nexttile
n=100;
[D,G2,G3]=meshgrid(linspace(0,10,n),linspace(1,5,n),linspace(-5,5,n));


Ids=(G2<D/2);

for a=[0.2:0.2:1]

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


    for i=1:5
        eval(['regiona',num2str(i),'=region',num2str(i),'.*Ids;']);
        eval(['region',num2str(i),'(regiona',num2str(i),'==0)=nan;']);
        Names{i}=['Region ',num2str(i)];
    end

    nexttile
    % subplot(1,6,l)
    % l=l+1;
    hold on
    title(['$\alpha= $',num2str(a)])
    trans = 1;
    for i=1:5
        h{i}=scatter3(D(Ids),G2(Ids),G3(Ids),2,eval(['region',num2str(i),'(Ids)'])+i,'filled');
        set(h{i}, 'MarkerEdgeAlpha', trans, 'MarkerFaceAlpha', trans)
        plot3(10*[1 1],[1 1],[-5 5],'k','LineWidth',1)
        plot3([2 10],[1 1],[5 5],'k','LineWidth',1)
        plot3([10 10],[1 5],[5 5],'k','LineWidth',1)
        plot3([2 10],[1 5],[5 5],'k','LineWidth',1)

        % scatter3(D(Ids),G2(Ids),0*G3(Ids),2,'MarkerFaceColor',[0 0 0]),Names{6}=['Zero'];
        xlabel('$D$')
        ylabel('$G_2$')
        yticks([0,5])
        zlabel('$G_3$')
        set(gca,'YDir','reverse')
        axis equal
        % axis tight
        view([-50-180 20])
        axis([0 10 0 5 -5 5])
        set(gca,'FontSize',15)
        if abs(a-0.6)<0.01
            legend([h{:}],Names,'location','no','orientation','h')
        end

    end
end
export_fig('../Pictures/DG2G3alpha.png','-r300')
function colours = extractCol(scatterHandles)
% Function to extract unique RGB colours from scatter3 plot handles
% Inputs:
%   scatterHandles - Cell array of scatter3 plot handles
% Outputs:
%   colours - Cell array, where each cell contains a single RGB triplet
%
% Usage:
%   colours = extractUniqueScatter3Colours(h);

% Check if the input is a cell array
if ~iscell(scatterHandles)
    error('Input must be a cell array of scatter3 plot handles.');
end

% Initialise output
colours = cell(numel(scatterHandles), 1);

% Loop through each scatter3 handle
for i = 1:numel(scatterHandles)
    scatterHandle = scatterHandles{i};

    % Ensure the scatter3 handle is valid
    if ~ishandle(scatterHandle) || ~strcmp(get(scatterHandle, 'Type'), 'scatter')
        error('Invalid scatter3 handle provided at index %d.', i);
    end

    % Get the colormap and colour limits
    colormapData = colormap(ancestor(scatterHandle, 'figure'));
    cLimits = caxis(ancestor(scatterHandle, 'axes'));

    % Get scalar values used for colouring
    cData = scatterHandle.CData;

    % Safeguard: Ensure cData is within the colour limits
    cData = max(min(cData, cLimits(2)), cLimits(1)); % Clamp values to [cLimits(1), cLimits(2)]

    % Normalise to [0, 1] and map to colormap indices
    normalisedCData = (cData - cLimits(1)) / (cLimits(2) - cLimits(1)); % Normalise
    colourIndices = round(normalisedCData * (size(colormapData, 1) - 1)) + 1; % Map to indices

    % Ensure indices are valid (integer and within range)
    colourIndices = max(min(colourIndices, size(colormapData, 1)), 1);

    % Extract the RGB values for all points
    allColours = colormapData(colourIndices, :);

    % Get the unique colour triplets (should be one unique triplet)
    uniqueColours = unique(allColours, 'rows');

    % Store the unique colour for this scatter3 handle
    colours{i} = uniqueColours;
end
end

function displayRGBColours(rgbMatrix)
% Function to display RGB colours from an n-by-3 matrix
% Inputs:
%   rgbMatrix - An n-by-3 matrix of RGB triplets
%
% Usage:
%   displayRGBColours(rgbMatrix);

% Validate input
if ~ismatrix(rgbMatrix) || size(rgbMatrix, 2) ~= 3
    error('Input must be an n-by-3 matrix.');
end

% Create a figure to display colours
figure;
hold on;
title('RGB Colours');

% Number of rows (colours) in the matrix
n = size(rgbMatrix, 1);

% Plot rectangles for each colour
for i = 1:n
    rectangle('Position', [0, n-i, 1, 1], ...
        'FaceColor', rgbMatrix(i, :), ...
        'EdgeColor', 'none');
    % Add text for the RGB triplet
    text(1.2, n-i+0.5, ...
        sprintf('[%.2f, %.2f, %.2f]', rgbMatrix(i, :)), ...
        'VerticalAlignment', 'middle');
end

% Adjust the axis for better display
axis equal;
axis off;
hold off;
end


function uniqueRGB = UniqueRGB(cellArray)
% Function to concatenate a cell array of n-by-3 matrices and extract unique rows
% while preserving the original order of appearance.
% Inputs:
%   cellArray - Cell array where each cell contains an n-by-3 matrix
% Outputs:
%   uniqueRGB - Unique rows (RGB triplets) from the concatenated matrix
%               in their original order of appearance
%
% Usage:
%   uniqueRGB = concatenateAndUniqueRGBStable(cellArray);

% Validate input
if ~iscell(cellArray)
    error('Input must be a cell array.');
end

% Concatenate all matrices in the cell array
concatenatedMatrix = vertcat(cellArray{:});

% Ensure the concatenated matrix has 3 columns
if size(concatenatedMatrix, 2) ~= 3
    error('All matrices in the cell array must have 3 columns.');
end

% Extract unique rows while preserving their order
[~, uniqueIndices] = unique(concatenatedMatrix, 'rows', 'stable');
uniqueRGB = concatenatedMatrix(sort(uniqueIndices), :);
end
