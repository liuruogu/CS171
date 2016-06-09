function gridY = getgridptsY(gridX,W1,W2)
gridX = [ones(size(gridX,1),1) gridX];
Ha = gridX * W1;
Hz = 1./(1+exp(-Ha));
Hz = [ones(size(Hz,1),1) Hz];
Ya = Hz*W2;
Yz = 1./(1+exp(-Ya));
gridY = Yz;
end

