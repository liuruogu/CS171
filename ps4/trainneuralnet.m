%Ruogu Liu 
%625495
%5/16
%CS171
%PS4
function [w1,w2] = trainneuralnet(X,Y,nhid,lambda)

X = [ones(size(X,1),1) X];

gradient_val1 = 1;
gradient_val2 = 1;
[m,n] = size(X);
w1 = rand(3,nhid);
w2 = rand(nhid+1,1);
w1 = 2.*w1-1;
w2 = 2.*w2-1;

w = zeros(nhid,1);

iteration = 1;
while (max(max(max(abs(gradient_val2))),max(max(abs(gradient_val1))))>0.001)
    yt = 1000/(25000+iteration);
    gradient_val1 = 0;
    gradient_val2 = 0;
    for i = 1:m
        %Forward propagation
        a = X(i,:)*w1;
        z = 1./(1+exp(-a));
        z = [ones(size(z,1),1) z];
        f = 1/(1+exp(-z*w2));
        %Backward propagation
        dt2 = f - Y(i,:);
        temp = dt2*w2(2:end,:)';
        dt1  = exp(-a)./((1+exp(-a)).^2).*temp;
        %calculate the sum
        sw2 = dt2.*z';
        sw1 = repmat(X(i,:)',1,nhid).*repmat(dt1,3,1);
        gradient_val1 = gradient_val1+sw1;
        gradient_val2 = gradient_val2+sw2;
        
    end
    gradient_val1 = gradient_val1+2.*lambda.*w1;
    gradient_val2 = gradient_val2+2.*lambda.*w2;
    %Update
    w1 = w1-yt.*gradient_val1;
    w2 = w2-yt.*gradient_val2;
    iteration = iteration + 1;
end