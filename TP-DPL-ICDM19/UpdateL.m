function [ L_Mat ] = UpdateL( S_Mat, W_Mat, Data, DataInvMat, alpha, beta,gamma)
%% Update L
% input:
% S_Mat :  coding coefficients
% W_Mat :  adaptive weighting matrix
% Data: The original data array, each classify is an array matrix
% DataInvMat :  (~X_i)*(~X_i)^T
% alpha :  parameter
% beta :  parameter
% gamma :  parameter

%------------------------------------------------
% output:
% % L_Mat :  analysis dictionary
%============================================================
%% cumpater

ClassNum = size(S_Mat,2);
% cupter He
n = size(Data{1},2);
N = ClassNum*n;
He = eye(n)-ones(n) / N;
L_Mat = cell(1,ClassNum);
for i=1:ClassNum
    Temp_W = W_Mat{i};
    Temp_S = S_Mat{i};
    Temp_Data = Data{i};
    % (~X_l)*(~X_l)^T
    Temp_Da_i = DataInvMat{i};
    %======================================================

    Temp_A = alpha*Temp_Da_i+beta*Temp_Data*Temp_Data'-...
        beta*Temp_Data*Temp_W'*Temp_Data'-beta*Temp_Data*Temp_W*Temp_Data'+...
        beta*Temp_Data*(Temp_W*Temp_W')*Temp_Data'+gamma*Temp_Data*(He*He')*Temp_Data';
    Temp_A = Temp_A + 1e-4*eye(size(Temp_A));
    Temp_B = gamma*(Temp_S*(He*He')*Temp_Data');
    % ===============================================
    L_Mat{i} = Temp_B/Temp_A;
end

