function [result, sens_N,espec_N,sens_O,espec_O,sens_A,espec_A,sens_C,espec_C,sens_E,espec_E] = testNet (net, PTeste, TTeste)
       
test_results = sim(net,PTeste);
        
[~,target] = max(TTeste);
[~,result] = max(test_results);

%confusion matrix
conf_matrix = confusionmat(target,result);
        
TP=zeros(1,5);
FN=zeros(1,5);
FP=zeros(1,5);
TN=zeros(1,5);
        
%Cada Célula da Conf Matrix Representa um tipo:
%Célula 1:1 TP
%Célula 2:1 FN
%Célula 1:2 FP
%Célula 2:2 TN
for i=1:5
    TP(i)=conf_matrix(i,i);
    FN(i)=sum(conf_matrix(i,:))-conf_matrix(i,i);
    FP(i)=sum(conf_matrix(:,i))-conf_matrix(i,i);
    TN(i)=sum(conf_matrix(:))-TP(i)-FP(i)-FN(i);
end

%Atribuir os resultados finais da grelha da Confusion matrix,
%indice 1 para Emotional Stability (N)
%indice 2 para Extraversion
%indice 3 para Openness
%indice 4 para Conscientiousness
%indice 5 para Agreeableness

sens_N = TP(1)/(TP(1)+FN(1))*100;
espec_N = TN(1)/(TN(1)+FP(1))*100;

sens_E = TP(2)/(TP(2)+FN(2))*100;
espec_E = TN(2)/(TN(2)+FP(2))*100;   

sens_O = TP(3)/(TP(3)+FN(3))*100;
espec_O = TN(3)/(TN(3)+FP(3))*100; 

sens_C = TP(4)/(TP(4)+FN(4))*100;
espec_C = TN(4)/(TN(4)+FP(4))*100;   

sens_A = TP(5)/(TP(5)+FN(5))*100;
espec_A = TN(5)/(TN(5)+FP(5))*100;   
end