function fix_point = get_fix_point(W, input, f, activation_threshold)
%get the fix point of the network
%Input:
%W: the learned connectivity matrix
%input: the init state of the neural network (the pattern to be retrieved)
%Oupput:
%fix_point: the retrieved pattern or the fix point of the neural network with connectivity W
N = size(input,2);

positive_state = 1;
if f == 0.5
    negative_state = -1;
else
    negative_state = 0;
end

prev_I = input;
for i=1:50
    prev_I = neuronal_dynamic(W, prev_I, activation_threshold, positive_state, negative_state);
end

fix_point = prev_I;