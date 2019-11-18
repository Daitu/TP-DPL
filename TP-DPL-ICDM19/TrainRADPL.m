function [ S_Mat,P_Mat,L_Mat,W_Mat,D_Mat,Ofv ] = TrainRADPL( Data, Label,...
    DictSize, alpha, beta,gamma, Iter )
%% This is the RADPL training function
% Robust projective Dictionary pair learning by discriminative adapive 
% representations training code
% Input arguments:
%  Data : Train Data,every class is one of cell;Data{i} class i train data
%  Label : Train Label;example:[1,1,1,1,........,i,i,i,......,k,k]
%  DictSize : Dictionary size,The number of atoms per sub Dictionaries
%  alpha :  parameter
%  beta :  parameter
%  gamma: parameter
%  Iter : max Iter times

% output:
% S_Mat :  coding coefficients
% D_Mat : Dictionary D
% P_Mat :  projection matrix
% L_Mat :  analysis dictionary
% W_Mat : Adaptive Representations W
% Ofv : object functional value

%%
% Initilize D and P , precompute the update W for one time 
[ DataMat, DictMat, P_Mat,L_Mat,W_Mat,S_Mat,DataInvMat] = Initilization( Data , Label, DictSize);
% Alternatively update S,D,P,L,W
Ofv = 1:Iter;
for i=1:Iter
    [ S_Mat ] = UpdateS( DictMat, P_Mat, L_Mat,DataMat,gamma);
    [ D_Mat] = UpdateD( S_Mat, P_Mat, DataMat);
    [ P_Mat ] = UpdateP(DictMat, S_Mat, W_Mat, DataMat, DataInvMat, alpha, beta);
    [ L_Mat ] = UpdateL( S_Mat, W_Mat, DataMat, DataInvMat, alpha, beta,gamma);
    [ W_Mat ] = UpdateW( DataMat, P_Mat, L_Mat);
    [Ofv(i)] = objectfunvalue2(Data , Label,DictMat,S_Mat,P_Mat,L_Mat,W_Mat,alpha,beta,gamma);
end




    
