# TP-DPL Accepted by ICDM 2019 as a regular paper
 ICDM19

 Learning Structured Twin-Incoherent Twin-Projective Latent Dictionary Pairs for Classification

 This code is for our paper:

Zhao Zhang, Yulin Sun, et al. Learning Structured Twin-Incoherent Twin-Projective Latent Dictionary Pairs for Classification[C]//2019 IEEE International Conference on Data Mining (IEEE ICDM 2019).


If you have problems with the code, please contact us at daitusun@gmail.com or 20174227005@stu.suda.edu.cn


In this paper, we extend the popular dictionary pair learning (DPL) into the scenario of twin-projective latent flexible DPL under a structured twin-incoherence. Technically, a novel framework called Twin-Projective Latent Flexible DPL (TP-DPL) is proposed, which minimizes the twin-incoherence constrained flexibly-relaxed reconstruction error to avoid the possible over-fitting issue and produce accurate reconstruction. In this setting, our TP-DPL integrates the twin-incoherence based latent flexible DPL and the joint embedding of codes as well as salient features by twin-projection into a unified model in an adaptive neighborhood-preserving manner. As a result, TP-DPL unifies the salient feature extraction, representation and classification. The twin-incoherence constraint on codes and features can explicitly ensure high intra-class compactness and inter-class separation over them. TP-DPL also integrates the adaptive weighting to preserve the local neighborhood of the coefficients and salient features within each class explicitly. For efficiency, TP-DPL uses Frobenius-norm and abandons the costly l0/l1-norm for group sparse representation. Another byproduct is that TP-DPL can directly apply the class-specific twin-projective reconstruction residual to compute the label of data. Extensive results on public databases show that TP-DPL can deliver the state-of-the-art performance.
