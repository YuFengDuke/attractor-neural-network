function constant = set_parameter(N, c, mu, f, activation_threshold, sample_size)

% network size
constant.N = N;

%connection prob
constant.c = c;

%default number of patterns
constant.mu = mu;

%the coding level of the network. The fraction of neural involves in
%learning
constant.f = f;

% the neural activation threshold. 0 for Hopfield network.
constant.activation_threshold = activation_threshold;

% the number of sample to check the overlap between network state and patterns
constant.sample_size = sample_size;
