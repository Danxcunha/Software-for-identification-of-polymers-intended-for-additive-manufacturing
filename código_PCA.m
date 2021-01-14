%% create PCA-table

load dataset.mat

%% Placing wavelength as variable in collumns
X = ABSOR'; %transpõe a matriz. (96x228) 

colorIndexMap = [0 1 0;... %Verde
    1 0.5 0.8;... %natural que era um rosinha
    0.5 0.5 0.5;... %cinza
    0.8 0.8 0.8;... %"branco"
    0.5 0 0.5;... %roxo
    0.87 0.5 0;... %Laranja
    0.8 0.8 0;... %amarelo
    0.1 0.1 0.1;... %preto
    0.5 0.25 0;... %marrom
    0 0 1]; %azul

%% Now, we need to add the responses in the following collumns
%there are 3 responses, material, color and fabricant
Y = zeros(size(X,1),2);
%My data have 3 materials: PLA(1), ABS(2) and PETG(3)
%Colors: green(1), natural(2), gray(3), white(4),purple(5), orange(6),
%yellow(7), black(8), brown(9), blue(10).
%makers: 3DLab, 3DFil, Cliev, UP_3D
C_map = zeros(size(CAB,2),3);
for i=1:size(CAB,2)
    matStr = char(CAB{i});
    switch matStr(1:3) %Aqui verifica os 3 primeiros carac.
        case 'PLA'
            Y(i,1) = -1;
            colStr = matStr(5:8);
            switch colStr
                case 'verd'
                    Y(i,2) = -1;
                    C_map(i,:) = colorIndexMap(1,:);
                case 'Tran'
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
                case 'Tran'
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
                case 'Tran'
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

%% Plot Scatter

% scatter3(X(:,1),X(:,2),X(:,3),100,C_map,'filled');

indPreto = 19:24;
indCinCl = 37:42;
indCinPL = 43:48;
indCinAB = 92:103;
indUteis = [1:18, 25:36, 49:91, 104:115];

% figure;
% scatter3(X(indUteis,1),X(indUteis,2),X(indUteis,3),100,C_map(indUteis,:),'filled');

indExpan = [indUteis, indPreto, indCinCl];

figure;
scatter3(X(indExpan,1),X(indExpan,2),X(indExpan,3),100,C_map(indExpan,:),'filled');
hold on

pca1 = -0.005:0.006:0.025;
pca2 = -0.025:0.006:0.01;
[Px,Py] = meshgrid(pca1,pca2);

Data = [X(indExpan,:) Y(indExpan,1)];

[trainedClassifier, validationAccuracy] = trainClassifier(Data);

K12 = trainedClassifier.ClassificationDiscriminant.Coeffs(1,2).Const;
K13 = trainedClassifier.ClassificationDiscriminant.Coeffs(1,3).Const;
K23 = trainedClassifier.ClassificationDiscriminant.Coeffs(2,3).Const;

L12 = trainedClassifier.ClassificationDiscriminant.Coeffs(1,2).Linear;
L13 = trainedClassifier.ClassificationDiscriminant.Coeffs(1,3).Linear;
L23 = trainedClassifier.ClassificationDiscriminant.Coeffs(2,3).Linear;

P12 = (K12 + L12(1)*Px + L12(2)*Py)/(-L12(3));
P13 = (K13 + L13(1)*Px + L13(2)*Py)/(-L13(3));
P23 = (K23 + L23(1)*Px + L23(2)*Py)/(-L23(3));
mesh(Px,Py,P12,'FaceColor','none')
mesh(Px,Py,P13,'FaceColor','none')
mesh(Px,Py,P23,'FaceColor','none')



