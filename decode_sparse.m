function w = decode_sparse(sparse_w, sparse_index, constant)
%Decode the sparse matrix to full matrix
%Input:
%sparse_w: 1D array in sparse form
%sparse_index: 1D array stores the col and row index for sparse_w
%Output:
%w: full matrix with size N by N decoded from sparse_w

w = zeros(constant.N);

for k = 1: size(sparse_index, 1)
    w(sparse_index(k,1),sparse_index(k,2)) = sparse_w(k);
end
