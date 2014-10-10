clc
y1=(MHn1.signals.values);
y1_nor = y1(2000:8010);
max(y1_nor);
y1_clipped = y1_nor./(max(y1_nor));


y2=(Hn1.signals.values);
y2_nor = y2(2000:8010);
max(y2_nor);
y2_clipped = y2_nor./(max(y2_nor));

y3=(Hn.signals.values);
y3_nor = y3(2000:8010);
max(y3_nor);
y3_clipped= y3_nor./(max(y3_nor));

y4=(Hn2.signals.values);
y4_nor = y4(2000:8010);
max(y4_nor);
y4_clipped= y4_nor./(max(y4_nor));

t=Hn1.time;
time_clipped=t(1:6011);
%now plotting the normalized and the clipped signals
figure (1);
subplot(2,2,1)
plot(time_clipped,y1_clipped)

subplot(2,2,2)
plot(time_clipped,y2_clipped)

subplot(2,2,3)
plot(time_clipped,y3_clipped)

subplot(2,2,4)
plot(time_clipped,y4_clipped)

%analyzing the cross correlation again
% h1=corrcoef(y1_clipped, (y2_clipped+y3_clipped+y4_clipped))
% h2=corrcoef(y1_clipped, (y1_clipped+y3_clipped+y4_clipped))
% h3=corrcoef(y1_clipped, (y1_clipped+y2_clipped+y4_clipped))
% h4=corrcoef(y1_clipped, (y1_clipped+y2_clipped+y3_clipped))
% 
% h11=corrcoef(y2_clipped, (y2_clipped+y3_clipped+y4_clipped))
% h21=corrcoef(y2_clipped, (y1_clipped+y3_clipped+y4_clipped))
% h31=corrcoef(y2_clipped, (y1_clipped+y2_clipped+y4_clipped))
% h41=corrcoef(y2_clipped, (y1_clipped+y2_clipped+y3_clipped))
% 
% h12=corrcoef(y3_clipped, (y2_clipped+y3_clipped+y4_clipped))
% h22=corrcoef(y3_clipped, (y1_clipped+y3_clipped+y4_clipped))
% h32=corrcoef(y3_clipped, (y1_clipped+y2_clipped+y4_clipped))
% h42=corrcoef(y3_clipped, (y1_clipped+y2_clipped+y3_clipped))
% 
% h13=corrcoef(y4_clipped, (y2_clipped+y3_clipped+y4_clipped))
% h23=corrcoef(y4_clipped, (y1_clipped+y3_clipped+y4_clipped))
% h33=corrcoef(y4_clipped, (y1_clipped+y2_clipped+y4_clipped))
% h43=corrcoef(y4_clipped, (y1_clipped+y2_clipped+y3_clipped))

%analyzing the single pulse from the clipped signals
figure(2)
t=time_clipped(1:2000);

h1=y1_clipped(1:2000);
h2=y2_clipped(1:2000);
h3=y3_clipped(1:2000);
h4=y4_clipped(1:2000);
subplot(2,2,1)
plot(t,h1)

subplot(2,2,2)
plot(t,h2)

subplot(2,2,3)
plot(t,h3)

subplot(2,2,4)
plot(t,h4)


% hc11=corrcoef(h1, (h2+h3+h4))
% hc12=corrcoef(h2, (h2+h3+h4))
% hc13=corrcoef(h3, (h2+h3+h4))
% hc14=corrcoef(h4, (h2+h3+h4))
% 
% hc21=corrcoef(h1, (h1+h3+h4))
% hc22=corrcoef(h2, (h1+h3+h4))
% hc23=corrcoef(h3, (h1+h3+h4))
% hc24=corrcoef(h4, (h1+h3+h4))
% 
% hc31=corrcoef(h1, (h1+h2+h4))
% hc32=corrcoef(h2, (h1+h2+h4))
% hc33=corrcoef(h3, (h1+h2+h4))
% hc34=corrcoef(h4, (h1+h2+h4))
% 
% hc41=corrcoef(h1, (h1+h2+h3))
% hc42=corrcoef(h2, (h1+h2+h3))
% hc43=corrcoef(h3, (h1+h2+h3))
% hc44=corrcoef(h4, (h1+h2+h3))

% %analyzing the original signal
figure(3)
t=time_clipped(1:2000);

ho1=y1(1:2000)./max(y1);
ho2=y2(1:2000)./max(y2);
ho3=y3(1:2000)./max(y3);
ho4=y4(1:2000)./max(y4);
subplot(2,2,1)
plot(t,ho1)

subplot(2,2,2)
plot(t,ho2)

subplot(2,2,3)
plot(t,ho3)

subplot(2,2,4)
plot(t,ho4)


oh11=corrcoef(ho1, (ho2+ho3+ho4));
oh12=corrcoef(ho2, (ho2+ho3+ho4));
oh13=corrcoef(ho3, (ho2+ho3+ho4));
oh14=corrcoef(ho4, (ho2+ho3+ho4));

oh21=corrcoef(ho1, (ho1+ho3+ho4));
oh22=corrcoef(ho2, (ho1+ho3+ho4));
oh23=corrcoef(ho3, (ho1+ho3+ho4));
oh24=corrcoef(ho4, (ho1+ho3+ho4));

oh31=corrcoef(ho1, (ho1+ho2+ho4));
oh32=corrcoef(ho2, (ho1+ho2+ho4));
oh33=corrcoef(ho3, (ho1+ho2+ho4));
oh34=corrcoef(ho4, (ho1+ho2+ho4));

oh41=corrcoef(ho1, (ho1+ho2+ho3));
oh42=corrcoef(ho2, (ho1+ho2+ho3));
oh43=corrcoef(ho3, (ho1+ho2+ho3));
oh44=corrcoef(ho4, (ho1+ho2+ho3));

%--------------after awgn channel-------------------%
snr = 20;
x=zeros(4);
% for i=1:11
oh11C=corrcoef(ho1, awgn((ho2+ho3+ho4),snr,'measured'));
oh12C=corrcoef(ho2, awgn((ho2+ho3+ho4),snr,'measured'));
oh13C=corrcoef(ho3, awgn((ho2+ho3+ho4),snr,'measured'));
oh14C=corrcoef(ho4, awgn((ho2+ho3+ho4),snr,'measured'));

oh21C=corrcoef(ho1, awgn((ho1+ho3+ho4),snr,'measured'));
oh22C=corrcoef(ho2, awgn((ho1+ho3+ho4),snr,'measured'));
oh23C=corrcoef(ho3, awgn((ho1+ho3+ho4),snr,'measured'));
oh24C=corrcoef(ho4, awgn((ho1+ho3+ho4),snr,'measured'));

oh31C=corrcoef(ho1, awgn((ho1+ho2+ho4),snr,'measured'));
oh32C=corrcoef(ho2, awgn((ho1+ho2+ho4),snr,'measured'));
oh33C=corrcoef(ho3, awgn((ho1+ho2+ho4),snr,'measured'));
oh34C=corrcoef(ho4, awgn((ho1+ho2+ho4),snr,'measured'));

oh41C=corrcoef(ho1, awgn((ho1+ho2+ho3),snr,'measured'));
oh42C=corrcoef(ho2, awgn((ho1+ho2+ho3),snr,'measured'));
oh43C=corrcoef(ho3, awgn((ho1+ho2+ho3),snr,'measured'));
oh44C=corrcoef(ho4, awgn((ho1+ho2+ho3),snr,'measured'));

x(1,:)=[oh11C(1,2), oh12C(1,2), oh13C(1,2), oh14C(1,2)];
x(2,:)=[oh21C(1,2),oh22C(1,2),oh23C(1,2),oh24C(1,2)];
x(3,:)=[oh31C(1,2),oh32C(1,2),oh33C(1,2),oh34C(1,2)];
x(4,:)=[oh41C(1,2),oh42C(1,2),oh43C(1,2),oh44C(1,2)];
 snr
 x'
% snr=snr+2;
% 
% end



% clear
% N = 10^6 % number of bits or symbols
% rand('state',100); % initializing the rand() function
% randn('state',200); % initializing the randn() function
% 
% Transmitter
% ip = rand(1,N)>0.5; % generating 0,1 with equal probability
% s = 2*ip-1; % BPSK modulation 0 -> -1; 1 -> 1 
% n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)]; % white gaussian noise, 0dB variance 
% Eb_N0_dB = [-3:10]; % multiple Eb/N0 values
% 
% for ii = 1:length(Eb_N0_dB)
%    Noise addition
%    y = s + 10^(-Eb_N0_dB(ii)/20)*n; % additive white gaussian noise
% 
%    receiver - hard decision decoding
%    ipHat = real(y)>0;
% 
%    counting the errors
%    nErr(ii) = size(find([ip- ipHat]),2);
% 
% end
% 
% simBer = nErr/N; % simulated ber
% theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); % theoretical ber
% 
% plot
% close all
% figure
% semilogy(Eb_N0_dB,theoryBer,'b.-');
% hold on
% semilogy(Eb_N0_dB,simBer,'mx-');
% axis([-3 10 10^-5 0.5])
% grid on
% legend('theory', 'simulation');
% xlabel('Eb/No, dB');
% ylabel('Bit Error Rate');
% title('Bit error probability curve for BPSK modulation');