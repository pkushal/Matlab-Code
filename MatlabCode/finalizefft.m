clear all
close all
%% Time specifications:
fs =1000;                   % samples per second
dt = 1/fs;                   % seconds per sample
StopTime = 1.5;             % seconds
t = (0:dt:StopTime-dt)';     % seconds

%% Sine wave:
Fc = 60;                     % hertz
x = sin(2*pi*Fc*t);

% Plot the signal versus time:
figure(1);
plot(t,x);
xlabel('time (in seconds)');
title('Signal versus Time');
zoom xon;

N= length(x); % N is 2000 which is 25% of 8000Hz
f= -fs/2:fs/(N-1):fs/2;
z1= fftshift(fft(x));



bin_val = [0:N-1];
fax_Hz= bin_val*fs/N;
N_2= ceil(N/2);

X= fft(x);
figure(2)
subplot(2,2,1);
plot(abs(X))
xlabel('bins');
ylabel('magnitude');
title('plot(abs(fft(x)))');

X_mag=abs(X)/(N/2);
subplot(2,2,2);
plot(fax_Hz(1:N_2),X_mag(1:N_2))
xlabel('Hz');
ylabel('absolute magnitude');
title('plot(abs(fft(x))) one side only');


X1= fftshift(fft(x));
subplot(2,2,3);
plot(abs(X1))
xlabel('bins');
ylabel('magnitude');
title('using fftshift');

X_mag1=abs(X1)/(N/2);
subplot(2,2,4);
plot(fax_Hz(1:N_2),X_mag1(1:N_2))
xlabel('Hz');
ylabel('absolute magnitude');
title('plot(abs(fft(x))) one side only');

figure(3)
plot(fax_Hz(1:N_2),20*log10(X_mag(1:N_2)))
xlabel('Hz');
ylabel('Power dB')
title('plot(abs(fft(x))) one side only');


