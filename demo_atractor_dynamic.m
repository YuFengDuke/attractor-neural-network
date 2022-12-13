clear;

% network size
N = 36;

% connection prob
c = 1;

% coding level, f = 0.5 corresponds to Hopfield Model.
% when f is smaller than 0.5, the activation threshold should also changes,
% otherwise the capacity will be extremely small. 
f = 0.5;

% this number should be optimzed when f not equal 0.5
activation_threshold = 0;

% number of patterns
mu = 1;

% the number of sample to estimate the average overlap
sample_size = 1;

% two neuronal state, firing or not firing
positive_state = 1;
negative_state = -1;

constant = set_parameter(N, c, mu, 0.5, activation_threshold, sample_size);

% to learn an alphabet I
patterns = [0, 1, 1, 1, 1, 0;...
            0, 0, 1, 1, 0, 0;...
            0, 0, 1, 1, 0, 0;...
            0, 0, 1, 1, 0, 0;...
            0, 0, 1, 1, 0, 0;...
            0, 1, 1, 1, 1, 0];

patterns = [0, 1, 0, 0, 1, 0;...
            0, 1, 0, 0, 1, 0;...
            0, 1, 1, 1, 1, 0;...
            0, 1, 1, 1, 1, 0;...
            0, 1, 0, 0, 1, 0;...
            0, 1, 0, 0, 1, 0];

patterns(patterns == 0) = -1;
patterns = reshape(patterns, 1, 36);

[average_overlap, W] = attractor_neural_network(patterns, constant);

I = generate_pattern(36, 1, f);

% you will see the random pattern is attracted to the pattern we learned.
gif_name = 'attractor_demo.gif';
figure(1);
axis off;
hold on;
N = size(I,2);
for neuronal_index = 1:N
    h = I * W(:,neuronal_index);
    if h > activation_threshold
        I(neuronal_index) = positive_state;
    else
        I(neuronal_index) = negative_state; 
    end
    imagesc(reshape(I,6,6));
    pause(0.1);
    
end