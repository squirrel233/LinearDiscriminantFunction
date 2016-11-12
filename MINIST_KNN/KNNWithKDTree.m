%--------------------------------------------------------------------------
% 16/10/27
% KNN classifier(with KD-Tree) to classify MNIST database
%--------------------------------------------------------------------------
%ԭʼ�������ݵı������»������������������������շ���������

function [acc]=KNNWithKDTree(K,train_images,train_labels,test_images,test_labels,testSize)
if mod(K,2)==0
    disp('�����Kֵ����');
    return;
end
cnt=0;   %��ȷ�ʵļ�����  

%% KNN(with KD-tree)
for i=1:testSize
    [index, distance] = vl_kdtreequery(kdTree, train_images, test_images(:,i),'NumNeighbors', K) ;
    if K==1
        labels(i)=train_labels(index);
    else
        labelsK=train_labels(index);
        labels(i)=mode(labelsK);
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
disp(cnt/testSize);
end
