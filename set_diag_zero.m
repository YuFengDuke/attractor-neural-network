function w = set_diag_zero(w, constant)
%Set the diag of w to be zero
%Input:
%w: the full form of connectivity matrix
%output:
%w: the conectivity matrix with 0 diag elements

for i = 1:constant.N
    w(i,i) = 0;
end