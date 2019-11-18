function [ S_Mat ] = UpdateS( D_Mat, P_Mat, L_Mat, Data,gamma)
%% Update S
% input:
% D_Mat: Dictionary D
% Data: The original data array, each classify is an array matrix
% P_Mat :  projection matrix
% L_Mat :  analysis dictionary
% gamma :  parameter


%------------------------------------------------
% output:
% S_Mat :  coding coefficients
%============================================================
%% cumpater
ClassNum = size(Data,2);
S_Mat = cell(1,ClassNum);
% cupter He
n = size(Data{1},2);
N = ClassNum*n;
He = eye(n)-ones(n) / N;
% ===
for i=1:ClassNum
    Temp_P = P_Mat{i};
    Temp_D = D_Mat{i};
    Temp_L = L_Mat{i};
    Temp_Data = Data{i};
    Heinv = (He*He')^-1;
    %======================================================
    DTD = Temp_D'*Temp_D;
    Temp_S = (DTD+gamma*eye(size(DTD)))\(Temp_D'*Temp_Data*He*He'-Temp_D'*Temp_P*Temp_Data*He*He'+...
        gamma*Temp_L*Temp_Data*He*He');
    Temp_S = Temp_S*Heinv;
    S_Mat{i} = Temp_S;
    % ===============================================
end

