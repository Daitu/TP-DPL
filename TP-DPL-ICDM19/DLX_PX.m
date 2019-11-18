function [PX_Mat,DLX_Mat] = DLX_PX(Data,Label, D_Mat,L_Mat,P_Mat)
%UNTITLED D_l * P_l * Y_L
%   此处显示详细说明
ClassNum = length(P_Mat); % class number
%% matrix to cell
DLX = cell(1,ClassNum);
DataMat = cell(1,ClassNum);
PX = cell(1,ClassNum);
for i=1:ClassNum
    TempData      = Data(:,Label==i);  % classify i Data
    DataMat{i}    = TempData;   % cell i element
    DLX{i} = D_Mat{i}*L_Mat{i}*DataMat{i};
    PX{i} =  P_Mat{i} * TempData ;  
end

DLX_Mat = cell2mat(DLX);
PX_Mat = cell2mat(PX);
end

