function [Matout] = L21Parameter(Mat,tau)
%% L21Parameter �ú�����������L21��������Ӳ���
%   input
% cellMat:����Ϊһ������
% tau: һ����С�Ĳ���
% output :
% Matout : cellMatout_ii =1/(2*||cellMat^i||+tao) ,Ϊ�ԽǾ���
%% 
num = size(Mat,1);
Matout = Mat;
M  = 1:num;
for k  = 1:num
    M(k) = 1 / (norm(Matout(k,:))*2 + tau);
end
Matout = diag(M);
end

