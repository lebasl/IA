function trainedNet = classifier(PTreino,TTreino)

trainFunc = 'trainlm';
transferFunc = 'logsig';

net = feedforwardnet(10,trainFunc);

% Configuração das Camadas Escondidas
net.numLayers = 2;
net.layers{1}.transferFcn = transferFunc;

%Parametros de Treino
net.trainParam.epochs = 1000;
net.trainParam.min_grad = 10e-20;
net.trainParam.lr = 0.01;
net.performFcn = 'msereg';
net.trainParam.max_fail = 500;
net.trainParam.goal = 1e-20;

%Divisão do Set Balanceado para treino e validação
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 20/100;

trainedNet = train(net,PTreino',TTreino');
end