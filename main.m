% read data
data = readtable('dataSetAI_2019.xltx');

% rank features

% Emotional Stability
dataAlt = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness'});
dataAlt2 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

[idx] = fscmrmr(dataAlt, 'Emotional_Stability');
VariableNames_ES = dataAlt2.Properties.VariableNames;

A = ones(138,57);
idx = [A;idx];
idx2 = array2table(idx);
dataAlt2(139,:) = idx2(139,:);
s = string(VariableNames_ES);

score_ES = strings([2,57]);
for i=1:57
    
    score_ES(1,i)= s(1,i); 
    score_ES(2,i)= string(table2cell(dataAlt2(139,i)));
    
end

%%Sort Score of Emotional_Stability Data
[~,idx] = sort(str2double(score_ES(2,:))); 
sortedscore_ES = score_ES(:,idx);

% find common selection features


% choose final selection features


% determine Features matrix and Target matrix
T = data(:,7:11);
P = data(:,3:5);
P2 = data(:,12:end);
P = cat(2,P,P2);

% convert table to matrix
T = table2array(T);
P = table2array(P);

% balance data
normalized = normalize(P,'range');
% NÃO ESTÁ A USAR USADO! MAS ACHO Q DEVE ?

% split data - 90% for training and validation, 10% for testing
PTreino = P(1:floor(137*0.9),:);
TTreino = T(1:floor(137*0.9),:);
PTeste = P(floor(137*0.9)+1:end,:);
TTeste = T(floor(137*0.9)+1:end,:);

% train the network
net = classifier(PTreino,TTreino);

% test the network
[results, sens_N,espec_N,sens_O,espec_O,sens_A,espec_A,sens_C,espec_C,sens_E,espec_E] = testNet (net, PTeste, TTeste);

% translate OCEAN into percentage
total = 0;
percentagens = zeros(1,5);
for i = 1:size(results)
    total = total + results(i);
    percentagens(1,i) = results(i)/total;
end

% print results
disp("Results");
disp("Emotional Stability ", percentagens(1,1));
disp("Extraversion ", percentagens(1,2));
disp("Openness ", percentagens(1,3));
disp("Conscientiousness ", percentagens(1,4));
disp("Agreeableness ", percentagens(1,5));
disp("---------------");
disp("Sensitivity - Emotional Stability " + sens_N);
disp("Specificity - da Emotional Stability " + espec_N);
disp("----");
disp("Sensitivity - Extraversion " + sens_E);
disp("Specificity - Extraversion " + espec_E);
disp("----");
disp("Sensitivity - Openness " + sens_O);
disp("Specificity - Openness " + espec_O);
disp("----");
disp("Sensitivity - Conscientiousness " + sens_C);
disp("Specificity - Conscientiousness " + espec_C);
disp("----");
disp("Sensitivity - Agreeableness " + sens_A);
disp("Specificity - Agreeableness " + espec_A);