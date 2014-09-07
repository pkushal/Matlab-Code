function y = thirdOrder(u)
sigma = 0.4;
y =((u.^3-(3*u.*sigma^2))/(-sigma^6));