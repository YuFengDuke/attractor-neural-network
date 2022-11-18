function [average_overlap, W] = attractor_neural_network(patterns, constant)
% this function simulate a attractor neural network and give the average
% retrieve quality, the parameters are given in function set_parameter().
% it also returns the learned graph and patterns


W = zeros(constant.N, constant.N);
sparse_matrix = ceil(rand(constant.N) - (1-constant.c));
[sparse_w, sparse_index] = code_sparse(W, sparse_matrix);

for i = 1:constant.mu
%     if mod(i,10) == 0
%         disp(['learning pattern ', num2str(i)]);
%     end
    pattern = patterns(i,:);
    sparse_w = sparse_w + synaptic_learning_rule(sparse_index, pattern, constant.f);
end

W = decode_sparse(sparse_w, sparse_index, constant);
W = set_diag_zero(W, constant);

overlaps = get_overlaps(W, patterns, constant);

average_overlap = mean(overlaps);