function ELD = Embedded_Laplacian_Discrepancy(lambda1,vector1,lambda2,vector2,n1,n2)


%%%% INPUT : eigenvalues lambda1 and lambda2 of the two graph Laplacian
%%%% matrices
%%%%%        eigenvectors vector1 and vector2 of the graph Laplacian
%%%%%        matrices
%%%%         (??) k hyperparameter that defines the number of eigenvalues (vertices)
%%%          to be compared  k << min(n1,n2), where n1, n22 refer to the
%%%          number of nodes of the comparable matrices

%%% OUTPUT : ELD per k hyperparameter - you should get its mean


nodes = size(vector1,1);
min_k = min(n1,n2);
ELD = 0;

wsd = zeros(1,min_k);

for i=1:min_k
     wsd(1,i) = ws_distance(lambda1(i)*vector1(:,i), lambda2(i)*vector2(:,i), 1);
end

ELD = mean(wsd);



