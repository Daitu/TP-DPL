%% =========================================================================
% papper:Learning Structured Twin-Incoherent Twin-Projective Latent Dictionary Pairs for Classification
% ICDM 2019
% Daitu
% test program
%% =========================================================================
clear;
close all; 
clc;
%% Load training and testing data
DataPath   = 'data/YaleB_jiang_rf504';
load(DataPath);
% Column normalization
A = normcol_equal(A);
[TrData,TtData,TrLabel,TtLabel]=ExtractData(A,32,labels,1234);
%Parameter setting  0.0005      500       0.5
DictSize = 15;
alpha = 0.0005;
beta  = 500;
gamma = 0.5;
Iter = 20;
%% DPL trainig
tic
[ S_Mat,P_Mat,L_Mat,W_Mat,D_Mat,Ofv] = TrainRADPL( TrData, TrLabel,DictSize, alpha, beta,gamma, Iter );
TrTime = toc
%% DPL testing
tic
[Error,PredictLabel] = ClassificationRADPL( TtData , D_Mat,L_Mat,P_Mat);
Error;
TtTime = toc
% Show accuracy and time
Acc = sum(TtLabel==PredictLabel)/size(TtLabel,2);
disp(['×î´óÖµAcc£º',num2str(Acc)])

%% confusion matrix
confmat = confusionmat(TtLabel,PredictLabel);
% heatmap
h = heatmap(confmat);
h.Title = 'Dictionart Learning';
h.XLabel = 'Test Label';
h.YLabel = 'Predict Label';
h.ColorScaling = 'scaledcolumns';


%% plot aofv

plot(1:Iter,Ofv)
