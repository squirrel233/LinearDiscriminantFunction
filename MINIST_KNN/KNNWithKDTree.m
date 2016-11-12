%--------------------------------------------------------------------------
% 16/10/27
% KNN classifier(with KD-Tree) to classify MNIST database
%--------------------------------------------------------------------------
%原始给定数据的变量用下划线命名法，其他变量均用驼峰命名法。

function [acc]=KNNWithKDTree(K,train_images,train_labels,test_images,test_labels,testSize)
if mod(K,2)==0
    disp('输入的K值有误。');
    return;
end
cnt=0;   %正确率的计数器  

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
    %% 统计测试正确率
for i=1:testSize
    if labels(i)==test_labels(i)
        cnt=cnt+1;
    end
end
acc=cnt/testSize;
 
%% 简单显示
disp('K=');disp(K);
disp(cnt/testSize);
end
