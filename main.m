% read data
data = readmatrix('dataSetAI_2019.xltx');

% determine Features matrix and Target matrix
T = data(:,7:11);
P = data(:,3:5);
P2 = data(:,12:end);
P = cat(2,P,P2);

