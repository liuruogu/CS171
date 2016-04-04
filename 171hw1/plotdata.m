%Ruogu Liu
%ID 625495
%04/04 2016
%CS171
%PS1
function plotdata(file, a1, a2 )
    loadData = dlmread(file);
    hold on
    for k = 1:150
        %disp(k)
        if loadData(k,5)==0        
            plot(loadData(k,a1), loadData(k,a2), 'ro')
        end
        if loadData(k,5)==1     
            plot(loadData(k,a1), loadData(k,a2), 'bx')
        end
        if loadData(k,5)==2        
            plot(loadData(k,a1), loadData(k,a2), 'gs')
        end
    end 
    xlabel(['Attribute',num2str(a1)])
    ylabel(['Attribute',num2str(a2)]) 
end
