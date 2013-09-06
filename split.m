function y=split(str)
    str=str(1:end-2);
    S = regexp(str, ' ', 'split');
    
    y=[];
    for i=1:size(S,2)
        y(i)=str2num(cell2mat(S(i)));
    end
end