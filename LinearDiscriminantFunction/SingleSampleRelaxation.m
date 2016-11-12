%--------------------------------------------------------------------------
% 16/11/4
% Single Sample Relaxation with Margin to classify given data (使用松弛判别准则)
% Input: 
%       class1: the data of class 1
%       class2: the data of class 2
%       eta   : the step of iteration
%       b     :
% Output:
%       w     : final weight vector
%       cnt   : times of iteration
%--------------------------------------------------------------------------

function [ w,cnt ] = SingleSRelaxation( eta,b,class1,class2 )

    if size(class1,1)~=size(class2,1)
        disp('Single Sample Relaxation输入数据有误，请检查');
        return;
    end
    class2 = -class2;  %规范化增广样本
    w = zeros(size(class1,1),1); %初始化权向量w
    w(1)=1;
    cnt = 0;
    while (1)
      update=zeros(size(class1,1),1);
      updateSum=update;
      criterionFunc=0;
      for i=1:size(class1,2)
        if w'*class1(:,i)<=b
            update = eta*((w'*class1(:,i)-b)/((norm(class1(:,i)))^2))*class1(:,i);
            updateSum = updateSum+update;
            criterionFunc=criterionFunc+0.5*((w'*class2(:,i)-b)^2)/((norm(class2(:,i)))^2);
            w = w-update;       %更新w
        end
      end
      for i=1:size(class2,2)
        if w'*class2(:,i)<=b
            update =  eta*( (w'*class2(:,i)-b)/((norm(class2(:,i)))^2) )*class2(:,i);
            updateSum = updateSum+update;
            criterionFunc=criterionFunc+0.5*((w'*class2(:,i)-b)^2)/((norm(class2(:,i)))^2);
            w = w-update;       %更新w
        end
      end
      cnt = cnt+1;
     
      plot(cnt,criterionFunc,'.');hold on %画出准则函数值(y轴)和迭代次数(x轴)的函数图
      if abs(sum(updateSum))<=eps %认为不再有错分/更新
          break;
      end
    end
end


