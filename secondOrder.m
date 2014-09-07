function y = SecondOrder(u)
sigma = 0.4;
y =((u.^2.-sigma^2)./(sigma^4));