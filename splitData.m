function [PTr_ag, PTr_cs, PTr_es, PTr_ext, PTr_op, PTe_ag, PTe_cs, PTe_es, PTe_ext, PTe_op] = splitData(P_ag, P_cs, P_es, P_ext, P_op) 

% balance data
P_ag = normalize(P_ag,'range');
P_cs = normalize(P_cs,'range');
P_es = normalize(P_es,'range');
P_ext = normalize(P_ext,'range');
P_op = normalize(P_op,'range');

% split data
PTr_ag = P_ag(1:floor(137*0.9),:);
PTe_ag = P_ag(floor(137*0.9)+1:end,:);
PTr_cs = P_cs(1:floor(137*0.9),:);
PTe_cs = P_cs(floor(137*0.9)+1:end,:);
PTr_es = P_es(1:floor(137*0.9),:);
PTe_es = P_es(floor(137*0.9)+1:end,:);
PTr_ext = P_ext(1:floor(137*0.9),:);
PTe_ext = P_ext(floor(137*0.9)+1:end,:);
PTr_op = P_op(1:floor(137*0.9),:);
PTe_op = P_op(floor(137*0.9)+1:end,:);
end