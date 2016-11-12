%--------------------------------------------------------------------------
% 16/11/4
% Ho-Kashyap algorithm to classify given data 
% Input: 
%       class1: the data of class 1
%       class2: the data of class 2
%       eta   : the step of iteration
%       b     : margin
% Output:
%       w     : final weight vector
%       cnt   : times of iteration
%--------------------------------------------------------------------------
function [ w,cnt ] = Ho_Kashyap( eta, b,class1, class2 )
    cnt=0;
    if size(class1,1)~=size(class2,1)
        disp('BatchRelaxation输入数据有误，请检查');
        return;
    end
    plotData(class1,class2);
    hold on
    class2 = -class2;  %规范化增广样本

    %w = ones(size(class1,1),1); %初始化权向量w
    w=[1;1;1];
    Y=[class1,class2]';
    bVec=b*ones((size(class1,2)+size(class2,2)),1);
    pinvY=pinv(Y);
    while 1
        e=((Y*w-bVec)+abs(Y*w-bVec));
        sum(e)
        if sum(e)<0.01
            break;
        end
        bVec=bVec+eta*e;
        w=pinvY*bVec;

        cnt=cnt+1;
    
    end
        x=-10:0.1:10;
        y=-(w(2)/w(3))*x-(w(1)/w(3));
        plot(x,y);
        hold on
    

end

