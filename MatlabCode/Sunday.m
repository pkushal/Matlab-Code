clear all
close all
clc

%% Time specifications:
fs =1000;                   % samples per second MHz
dt = 1/fs;                   % seconds per sample
StopTime = 1.5;             % seconds
x=(-3.25:dt:3.25); % for normal axis


%% genetation of gaussian pulse
sigma= .8;
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
f0=fb;

%% Plotting of gaussian pulses
figure(1)
subplot(3,2,1);
plot(x,fb)
title('Zero Order Pulse');
subplot(3,2,3);
plot(x,f1)
title('First Order Pulse');
subplot(3,2,4);
plot(x,f2)
title('Second Order Pulse');
subplot(3,2,5);
plot(x,f3)
title('Third Order Pulse');
subplot(3,2,6);
plot(x,f4)
title('Fourth Order Pulse');
% figure(5)
% plot(x,f4)
%% Plotting the sum of two gaussian pulses
f12= f1+f2;
f13= f1+f3;
f14= f1+f4;
f23= f2+f3;
f24= f2+f4;
f34= f3+f4;

figure(2)
subplot(3,2,1);
plot(x,f12)
title('Sum of f1 and f2');

subplot(3,2,2);
plot(x,f13)
title('Sum of f1 and f3');

subplot(3,2,3);
plot(x,f14)
title('Sum of f1 and f4');

subplot(3,2,4);
plot(x,f23)
title('Sum of f2 and f3');

subplot(3,2,5);
plot(x,f24)
title('Sum of f2 and f4');

subplot(3,2,6);
plot(x,f34)
title('Sum of f3 and f4');

%% Correlation analysis
% std_correlation121= sum(f12.*f1)
% normalized_correlation121= std_correlation121/sqrt(sum(f12.^2).*sum(f1.^2))
c121= corrcoef(f12,f1)
c122= corrcoef(f12,f2)
odd312=corrcoef(f12,f3)
odd412=corrcoef(f12,f4)

c131= corrcoef(f13,f1)
c133= corrcoef(f13,f3)
odd213=corrcoef(f13,f2)
odd413=corrcoef(f13,f4)

c141= corrcoef(f14,f1)
c144= corrcoef(f14,f4)
odd214=corrcoef(f14,f2)
odd314=corrcoef(f14,f3)

c232= corrcoef(f23,f2)
c233= corrcoef(f23,f3)
odd123=corrcoef(f23,f1)
odd423=corrcoef(f23,f4)

c242= corrcoef(f24,f2)
c244= corrcoef(f24,f4)
odd124=corrcoef(f24,f1)
odd324=corrcoef(f24,f3)

c334= corrcoef(f34,f3)
c434= corrcoef(f34,f4)
odd134=corrcoef(f34,f1)
odd234=corrcoef(f34,f2)

%% finding the frequency spectrum of the above gaussian pulse
figure(3)
X= fft(f0);
N= length(f0);
bin_val = [0:N-1];
fax_Hz= bin_val*fs/N;
N_2= ceil(N/2);
X_mag=abs(X)/(N/2);
subplot(2,1,1)
plot(fax_Hz(1:N_2),X_mag(1:N_2))
xlabel('Hz');
ylabel('absolute magnitude');
title('plot(abs(fft(x))) one side only');

%% Power spectral density
subplot(2,1,2)
plot(fax_Hz(1:N_2),20*log10(X_mag(1:N_2)))
xlabel('Hz');
ylabel('Power dB')
title('plot(abs(fft(x))) one side only');

