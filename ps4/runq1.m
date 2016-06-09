%Ruogu Liu 
%625495
%5/16
%CS171
%PS4
function [label] = runq1 
%Load the trainning data from the data sets
spamdataX = load('spamtrainX.data');
spamdataY = load('spamtrainY.data');
div = floor(size(spamdataX,1)*0.75);
Tx = spamdataX(1:div,:);
Ty = spamdataY(1:div,:);

%The last 25% of the training data as validation.
Vx = spamdataX(div+1:end,:);
Vx = [Vx ones(size(Vx, 1), 1)];
Vy = spamdataY(div+1:end,:);

%Process the spam data
spamdata = load ('spamtestX.data');
spamdata = [ones(size(spamdata, 1), 1) spamdata];

%Find the suitable C
C = logspace(-2,3,5);

errmin = inf

%Iterate all of C
for c = C
    [w,b] = learnsvm(Tx, Ty, c);
    % Add a value into the end of w
     w(end+1) = b;
     Val = Vx*w ;
     for i = 1:750
        if Val(i)<0
            Val(i) = -1;
        elseif Val(i)>0
            Val(i) = 1;
        end
     end
     err = sum(Val~=Vy);
     if err < errmin
         errmin = err;
         wbest = w;
     end
%End of finding the best w and b 
end 

%Classify the spam data, label[] store those who are 1
label = [];

classifier = spamdata*wbest;
%use the classifer to predict the spam email which will be  labeled as 1
for i = 1:size(classifier,1)
        if classifier(i)<0
            classifier(i) = -1;
        elseif classifier(i)>0
            classifier(i) = 1;
            label(end+1) = i;
        end
end      
end