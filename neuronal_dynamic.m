function I = neuronal_dynamic(W, I, activation_threshold, positive_state, negative_state)

N = size(I,2);
for neuronal_index = 1:N
    h = I * W(:,neuronal_index);
    if h > activation_threshold
        I(neuronal_index) = positive_state;
    else
        I(neuronal_index) = negative_state; 
    end
end