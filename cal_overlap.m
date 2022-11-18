function m = cal_overlap(pattern,fix_point,f)
%calculate the overlap between learned pattern and the neural network steady state
%Input:
%pattern: 1 by N array, learned pattern
%fix point: 1 by N array, the fix point of dynamic
%f: coding level
%Output:
%m: the overlap between learned pattern and neural steady state

M =  size(find(fix_point==1),2);
if M == 0
    m = 0;
    return
end

if f == 0.5
    m = mean(pattern .* fix_point);
else
    m =sum((pattern-f).*fix_point)/(1-f)/M;
end