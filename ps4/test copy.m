toy = load('toy.data','-ascii');
X = toy(:,1:end-1);
X = [ones(size(x,1),1) X];
Y = toy(:,end);

[m,n] = size(X);
nhid = 5;
lambda = 0.005;

w1 = rand(nhid-1,n);
w2 = rand(1,nhid);
a = zeros(nhid,1);
w = zeros(nhid,1);

maxgra = inf;
iteration = 1;
while maxgra < 0.001
    yt = 1000/(25000+iteration);
    
    for i = 1:m
        %Forward propagation
        a = w1*X(i,:)';
        z = 1./(1+exp(-a));
        z = [1;z];
        f2 = 1/(1+exp(-w2*z));
        %Backward propagation
        dt2 = f2 - Y(i);
        temp = w2'*dt2;
        temp(1) = [];
        dt1  =(exp(-a)./((1+exp(-a)).^2)).*temp;
        %Update
        for j = 2:nhid
            w2 = w2-2*lambda*yt*w2-yt*dt2*z';
        end
        for k = 1:n
            w1 = w1-2*lambda*yt*w1-yt*dt1*X(i,:);
        end
    end
    iteration = iteration + 1;
end

gridX = getgridpts(X);
[pp, qq] = size(gridX);
for i =1:pp
    z(1) = 1;
    a = w1*gridX(i,:)';
    z=1./(1+exp(-a));
    z = [1;z];
    gridY(i)=1/(1+exp(-w2*z));
end

plotdecision(X,Y,gridX,gridY)

