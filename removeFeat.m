function [P_ag, P_cs, P_es, P_ext, P_op] = removeFeat(P, ffAg, ffcs, ffES, ffExt, ffop, j, k, l, m, n)
% find names of unwanted features
vnAg = cellstr(ffAg(1,1:n - 1));
vnCs = cellstr(ffcs(1,1:m - 1));
vnEs = cellstr(ffES(1,1:j - 1));
vnExt = cellstr(ffExt(1,1:k - 1));
vnOp = cellstr(ffop(1,1:l - 1));

% remove unwanted features
P_ag = removevars(P,vnAg);
P_cs = removevars(P,vnCs);
P_es = removevars(P,vnEs);
P_ext = removevars(P,vnExt);
P_op = removevars(P,vnOp);

% convert table to matrix
P_ag = table2array(P_ag);
P_cs = table2array(P_cs);
P_es = table2array(P_es);
P_ext = table2array(P_ext);
P_op = table2array(P_op);
end
