function [sortedscore_ES, sortedscore_Ext, sortedscore_op, sortedscore_cs, sortedscore_ag] = featSel(data)
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

%% Score for Extraversion
dataAlt3 = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Openness','Conscientiousness','Agreeableness'});
dataAlt4 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx3,scores2] = fscmrmr(dataAlt3, 'Extraversion');
bar(scores2(idx3))

xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_Ext = dataAlt4.Properties.VariableNames;

A = ones(138,57);
idx3 = [A;idx3];
idx4 = array2table(idx3);
dataAlt4(139,:) = idx4(139,:);
s = string(VariableNames_Ext);

score_Ext = strings([2,57]);
for i=1:57
    
    score_Ext(1,i)= s(1,i); 
    score_Ext(2,i)= string(table2cell(dataAlt4(139,i)));
    
end
%%Sort Score of Extraversion Data
[~,idx3] = sort(str2double(score_Ext(2,:))); 
sortedscore_Ext = score_Ext(:,idx3);

%% Score for Openness
dataAlt3 = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Extraversion','Conscientiousness','Agreeableness'});
dataAlt4 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx3,scores2] = fscmrmr(dataAlt3, 'Openness');
bar(scores2(idx3))

xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_Op = dataAlt4.Properties.VariableNames;

A = ones(138,57);
idx3 = [A;idx3];
idx4 = array2table(idx3);
dataAlt4(139,:) = idx4(139,:);
s = string(VariableNames_Op);

score_op = strings([2,57]);
for i=1:57
    
    score_op(1,i)= s(1,i); 
    score_op(2,i)= string(table2cell(dataAlt4(139,i)));
    
end
%%Sort Score of Openness Data
[~,idx3] = sort(str2double(score_op(2,:))); 
sortedscore_op = score_op(:,idx3);

%% Score for Conscientiousness
dataAlt3 = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Extraversion','Openness','Agreeableness'});
dataAlt4 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx3,scores2] = fscmrmr(dataAlt3, 'Conscientiousness');
bar(scores2(idx3))

xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_Cs = dataAlt4.Properties.VariableNames;

A = ones(138,57);
idx3 = [A;idx3];
idx4 = array2table(idx3);
dataAlt4(139,:) = idx4(139,:);
s = string(VariableNames_Cs);

score_cs = strings([2,57]);
for i=1:57
    
    score_cs(1,i)= s(1,i); 
    score_cs(2,i)= string(table2cell(dataAlt4(139,i)));
    
end
%%Sort Score of Conscientiousness Data
[~,idx3] = sort(str2double(score_cs(2,:))); 
sortedscore_cs = score_cs(:,idx3);

%% Score for Agreeableness
dataAlt3 = removevars(data,{'Var1','ID','fluidIQ','Emotional_Stability','Extraversion','Openness','Conscientiousness'});
dataAlt4 = removevars(data,{'Var1','ID','fluidIQ','Extraversion','Openness','Conscientiousness','Agreeableness', 'Emotional_Stability'});

% rank features
[idx3,scores2] = fscmrmr(dataAlt3, 'Agreeableness');
bar(scores2(idx3))

xlabel('Predictor rank')
ylabel('Predictor importance score')
VariableNames_ag = dataAlt4.Properties.VariableNames;

A = ones(138,57);
idx3 = [A;idx3];
idx4 = array2table(idx3);
dataAlt4(139,:) = idx4(139,:);
s = string(VariableNames_ag);

score_ag = strings([2,57]);
for i=1:57
    
    score_ag(1,i)= s(1,i); 
    score_ag(2,i)= string(table2cell(dataAlt4(139,i)));
    
end
%%Sort Score of Conscientiousness Data
[~,idx3] = sort(str2double(score_ag(2,:))); 
sortedscore_ag = score_ag(:,idx3);
end