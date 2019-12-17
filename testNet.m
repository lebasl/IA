function [test_results] = testNet (net, PTeste)
       
test_results = sim(net,PTeste');

end