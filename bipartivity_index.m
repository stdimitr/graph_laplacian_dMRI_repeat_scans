function bs = bipartivity_index(network)

%%% ESTIMATION OF THE BIPARTIVITY INDEX DEFINED BY Estrada, 2022
%%% Estrada, E. The many facets of the Estrada indices of graphs and networks. 
% SeMA 79, 57–125 (2022). https://doi.org/10.1007/s40324-021-00275-w

%%% INPUT : network of size N x N where N denotes the number of nodes
%%%OUTPUT : bs - the bipartivity index

%%% VERSION 1.0 20/8/2019
%%% VERSION 1.1 25/6/2023

%%% contanct: stidimitriadis@gmail.com / DimitriadisS@cardiff.ac.uk
%%% WEBPAGE:https://www.researchgate.net/profile/Stavros_Dimitriadis

num = 0;
den = 0;
bs = 0;

num = sum(diag(expm(-network)));
den = sum(diag(expm(network)));

bs = num/den;