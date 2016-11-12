%--------------------------------------------------------------------------
% 16/11/4
% Ho-Kashyap algorithm demostration
%--------------------------------------------------------------------------

x_data=loadData();
w1=x_data(:,1:10);w2=x_data(:,11:20);w3=x_data(:,21:30);w4=x_data(:,31:40);

[w,cnt]= Ho_Kashyap(0.2,1,w1,w3);  % warning£∫≤Ω≥§…Ë÷√
disp(w');disp(cnt);

% plotData(w1,w3);
% hold on
% x=-10:0.1:10;
% y=-(w(2)/w(3))*x-(w(1)/w(3));
% plot(x,y);