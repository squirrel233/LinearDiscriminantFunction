%--------------------------------------------------------------------------
% 16/10/27
% KNN classifier to classify MNIST database
%--------------------------------------------------------------------------
%ԭʼ�������ݵı������»������������������������շ���������

%% load data
clear;
load('MNIST-train-images.mat');     %train_images
load('MNIST-train-labels.mat');     %train_labels
load('MNIST-test10k-images.mat');   %test_images
load('MNIST-test10k-labels.mat');   %test_labels
tic
%% �򵥽�����֤���Ƚϲ�ͬ��Kֵ���
KTimes=1;
kdTree = vl_kdtreebuild(train_images);  %����KDtree
testSize=10000;
 
for K=1:2:7
     cnt=0;   %��ȷ�ʵļ�����
     
%     %% KNN (normal)
%     for i=1:testSize
%         for j=1:60000
%             dist(j)=norm(test_images(:,i)-train_images(:,j));
%         end
%         if K==1
%             labels(i)=train_labels(find(dist==min(dist)));
%         else
%             for k=1:K
%                 labels_mat(i,k)=train_labels(find(dist==min(dist)));
%                 dist(find(dist==min(dist)))=1.7977e+308;
%             end
%             labels=mode(labels_mat');   %ȡ����
%         end
%     end

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
    acc(KTimes)=cnt/testSize;
 
%% ����ʾ
disp('K=');disp(K);
disp(cnt/testSize);
KTimes=KTimes+1;
cnt=0;
end
plot(acc);
toc