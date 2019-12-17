function trainedNet = classifier(PTreino,TTreino)

trainFunc = 'trainlm';
transferFunc = 'logsig';

net = feedforwardnet([5,5],trainFunc);

% Configuração das Camadas Escondidas
net.numLayers = 3;
net.layers{1}.transferFcn = transferFunc;
net.layers{2}.transferFcn = transferFunc;

%Parametros de Treino
net.trainParam.epochs = 2000;
net.trainParam.min_grad = 10e-20;
net.trainParam.lr = 10e-30;
net.performFcn = 'msereg';
net.trainParam.mu_inc	= 2;
net.trainParam.mu_dec	= 1;
net.trainParam.max_fail = 500;
net.trainParam.goal = 1e-99;
net.trainParam.mu_max	= 10e60;



%Divisão do Set Balanceado para treino e validação
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 20/100;

trainedNet = train(net,PTreino',TTreino');
end