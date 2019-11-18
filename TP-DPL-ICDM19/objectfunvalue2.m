function [ofv] = objectfunvalue2(TrData, TrLabel,DictMat,S_Mat,P_Mat,L_Mat,W_Mat,alpha,beta,gamma)
%% object function value
ClassNum = length(unique(TrLabel));
% cupter He
n = size(S_Mat{1},2);
N = ClassNum*n;
He = eye(n)-ones(n) / N;
ofv = 1:ClassNum;
for i=1:ClassNum
    % first term 
    TempData      = TrData(:,TrLabel==i);  % classify i Data
    temp_one = TempData*He - DictMat{i}*S_Mat{i}*He-P_Mat{i}*TempData*He;
    one = trace(temp_one'*temp_one);
    % second term
    % Calculate the not class i  data
    TempDataC     = TrData(:,TrLabel~=i); % not i classifi Data
    Temp_two1 = L_Mat{i}*TempDataC;
    Temp_two2 = P_Mat{i}*TempDataC;
    two = alpha*(trace(Temp_two1'*Temp_two1)+trace(Temp_two2'*Temp_two2));
    % third term
    Temp_W = W_Mat{i};
    three = beta*(norm((P_Mat{i}*TempData-P_Mat{i}*TempData*Temp_W),'fro')^2+...
        norm((L_Mat{i}*TempData-L_Mat{i}*TempData*Temp_W),'fro')^2+...
        norm(Temp_W,'fro')^2);
     % fourth term
    four = gamma*(norm((L_Mat{i}*TempData*He-S_Mat{i}*He ),'fro'))^2;
    
    ofv(i) = one+two+three+four;
end
ofv = mean(ofv);
