%--------------------------------------------------------------------------
% 16/11/4
% Single Sample Relaxation with Margin to classify given data (ʹ���ɳ��б�׼��)
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
        disp('Single Sample Relaxation����������������');
        return;
    end
    class2 = -class2;  %�淶����������
    w = zeros(size(class1,1),1); %��ʼ��Ȩ����w
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
            w = w-update;       %����w
        end
      end
      for i=1:size(class2,2)
        if w'*class2(:,i)<=b
            update =  eta*( (w'*class2(:,i)-b)/((norm(class2(:,i)))^2) )*class2(:,i);
            updateSum = updateSum+update;
            criterionFunc=criterionFunc+0.5*((w'*class2(:,i)-b)^2)/((norm(class2(:,i)))^2);
            w = w-update;       %����w
        end
      end
      cnt = cnt+1;
     
      plot(cnt,criterionFunc,'.');hold on %����׼����ֵ(y��)�͵�������(x��)�ĺ���ͼ
      if abs(sum(updateSum))<=eps %��Ϊ�����д��/����
          break;
      end
    end
end


