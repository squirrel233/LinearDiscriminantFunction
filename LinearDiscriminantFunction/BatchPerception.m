%--------------------------------------------------------------------------
% 16/11/4
% Batch Perception to classify given data (ʹ�������б�׼��)
% Input: 
%       class1: the data of class 1
%       class2: the data of class 2
%       eta   : the step of iteration
% Output:
%       w     : final weight vector
%       cnt   : times of iteration
%--------------------------------------------------------------------------

function [ w,cnt ] = BatchPerception( eta,class1,class2 )
    if size(class1,1)~=size(class2,1)
        disp('BatchPerception����������������');
        return;
    end
    plotData(class1,class2);
    class2 = -class2;  %�淶����������
    w = zeros(size(class1,1),1); %��ʼ��Ȩ����w
    cnt = 0;
    while (1)
      update=zeros(size(class1,1),1);
      for i=1:size(class1,2)
        if w'*class1(:,i)<=0
            update = update + eta*class1(:,i);
        end
      end
      for i=1:size(class2,2)
        if w'*class2(:,i)<=0
            update = update + eta*class2(:,i);
        end
      end
      w = w+update;       %����w
      cnt = cnt+1;
      if abs(sum(update))<=eps   %�����д��/����
          break;
      end
       x=-10:0.1:10;
       y=-(w(2)/w(3))*x-(w(1)/w(3));
       plot(x,y);
       hold on;
    end
    x=-10:0.1:10;
    y=-(w(2)/w(3))*x-(w(1)/w(3));
    plot(x,y);

end

