function [L, U, ev] = graph_laplacian(A, method)
%graph_laplacian Computes the graph laplacian in addition to its
%eigenvectors and eigenvalues. Also sorts the eigenvalues/eigenvectors as
%ascending.
%   Function:
%   [L, U, ev] = graph_laplacian(A, method)
%   Input: 
%       A - Adjacency Matrix
%       method - 
%           'natural': L = D - A
%           'normalized': L = I - D^(-1/2)*A*D^(-1/2)

%% Senior Researcher, Dr. Stavros I. Dimitriadis
%% v1.0 12/3/2010
%% v1.1 16/7/2010
%% Personal Website : https://www.researchgate.net/profile/Stavros-Dimitriadis-3


rowdegree = (sum(A, 2)).';
coldegree = sum(A, 1);
nroi = length(rowdegree);

if ~exist('method','var') || strcmp(method,'normalized')
    L = eye(nroi) - diag(1./(sqrt(rowdegree)+eps)) * A* diag(1./(sqrt(coldegree)+eps)) ;
elseif strcmp(method, 'natural')
    L = diag(rowdegree) - A;
end

[U, ev] = eig(L);
ev = diag(ev);
[~, ii] = sort(ev, 'ascend');
ev = ev(ii);
U = U(:,ii);
end