function patterns = generate_pattern(N ,mu, f)
%Create random patterns to be learned
%Input:
%N: network size
%mu: number of patterns
%f: coding level, when f = 0.5, it is Hopfield network case
%Output:
%patterns: 0,1 matrix with size [mu,N]

patterns = zeros(mu, N);

for i = 1:mu
    M_p =  round(N*f);
    M_n = N-M_p;
    
    if f == 0.5
        L = [ones(1,M_p),-ones(1,M_n)];
    else
        L = [ones(1,M_p),zeros(1,M_n)];
    end
    
    seed = randperm(N);
    patterns(i,:) = L(seed);
end