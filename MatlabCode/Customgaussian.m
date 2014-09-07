clear all
close all
clc

%% Time specifications:
% fs =1000000;              % samples per second 
% dt = 1/fs;                % seconds per sample
% StopTime = 1.5;           % seconds
% x=(-4:dt:4); % for normal axis

fs =1000;                   % samples per second 
dt = 1/fs;                  % seconds per sample
StopTime = 1.5;             % seconds
x=(-1.25:dt:1.25);          % for normal axis

%% genetation of gaussian pulse
% sigma= .8;
% fb=exp(-(x).^2/(2*sigma^2))./(sigma*sqrt(2*pi));
% f1=fb.*(-x./sigma^2);
% f2=fb.*((x.^2.-sigma^2)./(sigma^4));
% f3=fb.*((x.^3-(3*x.*sigma^2))/(-sigma^6));
% f0=fb;

sigma= .1;
fb=exp(-(x).^2/(2*sigma^2))./(sigma*sqrt(2*pi))/8;  %Scaled by a factor of 8
f1=fb.*(-x./sigma^2)/6;                             %Scaled by a factor of 6
f2=fb.*((x.^2.-sigma^2)./(sigma^4))/100;            %Scaled by a factor of 100
f3=fb.*((x.^3-(3*x.*sigma^2))/(-sigma^6))/1400;     %Scaled by a factor of 1400
f0=fb;


%% Plotting of gaussian pulses
figure(1)
subplot(2,2,1);
plot(x,fb)
title('Zero Order Pulse');
subplot(2,2,2);
plot(x,f1)
title('First Order Pulse');
subplot(2,2,3);
plot(x,f2)
title('Second Order Pulse');
subplot(2,2,4);
plot(x,f3)
title('Third Order Pulse');


%% Plotting the sum of two gaussian pulses
f12= f1+f2;
f13= f1+f3;
f23= f2+f3;

figure(2)
subplot(2,2,1);
plot(x,f12)
title('Sum of f1 and f2');
subplot(2,2,3);
plot(x,f13)
title('Sum of f1 and f3');
subplot(2,2,4);
plot(x,f23)
title('Sum of f2 and f3');

%% Plotting of gaussian pulses
figure(1)
subplot(2,2,1);
plot(x,fb)
title('Zero Order Pulse');
subplot(2,2,2);
plot(x,f1)
title('First Order Pulse');
subplot(2,2,3);
plot(x,f2)
title('Second Order Pulse');
subplot(2,2,4);
plot(x,f3)
title('Third Order Pulse');

%% Plotting the sum of two gaussian pulses
f12= f1+f2;
f13= f1+f3;
f23= f2+f3;

figure(2)
subplot(2,2,1);
plot(x,f12)
title('Sum of f1 and f2');
subplot(2,2,3);
plot(x,f13)
title('Sum of f1 and f3');
subplot(2,2,4);
plot(x,f23)
title('Sum of f2 and f3');

%% Correlation analysis
% std_correlation121= sum(f12.*f1)
% normalized_correlation121= std_correlation121/sqrt(sum(f12.^2).*sum(f1.^2))
c121= corrcoef(f12,f1)
c122= corrcoef(f12,f2)
odd312=corrcoef(f12,f3)

% std_correlation122= sum(f12.*f2)
% normalized_correlation122= std_correlation122/sqrt(sum(f12.^2).*sum(f2.^2))



% std_correlation131= sum(f13.*f1)
% normalized_correlation131= std_correlation131/sqrt(sum(f13.^2).*sum(f1.^2))
c131= corrcoef(f13,f1)
c133= corrcoef(f13,f3)
odd213=corrcoef(f13,f2)

% std_correlation133= sum(f13.*f3)
% normalized_correlation133= std_correlation133/sqrt(sum(f13.^2).*sum(f3.^2))


% std_correlation232= sum(f23.*f2)
% normalized_correlation232= std_correlation232/sqrt(sum(f23.^2).*sum(f2.^2))
c232= corrcoef(f23,f2)
c233= corrcoef(f23,f3)
odd123=corrcoef(f23,f1)

% std_correlation233= sum(f23.*f3)
% normalized_correlation233= std_correlation233/sqrt(sum(f23.^2).*sum(f3.^2))
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

