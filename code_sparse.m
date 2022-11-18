function [sparse_W, sparse_index] = code_sparse(W, sparse_matrix)
%Change the full matrix W to sparse form
%Input:
%W: N by N weighted graph
%sparse_matrix: N by N matrix with 0,1. 1 represent keep the weight.
%Output:
%sparse_W: 1D array represent the sparse matrix
%sparse_index: the collum and row index for weight in sparse_W 

[i,j,s] = find(sparse_matrix);
sparse_index = [i,j];
sparse_W = zeros(size(s));
for k = 1:size(s,1)
    sparse_W(k) = W(sparse_index(k,1), sparse_index(k,2));
end
