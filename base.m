function y = base(u)
sigma = 0.4;
y=exp(-(u).^2/(2*sigma^2))./(sigma*sqrt(2*pi));
