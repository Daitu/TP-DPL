function [ S_Mat,P_Mat,L_Mat,W_Mat,D_Mat] = TrainRADPL3( Data, Label,...
    DictSize, alpha, beta,gamma, Iter )
%% This is the RADPL training function
% Robust projective Dictionary pair learning by discriminative adapive 
% representations training code
% Input arguments:
%  Data : Train Data,every class is one of cell;Data{i} class i train data
%  Label : Train Label;example:[1,1,1,1,........,i,i,i,......,k,k]
%  DictSize : Dictionary size,The number of atoms per sub Dictionaries
%  alpha : Robust projective parameter
%  beta : discriminative adaptive representation parameter
%  Iter : max Iter times
%  tau : a small number,avoid the singularity issue
% output:
% Dict_D : Dictionary D
% Dict_P : Dictionary P
% W_Mat : class reconfiguration matrix W
% EncoderDP : D*P
% Iter : iter times
%%
% Initilize D and P , precompute the update W for one time 
% [ DataMat, DictMat, P_Mat, DataInvMat, W_Mat,S_Mat ] = Initilization( Data , Label, DictSize, tau);
[ DataMat, DictMat, P_Mat,L_Mat,W_Mat,S_Mat,DataInvMat] = Initilization( Data , Label, DictSize);
% Alternatively update P, D and A

for i=1:Iter
    [ S_Mat ] = UpdateS( DictMat, P_Mat, L_Mat,DataMat,gamma);
    [ D_Mat] = UpdateD( S_Mat, P_Mat, DataMat);
    [ P_Mat ] = UpdateP(DictMat, S_Mat, W_Mat, DataMat, DataInvMat, alpha, beta);
    [ L_Mat ] = UpdateL( S_Mat, W_Mat, DataMat, DataInvMat, alpha, beta,gamma);
    [ W_Mat ] = UpdateW( DataMat, P_Mat, L_Mat);
end




    
