function [theta, J] = gradientDescent_Team02(X, y, theta, alpha, iters)
m = length(y); 
J = zeros(iters, 1);
for iter = 1:iters
    delta = (1/m)*sum(X.*repmat((X*theta - y), 1, size(X,2)));
    theta = (theta' - (alpha * delta))';  
    J(iter) = computeCost_Team02(X, y, theta);
end
end