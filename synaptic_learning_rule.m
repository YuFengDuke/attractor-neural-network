function dw = synaptic_learning_rule(sparse_index, pattern, f)
%Plasticity learning rule
%Input:
%sparse_index: the index for sparse form of connectivity matrix
%pattern: 1d array that to be learned
%f: coding level of the pattern, f = 0.5 for Hopfield network case

dw = zeros(size(sparse_index,1),1);

for k = 1:size(sparse_index, 1)
    if f == 0.5
        dw(k) = pattern(sparse_index(k,1)) *  pattern(sparse_index(k,2));
    else
        dw(k) = (pattern(sparse_index(k,1))- f) *  (pattern(sparse_index(k,2))-f) / f / (1-f);
    end
    
end




