clear all
close all
clc

%% Time specifications:
fs =1000;                   % samples per second MHz
dt = 1/fs;                   % seconds per sample
StopTime = 1.5;             % seconds
x=(-3.25:dt:3.25);           % for normal axis


%% genetation of gaussian pulse
sigma= .9;
fb=exp(-(x).^2/(2*sigma^2))./(sigma*sqrt(2*pi));
f1=fb.*(-x./sigma^2);
f2=fb.*((x.^2.-sigma^2)./(sigma^4));
f3=fb.*((x.^3-(3*x.*sigma^2))/(-sigma^6));
f4=fb.*(((x.^4)-(6*x.^2)+(3*sigma^4))./sigma^8);
%%
%%Normalizing the gaussian derivatives
fb=fb./(max(fb));
f1=f1./(max(f1));
f2=f2./(max(f2));
f3=f3./(max(f3));
f4=f4./(max(f4));

%% Correlation analysis of the gauss pulses
% std_correlation121= sum(f12.*f1)
% normalized_correlation121= std_correlation121/sqrt(sum(f12.^2).*sum(f1.^2))
all=f1+f2+f3;
all1= corrcoef(all,f1)
all2= corrcoef(all,f2)
all3=corrcoef(all,f3)
all4=corrcoef(all,f4)



