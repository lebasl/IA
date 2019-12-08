function [P_encoded, T] = encoderNN(P,T,usedFeat,maxEpochs)

%usedFeat is the number of neurons in the smaller middle layer - hiddenSize
autoenc = trainAutoencoder(P,usedFeat,'MaxEpochs',maxEpochs);

P_encoded = encode(autoenc, P);
P_decode = decode(autoenc,P_encoded);

%compare input and encoded result
figure('Name','Original data')
for i = 1:137
    subplot(137,5,i);
    imshow(P(i));
end
figure('Name','Encoded data')
for i = 1:137
    subplot(137,5,i);
    imshow(P_decode(i))
end

save('encoder','autoenc')
end