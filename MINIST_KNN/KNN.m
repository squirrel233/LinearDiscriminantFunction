%--------------------------------------------------------------------------
% 16/10/27
% KNN classifier to classify MNIST database
%--------------------------------------------------------------------------
%ԭʼ�������ݵı������»������������������������շ���������
function [acc]=KNN(K,train_images,train_labels,test_images,test_labels,testSize)
    if mod(K,2)==0
        disp('�����Kֵ����');
        return;
    end
    cnt=0;   %��ȷ�ʵļ�����
    %% KNN 
    for i=1:testSize
        for j=1:60000
            dist(j)=norm(test_images(:,i)-train_images(:,j));
        end
        if K==1
            labels(i)=train_labels(find(dist==min(dist)));
        else
            for k=1:K
                labels_mat(i,k)=train_labels(find(dist==min(dist)));
                dist(find(dist==min(dist)))=1.7977e+308;
            end
            labels=mode(labels_mat');   %ȡ����
        end
    end

    %% ͳ�Ʋ�����ȷ��
    for i=1:testSize
        if labels(i)==test_labels(i)
            cnt=cnt+1;
        end
    end
    acc=cnt/testSize;
 
    %% ����ʾ
    disp('K=');disp(K);
    disp(acc);
end