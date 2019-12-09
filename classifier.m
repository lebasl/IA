%function trainedNet = classifier(PTreino,TTreino)

data = readtable('dataSetAI_2019.xltx');
T = data(:,7:11);
P = data(:,3:5);
P2 = data(:,12:end);
P = cat(2,P,P2);
T = table2array(T);
P = table2array(P);
P = normalize(P,'range');
PTreino = P(1:floor(137*0.9),:);
TTreino = T(1:floor(137*0.9),:);
TTreino = TTreino(:,1);


trainFunc = 'traingd';
transferFunc = 'logsig';

net = feedforwardnet(10,trainFunc);

% Configuração das Camadas Escondidas

net.numLayers = 2;
net.layers{1}.transferFcn = transferFunc;

%Parametros de Treino
net.trainParam.epochs = 1000;
net.trainParam.min_grad = 10e-9;
net.trainParam.lr = 0.01;
net.performFcn = 'msereg';
net.trainParam.max_fail = 100;
net.trainParam.goal = 1e-9;

%Divisão do Set Balanceado para treino e validação
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 20/100;

PTreino = PTreino';
trainedNet = train(net,PTreino,TTreino);
%end