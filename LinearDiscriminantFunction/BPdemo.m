%--------------------------------------------------------------------------
% 16/11/4
% Batch perception demostration
% w1,w2分类，收敛步数为24； w2,w3分类，收敛步数为17
% 权重向量w从0开始迭代，所需步数与步长eta无关；步长只改变最后权重向量w的模，不改变分界面方向
%--------------------------------------------------------------------------

x_data=loadData();
w1=x_data(:,1:10);w2=x_data(:,11:20);w3=x_data(:,21:30);w4=x_data(:,31:40);

[w,cnt]= BatchPerception( 1,w1,w2 );
disp(w');disp(cnt);
figure;

%[w_1,cnt_1]= BatchPerception( 1,w2,w3 );
%disp(w_1');disp(cnt_1);