%--------------------------------------------------------------------------
% 16/11/4
% Plot Data (2 classes only)
% Input: 
%       class1: the data of class 1
%       class2: the data of class 2
%--------------------------------------------------------------------------

function  plotData( class1,class2 )
%PLOTDATA Summary of this function goes here
%   Detailed explanation goes here
plot(class1(2,1:10),class1(3,1:10),'o');
hold on;
plot(class2(2,1:10),class2(3,1:10),'.');

end

