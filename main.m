clear;

% network size
N = 2000;

% connection prob
c = 1;

% coding level, f = 0.5 corresponds to Hopfield Model.
% when f is smaller than 0.5, the activation threshold should also changes,
% otherwise the capacity will be extremely small. 
f = 0.5;

% this number should be optimzed when f not equal 0.5
activation_threshold = 0;

% the number of sample to estimate the average overlap
sample_size = 50;

%memory load = stored pattern / network size
memory_load = 0.01:0.01:0.2;

%number of patterns
pattern_numbers = ceil(c * N * memory_load);


average_overlaps = zeros(size(pattern_numbers));
for i = 1:size(pattern_numbers,2)
    disp(['memory load alpha = ', num2str(memory_load(i))]);
    mu = pattern_numbers(i);
    sample_size = min(mu, sample_size);
    constant = set_parameter(N, c, mu, f, activation_threshold, sample_size);
    
    % patterns to be learned
    patterns = generate_pattern(N, mu, f);
    [average_overlap, graph] = attractor_neural_network(patterns, constant);
    average_overlaps(i) = average_overlap;
    
end

% the capacity for fully connected Hopfield network should be ~0.13 (f = 0.5)
% In the sparse coding case, the capacity should be larger than 0.3 (e.g.,f = 0.05)
figure;
plot(memory_load, average_overlaps, 'LineWidth', 4);
xlabel('$\alpha$','Interpreter','latex');
ylabel('$m$','Interpreter','latex');
set(gca, 'FontSize',36);
set(gcf, 'position', [0 0 900 800]);