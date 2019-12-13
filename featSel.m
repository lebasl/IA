function [sortedscore_ES, sortedscore_Ext, sortedscore_Op, sortedscore_CS, sortedscore_Ag] = featSel(data)

%data = readtable('dataSetAI_2019.xltx');
%% Score for Emotional_Stability
dataAlt = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness'});
dataAlt2 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx,scores] = fscmrmr(dataAlt, 'Emotional_Stability');
bar(scores(idx))
xticklabels(strrep(dataAlt.Properties.VariableNames(idx),'_','\_'))
xtickangle(90)
xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_ES = dataAlt2.Properties.VariableNames;

A = ones(138,57);
idaux = [A;idx];
idx2 = array2table(idaux);
dataAlt2(139,:) = idx2(139,:);
s = string(VariableNames_ES);

score_ES = strings([2,57]);

[~,c] = size(idx);

for i=1:c
    
        scores_f(:,i) = scores(idx(1,i));
    
end

for i=1:57
    
    score_ES(1,i)= s(1,i); 
    score_ES(2,i)= string(table2cell(dataAlt2(139,i)));

end
%%Sort Score of Emotional_Stability Data
[~,indices] = sort(str2double(score_ES(2,:))); 

%Final Sorted array
sortedscore_ES = strings([3,57]);

sortedscore_ES(1:2,:) = score_ES(:,indices);
%Compile the results with the scores for further reduction
sortedscore_ES(3,:) = scores_f(1,:);

%% Score for Extraversion
dataAlt = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Openness','Conscientiousness','Agreeableness'});
dataAlt2 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx,scores] = fscmrmr(dataAlt, 'Extraversion');
bar(scores(idx))
xticklabels(strrep(dataAlt.Properties.VariableNames(idx),'_','\_'))
xtickangle(90)
xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_Ext = dataAlt2.Properties.VariableNames;

A = ones(138,57);
idaux = [A;idx];
idx2 = array2table(idaux);
dataAlt2(139,:) = idx2(139,:);
s = string(VariableNames_Ext);

score_Ext = strings([2,57]);

[~,c] = size(idx);

for i=1:c
    
        scores_f(:,i) = scores(idx(1,i));
    
end

for i=1:57
    
    score_Ext(1,i)= s(1,i); 
    score_Ext(2,i)= string(table2cell(dataAlt2(139,i)));

end
%%Sort Score of Extraversion Data
[~,indices] = sort(str2double(score_Ext(2,:))); 

%Final Sorted array
sortedscore_Ext = strings([3,57]);

sortedscore_Ext(1:2,:) = score_Ext(:,indices);
%Compile the results with the scores for further reduction
sortedscore_Ext(3,:) = scores_f(1,:);

%% Score for Openness
dataAlt = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Extraversion','Conscientiousness','Agreeableness'});
dataAlt2 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx,scores] = fscmrmr(dataAlt, 'Openness');
bar(scores(idx))
xticklabels(strrep(dataAlt.Properties.VariableNames(idx),'_','\_'))
xtickangle(90)
xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_Op = dataAlt2.Properties.VariableNames;

A = ones(138,57);
idaux = [A;idx];
idx2 = array2table(idaux);
dataAlt2(139,:) = idx2(139,:);
s = string(VariableNames_Op);

score_Op = strings([2,57]);

[~,c] = size(idx);

for i=1:c
    
        scores_f(:,i) = scores(idx(1,i));
    
end

for i=1:57
    score_Op(1,i)= s(1,i); 
    score_Op(2,i)= string(table2cell(dataAlt2(139,i)));

end
%%Sort Score of Openness Data
[~,indices] = sort(str2double(score_Op(2,:))); 

%Final Sorted array
sortedscore_Op = strings([3,57]);

sortedscore_Op(1:2,:) = score_Op(:,indices);
%Compile the results with the scores for further reduction
sortedscore_Op(3,:) = scores_f(1,:);

%% Score for Conscientiousness
dataAlt = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Extraversion','Openness','Agreeableness'});
dataAlt2 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx,scores] = fscmrmr(dataAlt, 'Conscientiousness');
bar(scores(idx))
xticklabels(strrep(dataAlt.Properties.VariableNames(idx),'_','\_'))
xtickangle(90)
xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_Cs = dataAlt2.Properties.VariableNames;

A = ones(138,57);
idaux = [A;idx];
idx2 = array2table(idaux);
dataAlt2(139,:) = idx2(139,:);
s = string(VariableNames_Cs);

score_Cs = strings([2,57]);

[~,c] = size(idx);

for i=1:c
    
        scores_f(:,i) = scores(idx(1,i));
    
end

for i=1:57
    score_Cs(1,i)= s(1,i); 
    score_Cs(2,i)= string(table2cell(dataAlt2(139,i)));

end
%%Sort Score of Conscientiousness Data
[~,indices] = sort(str2double(score_Cs(2,:))); 

%Final Sorted array
sortedscore_CS = strings([3,57]);

sortedscore_CS(1:2,:) = score_Cs(:,indices);
%Compile the results with the scores for further reduction
sortedscore_CS(3,:) = scores_f(1,:);

%% Score for Agreeableness
dataAlt = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Extraversion','Openness','Conscientiousness'});
dataAlt2 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx,scores] = fscmrmr(dataAlt, 'Agreeableness');
bar(scores(idx))
xticklabels(strrep(dataAlt.Properties.VariableNames(idx),'_','\_'))
xtickangle(90)
xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_Ag = dataAlt2.Properties.VariableNames;

A = ones(138,57);
idaux = [A;idx];
idx2 = array2table(idaux);
dataAlt2(139,:) = idx2(139,:);
s = string(VariableNames_Ag);

score_Ag = strings([2,57]);

[~,c] = size(idx);

for i=1:c
    
        scores_f(:,i) = scores(idx(1,i));
    
end

for i=1:57
    score_Ag(1,i)= s(1,i); 
    score_Ag(2,i)= string(table2cell(dataAlt2(139,i)));

end
%%Sort Score of Agreeableness Data
[~,indices] = sort(str2double(score_Ag(2,:))); 

%Final Sorted array
sortedscore_Ag = strings([3,57]);

sortedscore_Ag(1:2,:) = score_Ag(:,indices);
%Compile the results with the scores for further reduction
sortedscore_Ag(3,:) = scores_f(1,:);

end