function [ D_Mat] = UpdateD( S_Mat, P_Mat, Data )
%% Update Dictionary D
% input:
% S_Mat :  coding coefficients
% Data: The original data array, each classify is an array matrix
% P_Mat :  projection matrix

%------------------------------------------------
% output:
% D_Mat : Dictionary D

%============================================================

%%
[ ClassNum] = size(Data,2);
 D_Mat = cell(1,ClassNum);
% cupter He
n = size(Data{1},2);
N = ClassNum*n;
He = eye(n)-ones(n) / N;
for i=1:ClassNum
    Temp_S       = S_Mat{i};
    TempData       = Data{i};
    Temp_P = P_Mat{i};
    % update D
    Temp_A = TempData*(He*He')*Temp_S'-Temp_P*TempData*(He*He')*Temp_S';
    Temp_B = Temp_S*(He*He')*Temp_S';
    Temp_B = Temp_B + 1e-4*eye(size(Temp_B));
%     D_Mat{i} = Temp_A*inv(Temp_B);   
    D_Mat{i} = Temp_A/Temp_B;  
end




