%--------------------------------------------------------------------------
% 16/11/4
% Load given data
%--------------------------------------------------------------------------

function [ x_data ] = loadData()
%LOADDATA Summary of this function goes here
%   Detailed explanation goes here
clear;
x_data(:,1)=[0.1 6.8 -3.5 2.0 4.1 3.1 -0.8 0.9 5.0 3.9]';
x_data(:,2)=[1.1 7.1 -4.1 2.7 2.8 5.0 -1.3 1.2 6.4 4.0]';
x_data=[x_data; [ 7.1 4.2;-1.4 -4.3;4.5 0.0;6.3 1.6;4.2	1.9;1.4	-3.2;2.4 -4.0;2.5 -6.1;8.4 3.7;4.1 -2.2]];
x_data=[x_data; [-3.0 -2.9;0.5 8.7;2.9 2.1;-0.1 5.2;-4.0 2.2;-1.3 3.7;-3.4 6.2;-4.1 3.4;-5.1 1.6;1.9 5.1]];
x_data=[x_data; [-2.0 -8.4;-8.9 0.2;-4.2 -7.7;-8.5 -3.2;-6.7 -4.0;-0.5 -9.2;-5.3 -6.7;-8.7 -6.4;-7.1 -9.7;-8.0 -6.3]];
for i=1:40
    x_labels(i)=ceil(i/10);
end
x_data=x_data';x_data=[ones(1,40);x_data];      %��������
end
