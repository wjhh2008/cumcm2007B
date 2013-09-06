function y=costf(type,s)
    if type==1
        y=1;
    elseif type==0
        if s>40
            y=3;
        elseif s>20
            y=2;
        else
            y=1;
        end
    else
        y=3;
    end
end