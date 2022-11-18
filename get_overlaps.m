function overlaps = get_overlaps(w, patterns, constant)
%get the retrival quality for each learned pattern
%Input:
%w: learned connectivity matrix, N by N
%patterns: the learned patterns, 0,1 matrix with size [mu,N]
%Output:
%overlaps: 1 by mu array, each number is between 0 and 1, it represents the retrival quality for each pattern, 
%1 means perfectly retrieve, 0 means can not retrieve

overlaps = zeros(1, constant.sample_size);

sample_index = randsample(constant.mu, constant.sample_size)';

for i = 1:constant.sample_size
    input_pattern = patterns(sample_index(i),:);
    fix_point = get_fix_point(w, input_pattern, constant.f, constant.activation_threshold);
        
    overlaps(i) = cal_overlap(input_pattern, fix_point, constant.f);
    disp(['simulating ', num2str(i), '/', num2str(constant.sample_size), ' th pattern ', 'm= ', num2str(overlaps(i))]);
end