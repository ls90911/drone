function [ y ] = motion_model( beta,x )
%MOTION_MODEL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

y = x(1) * sin(x(2)_beta(1))+(beta(2)*x(3)+beta(3)*x(3)^2);

end

