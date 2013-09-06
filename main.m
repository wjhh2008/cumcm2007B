clc,clear
%% ====load====
fin=fopen('1.txt');
line=zeros(1040,90);
stateN=zeros(1040,1);
costtype=zeros(1040,1);

while (1)
    %Line 1
    str=fgets(fin);
    L=str2num(str);
    if L<0 break; end
    %Line 2
    str=fgets(fin);
    costtype(L*2-1)=str2num(str);
    costtype(L*2)=str2num(str);
    %Line 3
    str=fgets(fin);
    l=split(str);
    stateN(2*L-1)=size(l,2);
    line(2*L-1,1:stateN(2*L-1))=l;
    %Line4
    str=fgets(fin);
    if size(str,2)==2
        stateN(2*L)=stateN(2*L-1);
        line(2*L,1:stateN(2*L))=fliplr(l);
    else
        l=split(str);
        stateN(2*L)=size(l,2);
        line(2*L,1:stateN(2*L))=l;
    end
    
end
fclose(fin);
%% prog1
St=inf*ones(4000,8); %[time,money,s1,t1,s2,t2,s3,t3]
St(3359,:)=[0,0,0,0,0,0,0,0];
En=1828;
ans1=[];
for t=1:3
    newS=inf*ones(4000,8);
    for k=1:4000
        if St(k,1)==inf continue; end
        for i=1:1040
            u=find(line(i,:)==k);
            if length(u)==0 continue; end
            for j=u(1)+1:stateN(i)
                newp=St(k,:);
                kk=line(i,j);
                o=j-u(1);
                newp=newp+[5+o*3 costf(costtype(i),o) 0 0 0 0 0 0];
                newp(1+2*t)=k;
                newp(2+2*t)=i;
                if newS(kk,2)==inf  || newS(kk,2)>newp(2) 
                    newS(kk,:)=newp(:);
                end
                
            end
        end
    end
    newS(En,:)
    St=newS;
    
end
    
    
    
    
    
    