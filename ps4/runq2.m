%Ruogu Liu 
%625495
%5/16
%CS171
%PS4
function runq2

toy = load('toy.data','-ascii');
X = toy(:,1:end-1);
Y = toy(:,end);

fnum = 1;
for nhidden = [1 5 15]
	for lambda = [0.005 0.05 0.5] %[0.005 0.05 0.5]
		subplot(3,3,fnum);
        [w1,w2] = trainneuralnet(X,Y,nhidden,lambda);
        gridX = getgridpts(X,20);
%         gridY = getgridptsY(gridX,w1,w2);
         gridXT = [ones(size(gridX,1),1) gridX];
         Ha = gridXT * w1;
         Hz = 1./(1+exp(-Ha));
         Hz = [ones(size(Hz,1),1) Hz];
         Ya = Hz*w2;
         Yz = 1./(1+exp(-Ya));
         gridY = Yz;
        plotdecision(X,Y,gridX,gridY);
		title(['nhidden = ' num2str(nhidden) ', lambda = ', num2str(lambda)]);
		hold off;
		fnum = fnum+1;
	end;
end;
set(gcf,'paperorientation','landscape');
set(gcf,'paperposition',[0.25 0.25 10.25 8.25]);
saveas(gcf,'q2out.pdf');
