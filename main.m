% read data
data = readmatrix('dataSetAI_2019.xltx');

% determine Features matrix and Target matrix
T = data(:,7:11);
P = data(:,3:5);
P2 = data(:,12:end);
P = cat(2,P,P2);

normalized = normalize(P,'range');

PT = readtable('dataSetAI_2019.xltx');
PTalt = removevars(PT,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness'});
% rank features
[idx] = fscmrmr(PTalt, 'Emotional_Stability');
v = zeros(1,57);
novo = [idx;v];
[l,c] = size(novo);
A = [l,c];
for i = 1:c
    
    A(1,i) = num2str(novo(1,i));

end

for i = 1:57
    for j = 1:57
        if idx(i) == j
            A(2,j) = PTalt.Properties.VariableNames{i};
        end
    end
end

%bar(scores(idx))
%xticklabels(strrep(PT.Properties.VariableNames(idx),'_','\_'))
%xtickangle(90)

% lasso
%lambda = 0:.01:.5;
%[B, S] = lasso(P,T(:,1),'Lambda',lambda)

% call autoencoder
%[P_encoder, T_encoder] = encoderNN(P',T',20,1000)

% Principal Component Analysis
[coeff,score] = pca(normalized);


% train network

% test network

% profit