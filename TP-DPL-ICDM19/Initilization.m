function [ DataMat, DictMat, P_Mat,L_Mat,W_Mat,S_Mat,DataInvMat] = ...
    Initilization( Data , Label, DictSize)
%% In this intilization function
%-------------------------------------------------------------------------
% input:
% Data:The original data set,Each column as a sample
% Label: The original data set label,Each column as a label
% DictSize: each class Dictionary(D) autom number 

%======================================================================
% output:
% DataMat: The original data array, each classify is an array matrix
% DictMat: Dictionary array D, each classify is an array matrix
% P_Mat:  projection matrix P, each classify is an array matrix
% L_Mat:  analysis dictionary L, each classify is an array matrix
% W_Mat:  Adaptive Representations W, each classify is an array matrix
% S_Mat:  coding coefficients S, each classify is an array matrix
% DataInvMat :  (~X_i)*(~X_i)^T

%% program
ClassNum = length(unique(Label)); % class number
Dim      = size(Data,1);  % feature number
%% matrix to cell
DataMat = cell(1,ClassNum);
DictMat = cell(1,ClassNum);
P_Mat = cell(1,ClassNum);
L_Mat = cell(1,ClassNum);
DataInvMat = cell(1,ClassNum);
W_Mat = cell(1,ClassNum);
S_Mat = cell(1,ClassNum);
% initolization D and P,updata W
for i=1:ClassNum
    TempData      = Data(:,Label==i);  % classify i Data
    DataMat{i}    = TempData;   % cell i element
    rng(i,'twister');      % randm seed                  
    % initolization Dictionary D_i
    DictMat{i}   = TempData(:,randperm(size(TempData,2),DictSize)); 
%     DictMat{i}    = DictMati+normcol_equal(rand(size(DictMati))); 
    rng(2*i,'twister');
    % initolization  Dictionary P_i
    P_Mat{i}      = normcol_equal(randn(Dim));
    rng(3*i,'twister');
    % initolization  Dictionary S_i
    L_Mat{i}      = normcol_equal(randn(DictSize,Dim));
    % Calculate the not class i  data
    TempDataC     = Data(:,Label~=i); % not i classifi Data
    % (~X_l)*(~X_l)^T
    DataInvMat{i} = TempDataC * (TempDataC');
    % initolization W_i
    temp_W = squareform(1-pdist(DataMat{i}','cosine')) + eye(size(DataMat{i},2));
    W_Mat{i} = temp_W;
    % initolization   S_i
    S_Mat{i}      = L_Mat{i}*TempData;
end

