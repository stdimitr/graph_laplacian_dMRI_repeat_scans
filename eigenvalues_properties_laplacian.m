function [properties,nlaplac_energy]=eigenvalues_properties_laplacian(eigenvalues,vertices,edges)


%%%INPUT  : eigenvalues : absolute values of eigenvalues of a Laplacian
%%%         matrix
%%% OUTPUT: 9 basic properties related to eigenvalues: min max 2nd largest
%%% eigenvalue & 4 sum of roots of eigenvalues for roots 1, 1/2, 2, -1
%%%%% Synchronizability = l2/lmax & laplacian energy


%%% VERSION 1.0 20/8/2019

%%% contanct: stidimitriadis@gmail.com / DimitriadisS@cardiff.ac.uk
%%% WEBPAGE:https://www.researchgate.net/profile/Stavros_Dimitriadis

%% sort eigenvalues from lowest to highest
[eigenvalues index]=sort(eigenvalues,'ascend'); 

N=length(eigenvalues);

%%% MIN, MAX, 2ND 
propert3=[min(eigenvalues(2:end)) , max(eigenvalues), eigenvalues(2)];


%%% SUM OF EIGENVALUES IN DIFFERENT ROOTS : 2,1,1/2 , -1
propert4=[];

sum1=0;
sum2=0;
sum3=0;
sum4=0;

roots=[1,1/2,2,-1];
for k=1:N
    sum1=sum1 + eigenvalues(k)^(roots(1));
    sum2=sum2 + eigenvalues(k)^(roots(2));
    sum3=sum3 + eigenvalues(k)^(roots(3));
    sum4=sum4 + eigenvalues(k)^(roots(4));
end
    
propert4=[sum1 sum2 sum3 sum4];

%%Synchronizability
synch=0;
synch=eigenvalues(2)/max(eigenvalues);

%%%Normalized Laplacian energy
nlaplac_energy=zeros(1,N);
n = vertices;
m= edges;

ratio = (2*m)/n;
for k=1:N
     nlaplac_energy(k) = abs((eigenvalues(k) - 2*m)/n);
end


properties=[propert3 propert4 synch sum(nlaplac_energy)];
    
    
end
