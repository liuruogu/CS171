toy = load('toy.data','-ascii');
X = toy(:,1:end-1);
X = [ones(size(X,1),1) X];
Y = toy(:,end);

[m,n] = size(X);
nhid = 5;
lambda = 0.005;

w1 = rand(3,nhid);
w2 = rand(1+nhid,1);
w1 = 2.*w1-1;
w2 = 2.*w2-1;
a = zeros(nhid,1);
w = zeros(nhid,1);

gradient_val1 = 1
gradient_val2 = 1

iteration = 1;
while (max(max(max(abs(gradient_val2))),max(max(abs(gradient_val1))))>0.001)
    yt = 1000/(25000+iteration);
    gradient_val1 = 0
    gradient_val2 = 0
    for i = 1:m
        %Forward propagation
        a = w1*X(i,:);
        z = 1./(1+exp(-a));
        z = [ones(size(z,1),1) z];
        f = 1/(1+exp(-w2*z));
        %Backward propagation
        dt2 = f - Y(i);
        temp = w2'*dt2;
        temp(1) = [];
        dt1  =(exp(-a)./((1+exp(-a)).^2)).*temp;
        %calculate the sum
        sw2 = dt2*z';
        sw1 = repmat(xi',1,nhid).*repmat(dt1,3,1);
        gradient_val1 = gradient_val1+sw1;
        gradient_val2 = gradient_val2+sw2;
        %Update
    end
    gradient_val1 = gradient_val1+2.*lambda.*w1;
    gradient_val2 = gradient_val2+2.*lambda.*w2;
    w1 = w1-n.*gradient_val1;
    w2 = w2-n.*gradient_val2;
    iteration = iteration + 1;
    if(mod(r,3000)==0)
        max(max(max(abs(gradient_val1))),max(max(abs(gradient_val2))))
        r
        nhidden
        lambda
    end
end