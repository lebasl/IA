%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                - Artificial Intelligence 2019/2020 -                  % 
%                   Eduardo Vicente 2016231711 %                  %
%                   Isabel Carvalho 2016212943 %                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% read data
data = readtable('dataSetAI_2019.xltx');

%% Feature selection
% find features
[sortedscore_ES, sortedscore_Ext, sortedscore_op, sortedscore_cs, sortedscore_ag] = featSel(data);

ffES = strings(1,57);
ffExt = strings(1,57);
ffop = strings(1,57);
ffcs = strings(1,57);
ffAg = strings(1,57);
j = 1; k = 1; l = 1; m = 1; n = 1;
% select features to removed
for i=1:57
    
    if(str2double(sortedscore_ES(3,i)) == 0)
        ffES(1,j) = sortedscore_ES(1,i);  %ffES is the matrix with the features that are irrelevant for Emotional_Stability!      
        j = j + 1;
    end
    
    if(str2double(sortedscore_Ext(3,i)) == 0)
        ffExt(1,k) = sortedscore_Ext(1,i);  %ffExt is the matrix with the features that are irrelevant for Extraversion!      
        k = k + 1;
    end
    
    if(str2double(sortedscore_op(3,i)) == 0)
        ffop(1,l) = sortedscore_op(1,i);  %ffop is the matrix with the features that are irrelevant for Openness!      
        l = l + 1;
    end
    
    if(str2double(sortedscore_cs(3,i)) == 0)
         ffcs(1,m) = sortedscore_cs(1,i);  %ffcs is the matrix with the features that are irrelevant for Conscientiousness!      
        m = m + 1;
    end
    
    if(str2double(sortedscore_ag(3,i)) == 0)
        ffAg(1,n) = sortedscore_ag(1,i);  %ffAg is the matrix with the features that are irrelevant for Agreeableness!      
        n = n + 1;
    end
end

%% Determine Features matrix and Target matrix
T = data(:,7:11);
P = data(:,3:5);
P2 = data(:,12:end);
P = cat(2,P,P2);

% remove unwanted features and convert table to matrix
T = table2array(T);
[P_ag, P_cs, P_es, P_ext, P_op] = removeFeat(P, ffAg, ffcs, ffES, ffExt, ffop, j, k, l, m, n);


%% Balance and split data
%split data - 90% for training and validation, 10% for testing
[PTr_ag, PTr_cs, PTr_es, PTr_ext, PTr_op, PTe_ag, PTe_cs, PTe_es, PTe_ext, PTe_op] = splitData(P_ag, P_cs, P_es, P_ext, P_op); 
TTreino = T(1:floor(137*0.9),:);
TTeste = T(1:floor(137*0.1)+1,:);

%% Networks' training
% train networks for each personality trait
netN = classifier(PTr_es,TTreino(:,1));
save('trainedNetN','netN');
netE = classifier(PTr_ext,TTreino(:,2));
save('trainedNetE','netE');
netO = classifier(PTr_op,TTreino(:,3));
save('trainedNetO','netO');
netC = classifier(PTr_cs,TTreino(:,4));
save('trainedNetC','netC');
netA = classifier(PTr_ag,TTreino(:,5));
save('trainedNetA','netA');

%% Networks' testing
[test_resultsN] = testNet (netN, PTe_es, TTeste(:,1));
[test_resultsE] = testNet (netE, PTe_ext, TTeste(:,2));
[test_resultsO] = testNet (netO, PTe_op, TTeste(:,3));
[test_resultsC] = testNet (netC, PTe_cs, TTeste(:,4));
[test_resultsA] = testNet (netA, PTe_ag, TTeste(:,5));


%% Final Assumptions

[~,nc] = size(test_resultsN);

final_results = zeros(nc,5);

final_results(:,1) = test_resultsN';
final_results(:,2) = test_resultsE';
final_results(:,3) = test_resultsO';
final_results(:,4) = test_resultsC';
final_results(:,5) = test_resultsA';


[final] = transform_results(final_results);
[initial] = transform_results(TTeste);
%% Results
[nl,~] = size(final);
performanceN =0;
performanceE =0;
performanceO =0;
performanceC =0;
performanceA =0;
for i=1:nl
       
    
      performanceN = performanceN + ((abs(final(i,1) - initial(i,1)) / final(i,1)) * 100) ; 
      performanceE = performanceE + ((abs(final(i,2) - initial(i,2)) / final(i,2)) * 100) ; 
      performanceO = performanceO + ((abs(final(i,3) - initial(i,3)) / final(i,3)) * 100) ; 
      performanceC = performanceC + ((abs(final(i,4) - initial(i,4)) / final(i,4)) * 100) ; 
      performanceA = performanceA + ((abs(final(i,5) - initial(i,5)) / final(i,5)) * 100) ; 
    
end

performanceN = performanceN/nl;
performanceE = performanceE/nl;
performanceO = performanceO/nl;
performanceC = performanceC/nl;
performanceA = performanceA/nl;
