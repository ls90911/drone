function [ y ] = myfitfun( beta,x )
%MYFITFUN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

y = (beta(1)*x(2)-x(3)/beta(5))/(1+beta(2)*x(1)+beta(3)*x(2)+beta(4)*x(3));

end
