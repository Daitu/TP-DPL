function [mean_nmi,std_nmi,ac,ac_std] = nmiEntry(data, labels, maxIte )
 
    nmi = zeros(maxIte, 1);
    k=numel(unique(labels));
    for i = 1 : maxIte
        predLabel = kmeans(data',k, 'Distance','cosine','EmptyAction', 'drop');
        [~, nmi(i), ~] = compute_nmi(labels, predLabel);
        res = bestMap(labels,predLabel);     
        AC(i) = length(find(labels == res'))/length(labels);
    end
    ac=mean(AC);
    ac_std=std(AC);
    mean_nmi = mean(nmi);
    std_nmi = std(nmi);
  
end