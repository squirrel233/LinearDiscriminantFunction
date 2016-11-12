%--------------------------------------------------------------------------
% 16/10/27
% Demonstration of KNN classifier 
%--------------------------------------------------------------------------
%% 安装vlfeat工具箱
run('G:\vlfeat-0.9.20-bin\vlfeat-0.9.20\toolbox\vl_setup')
%vl_version verbose

%% load data
clear;
load('MNIST-train-images.mat');     %train_images
load('MNIST-train-labels.mat');     %train_labels
load('MNIST-test10k-images.mat');   %test_images
load('MNIST-test10k-labels.mat');   %test_labels

TESTSIZE=10000;
K=input('请输入K：');

%% 使用KNN
acc=KNN(K,train_images,train_labels,test_images,test_labels,TESTSIZE);

%% 使用KNN with KD-Tree
acc1=KNN(K,train_images,train_labels,test_images,test_labels,TESTSIZE);

%% 简单输出
disp(acc);
disp(acc1);