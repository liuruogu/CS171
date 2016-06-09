%Ruogu Liu 
%625495
%5/30
%CS171
%PS5

function [gini] = giniscore(ginimat)
    gini = 1 - (norm(ginimat))^2;
end