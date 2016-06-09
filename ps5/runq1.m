%Ruogu Liu 
%625495
%5/30
%CS171
%PS5
function [Y,dt] = runq1()

bank = load('banktrain.data','-ascii');
bank2 = load('banktestX.data','-ascii');

ftypes = [0 12 4 8 3 3 3 2 0 0 0 0 0 3 0 0 0 0 0];
[~, ed] = size(bank);
X = bank(:,1:ed-1);
Y = bank(:,ed);

dt = learndt(X,Y,ftypes,@giniscore);
% drawdt(dt);
dt = prunedt(dt,X,Y);
Y = predictdt(dt,bank2);

end