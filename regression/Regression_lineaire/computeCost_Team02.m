function J = computeCost_Team02(X, y, theta)
m = length(y);
J = 0;
J = (1/(2*m))*sum(power((X*theta - y),2));
end