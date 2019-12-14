function [final] = transform_results(final_results)

[nc,~] = size(final_results);
final = zeros(nc,5);
old_max = 3;
old_min = -3;
new_min = 0;
new_max = 100;


        for j=1:5    
            for i=1:nc
               
                  old_value = final_results(i,j) ;
                  final(i,j) = ( (old_value - old_min) / (old_max - old_min) ) * (new_max - new_min) + new_min ;

            end
                
        end


end