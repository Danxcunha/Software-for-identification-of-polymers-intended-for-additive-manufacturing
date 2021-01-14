%% create PCA-table

load dataset.mat

%% Placing wavelength as variable in collumns
X = absor';

colorIndexMap = [0 1 0;...
    1 0.5 0.8;...
    0.5 0.5 0.5;...
    0.8 0.8 0.8;...
    0.5 0 0.5;...
    0.87 0.5 0;...
    0.8 0.8 0;...
    0.1 0.1 0.1;...
    0.5 0.25 0;...
    0 0 1];

%% Now, we need to add the responses in the following collumns
%there are 3 responses, material, color and fabricant
Y = zeros(size(X,1),2);
%My data have 3 materials: PLA(1), ABS(2) and PETG(3)
%Colors: green(1), natural(2), gray(3), white(4),purple(5), orange(6),
%yellow(7), black(8), brown(9), blue(10).
%makers: 3DLab, 3DFil, Cliev, UP_3D
C_map = zeros(size(CAB,1),3);
for i=1:size(CAB)
    matStr = char(CAB{i});
    switch matStr(1:3)
        case 'PLA'
            Y(i,1) = -1;
            colStr = matStr(5:8);
            switch colStr
                case 'verd'
                    Y(i,2) = -1;
                    C_map(i,:) = colorIndexMap(1,:);
                case 'natu'
                    Y(i,2) = -0.8;
                    C_map(i,:) = colorIndexMap(2,:);
                case 'cinz'
                    Y(i,2) = -0.6;
                    C_map(i,:) = colorIndexMap(3,:);
                case 'bran'
                    Y(i,2) = -0.4;
                    C_map(i,:) = colorIndexMap(4,:);
                case 'roxo'
                    Y(i,2) = -0.2;
                    C_map(i,:) = colorIndexMap(5,:);
                case 'lara'
                    Y(i,2) = 0.2;
                    C_map(i,:) = colorIndexMap(6,:);
                case 'amar'
                    Y(i,2) = 0.4;
                    C_map(i,:) = colorIndexMap(7,:);
                case 'pret'
                    Y(i,2) = 0.6;
                    C_map(i,:) = colorIndexMap(8,:);
                case 'marr'
                    Y(i,2) = 0.8;
                    C_map(i,:) = colorIndexMap(9,:);
                case 'azul'
                    Y(i,2) = 1;
                    C_map(i,:) = colorIndexMap(10,:);
            end
        case 'ABS'
            Y(i,1) = 0;
            colStr = matStr(5:8);
            switch colStr
                case 'verd'
                    Y(i,2) = -1;
                    C_map(i,:) = colorIndexMap(1,:);
                case 'natu'
                    Y(i,2) = -0.8;
                    C_map(i,:) = colorIndexMap(2,:);
                case 'cinz'
                    Y(i,2) = -0.6;
                    C_map(i,:) = colorIndexMap(3,:);
                case 'bran'
                    Y(i,2) = -0.4;
                    C_map(i,:) = colorIndexMap(4,:);
                case 'roxo'
                    Y(i,2) = -0.2;
                    C_map(i,:) = colorIndexMap(5,:);
                case 'lara'
                    Y(i,2) = 0.2;
                    C_map(i,:) = colorIndexMap(6,:);
                case 'amar'
                    Y(i,2) = 0.4;
                    C_map(i,:) = colorIndexMap(7,:);
                case 'pret'
                    Y(i,2) = 0.6;
                    C_map(i,:) = colorIndexMap(8,:);
                case 'marr'
                    Y(i,2) = 0.8;
                    C_map(i,:) = colorIndexMap(9,:);
                case 'azul'
                    Y(i,2) = 1;
                    C_map(i,:) = colorIndexMap(10,:);
            end
        case 'PET'
            Y(i,1) = 1;
            colStr = matStr(6:9);
            switch colStr
                case 'verd'
                    Y(i,2) = -1;
                    C_map(i,:) = colorIndexMap(1,:);
                case 'natu'
                    Y(i,2) = -0.8;
                    C_map(i,:) = colorIndexMap(2,:);
                case 'cinz'
                    Y(i,2) = -0.6;
                    C_map(i,:) = colorIndexMap(3,:);
                case 'bran'
                    Y(i,2) = -0.4;
                    C_map(i,:) = colorIndexMap(4,:);
                case 'roxo'
                    Y(i,2) = -0.2;
                    C_map(i,:) = colorIndexMap(5,:);
                case 'lara'
                    Y(i,2) = 0.2;
                    C_map(i,:) = colorIndexMap(6,:);
                case 'amar'
                    Y(i,2) = 0.4;
                    C_map(i,:) = colorIndexMap(7,:);
                case 'pret'
                    Y(i,2) = 0.6;
                    C_map(i,:) = colorIndexMap(8,:);
                case 'marr'
                    Y(i,2) = 0.8;
                    C_map(i,:) = colorIndexMap(9,:);
                case 'azul'
                    Y(i,2) = 1;
                    C_map(i,:) = colorIndexMap(10,:);
            end
    end
    
end

%% fixed mapping to all data be between -1 and 1
%a = 20/6 and b = -4/6 ->-0.1 a 0.5 para -1 a 1.
Xnorm = X*20/6  - 4/6;
data = [Xnorm Y];
% C_map = repmat(C_map,[1 size(Xnorm,2)]);


% Wnm = repmat(wavelength',[size(Xnorm,1) 1]);
% Classes = Y(:,1)*10+Y(:,2);
% class3d = repmat(Classes, [1 size(Xnorm,2)]);
indPLA = [];
indABS = [];
indPETG = 85:96;
indBeG = [];
itPLA = 1;
itABS = 1;
itBeG = 1;
hfig1 = figure(1);
axes1 = axes('Parent',hfig1);
hold(axes1,'on');
hfig2 = figure(2);
axes2 = axes('Parent',hfig2);
hold(axes2,'on');
hfig3 = figure(3);
axes3 = axes('Parent',hfig3);
hold(axes3,'on');
hfig4 = figure(4);
axes4 = axes('Parent',hfig4);
hold(axes4,'on');

indPLAcinza = [];
indPLApreto = [];
indPLAMarrom = [];
indABScinza = [];
for i=1:size(Xnorm,1)
    auxStr = char(nH{i});
    posChar = auxStr(end-2);
    if(posChar == '1')
        eta=1;
    else
        eta = 0.5;
    end
    if(i<=54)
        if(Y(i,2)~=-0.6 && Y(i,2)~= 0.6 && Y(i,2)~= 0.8)
            title(axes1,'PLA');
            plot(wavelength,X(i,:),'Color',(C_map(i,:))*eta,'Parent',axes1);
            indPLA(itPLA) =i; %quais os índices da matriz X que são PLA colorido.
            itPLA=itPLA+1;
        end 
    elseif(i<=84)
        if(Y(i,2)~=-0.6 && Y(i,2)~= 0.6)
            title(axes2,'ABS');
            plot(wavelength,X(i,:),'Color',C_map(i,:)*eta,'Parent',axes2);
            hold on
            indABS(itABS) =i; %quais os índices da matriz X que são ABS colorido.
            itABS=itABS+1;
        end
    else
        title(axes3,'PETG');
        plot(wavelength,X(i,:),'Color',C_map(i,:)*eta,'Parent',axes3);
    end
    if(Y(i,2)==-0.6 || Y(i,2)== 0.6 || Y(i,2)== 0.8)
        title(axes4,'Black,Gray and Brown');
        if(Y(i,1) == -1)
            if(Y(i,2)==-0.6)%PLA cinza
                plot(wavelength,X(i,:),'Color',[0 0 eta],'Parent',axes4);
                indPLAcinza = [indPLAcinza i];
            elseif(Y(i,2)==0.6)%PLA preto
                plot(wavelength,X(i,:),'Color',[0 eta 0],'Parent',axes4);
                indPLApreto = [indPLApreto i];
            else%PLA marrom
                plot(wavelength,X(i,:),'Color',[eta eta 0],'Parent',axes4);
                indPLAMarrom = [indPLAMarrom i];
            end
        else %ABS
            if(Y(i,2)==-0.6)
                plot(wavelength,X(i,:),'Color',[eta 0 0],'Parent',axes4);
                indABScinza = [indABScinza i];
            elseif(Y(i,2)==0.6)
                plot(wavelength,X(i,:),'Color',[eta 0 eta],'Parent',axes4);
            else
                plot(wavelength,X(i,:),'Color',[0 eta eta],'Parent',axes4);
            end
        end
        indBeG(itBeG) =i;
        itBeG=itBeG+1;
    end
end

legend(axes1,nH{indPLA});
legend(axes2,nH{indABS});
legend(axes3,nH{97:end});
legend(axes4,nH{indBeG});
%% 
meanPLA = mean(X(indPLA,:),1);
plot(axes1,wavelength,meanPLA,'k','LineWidth',4);
meanABS = mean(X(indABS,:),1);
plot(axes2,wavelength,meanABS,'k','LineWidth',4);
meanPET = mean(X(97:end,:),1);
plot(axes3,wavelength,meanPET,'k','LineWidth',4);
meanBeG = mean(X(indBeG,:),1);
plot(axes4,wavelength,meanBeG,'k','LineWidth',4);
%%
figure;
meanPLACinza = mean(X(indPLAcinza,:),1);
meanPLAPreto = mean(X(indPLApreto,:),1);
meanPLAMarrom = mean(X(indPLAMarrom,:),1);
meanABSCinza = mean(X(indABScinza,:),1);
plot(wavelength,meanPLA,'g','LineWidth',4);
hold on;
plot(wavelength,meanPLACinza,'b','LineWidth',4);
plot(wavelength,meanPLAPreto,'k','LineWidth',4);
plot(wavelength,meanPLAMarrom,'r','LineWidth',4);
legend('Color','Gray ','Black','Brown');
%%
figure;
plot(wavelength,meanABS,'g','LineWidth',4);
hold on;
plot(wavelength,meanABSCinza,'b','LineWidth',4);
plot(wavelength,meanPLACinza,'k:','LineWidth',2);
legend('ABS colorido',' ABS cinza  ',' PLA cinza  ');