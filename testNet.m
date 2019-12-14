function [test_results] = testNet (net, PTeste,TTeste)
       
test_results = sim(net,PTeste');
%         
% [~,target] = max(TTeste);
% [~,result] = max(test_results);
% 
% % confusion matrix
% conf_matrix = confusionmat(target,result);
% TP = conf_matrix(1,1);
% FN = sum(conf_matrix(1,:))-conf_matrix(1,1);
% FP = sum(conf_matrix(:,1))-conf_matrix(1,1);
% TN = sum(conf_matrix(:))-TP-FP-FN;
% 
% % sensitivity and specificity
% sens = TP/(TP+FN)*100;
% espec = TN/(TN+FP)*100;
end