%% read data
data = readtable('dataSetAI_2019.xltx');

%% Feature selection
[sortedscore_ES, sortedscore_Ext, sortedscore_op, sortedscore_cs, sortedscore_ag] = featSel(data);

% find common features

% select final features


%% Determine Features matrix and Target matrix
T = data(:,7:11);
P = data(:,3:5);
P2 = data(:,12:end);
P = cat(2,P,P2);

% convert table to matrix
T = table2array(T);
P = table2array(P);

% balance data
normalized = normalize(P,'range');

%% Networks' training

%split data - 90% for training and validation, 10% for testing
PTreino = P(1:floor(137*0.9),:);
TTreino = T(1:floor(137*0.9),:);
PTeste = P(floor(137*0.9)+1:end,:);
TTeste = T(floor(137*0.9)+1:end,:);

% train networks for each personality trait
netN = classifier(PTreino,TTreino(:,1));
save('trainedNetN','netN');
netE = classifier(PTreino,TTreino(:,2));
save('trainedNetE','netE');
netO = classifier(PTreino,TTreino(:,3));
save('trainedNetO','netO');
netC = classifier(PTreino,TTreino(:,4));
save('trainedNetC','netC');
netA = classifier(PTreino,TTreino(:,5));
save('trainedNetA','netA');

%% Networks' testing
[resultsN, sensN, especN] = testNet (netN, PTeste, TTeste(:,1));
[resultsE, sensE, especE] = testNet (netE, PTeste, TTeste(:,2));
[resultsO, sensO, especO] = testNet (netO, PTeste, TTeste(:,3));
[resultsC, sensC, especC] = testNet (netC, PTeste, TTeste(:,4));
[resultsA, sensA, especA] = testNet (netA, PTeste, TTeste(:,5));

%% Results
disp("Results");
disp("Emotional Stability ", resultsN);
disp("Extraversion ", resultsE);
disp("Openness ", resultsO);
disp("Conscientiousness ", resultsC);
disp("Agreeableness ", resultsA);
disp("---------------");
disp("Sensitivity - Emotional Stability " + sensN);
disp("Specificity - da Emotional Stability " + especN);
disp("----");
disp("Sensitivity - Extraversion " + sensE);
disp("Specificity - Extraversion " + especE);
disp("----");
disp("Sensitivity - Openness " + sensO);
disp("Specificity - Openness " + especO);
disp("----");
disp("Sensitivity - Conscientiousness " + sensC);
disp("Specificity - Conscientiousness " + especC);
disp("----");
disp("Sensitivity - Agreeableness " + sensA);
disp("Specificity - Agreeableness " + especA);