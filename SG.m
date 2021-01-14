%% Create Savitzky-Golay filter
[B,G] = sgolay(2,7);
dx = (cdo(2) - cdo(1))*1e-3;
[sx, sy] = size(X);
sg1diff_of_x = zeros(sy, sx);
sg2diff_of_x = zeros(sy, sx);
hfig1st = figure('Name','1st derivative', 'NumberTitle', 'off');
axes1st = axex('Parent',hfig1st);
hold(axes1st, 'on');
line(axes1st,[cdo(1) cdo(end)],[0,0],'Color','k','Linewidth',2);
hfig2nd = figure('Name','2nd derivative','NumberTitle','off');
axes2nd = axes('Parent',hfig2nd);
hold(axes2nd, 'on');
line(axes2nd, [cdo(1) cdo(end)],[0 0],'Color','k','Linewidth',2);

colormap = zeros(sx,3);
colormap(indPLA,:) = repmat([0 0 1],lenght(indPLA),1);
colormap(indABS,:) = repmat([0 1 0],lenght(indABS),1);
colormap(indPET,:) = repmat([1 0 0],lenght(indPET),1);
colormap(indPLAcinza,:) = repmat([0.4 0.4 0.8], length(indPLAcinza),1);
colormap(indABScinza,:) = repmat([0.4 0.8 0.4], length(indPLAcinza),1);

for i=1:sx
    sg1diff_of_x(:,i) = conv(X(i,:)',(-1/dx)*G(:,2),'same');
    sg1diff_of_x(:,i) = conv(X(i,:)',(2/dx^2)*G(:,3),'same');
    
    plot(axes1st,cdo,sg1diff_of_x(:,i),'Color',colormap(i,:));
    plot(axes2st,cdo,sg2diff_of_x(:,i),'Color',colormap(i,:));
end
    