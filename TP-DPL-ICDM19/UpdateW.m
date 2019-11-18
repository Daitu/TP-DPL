function [ W_Mat ] = UpdateW( Data, P_Mat, L_Mat)
%% Update W , This function updata  adaptive weighting matrix
% input:
% Data: The original data array, each classify is an array matrix
% P_Mat :  projection matrix% tau : Prevent matrix singular 
% L_Mat :  analysis dictionary

%------------------------------------------------
% output:
% W_Mat :  adaptive weighting matrix
%============================================================
%% class number
ClassNum = size(Data,2);
W_Mat = cell(1,ClassNum);
for i=1:ClassNum
    %TempD       = Dict{i};
    TempData       = Data{i};
    Temp_P = P_Mat{i};
    Temp_L = L_Mat{i};
    % cumputer W
    Temp_A = TempData'*(Temp_P'*Temp_P)*TempData+TempData'*(Temp_L'*Temp_L)*TempData;
    Temp_A = Temp_A +eye(size(Temp_A)) + eye(size(Temp_A))*1e-4;
    Temp_B = TempData'*(Temp_P'*Temp_P)*TempData+TempData'*(Temp_L'*Temp_L)*TempData;
    Temp_W = Temp_A\Temp_B;
    W_Mat{i} = Temp_W;
end

