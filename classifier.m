function trainedNet = classifier(PTreino,TTreino)

trainFunc = 'traingd';
transferFunc = 'logsig';

net = feedforwardnet(2,trainFunc);

% Configura��o das Camadas Escondidas

net.numLayers = 2;
net.layers{1}.transferFcn = transferFunc;

%Parametros de Treino
net.trainParam.epochs = 1000;
net.trainParam.min_grad = 10e-9;
net.trainParam.lr = 0.01;
net.performFcn = 'msereg';
net.trainParam.max_fail = 100;
net.trainParam.goal = 1e-9;

%Divis�o do Set Balanceado para treino e valida��o
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 20/100;

trainedNet = train(net,PTreino',TTreino);

save('trainedNet','trainedNet');
end
