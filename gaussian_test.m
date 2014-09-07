x=-100:0.1:100;
%%plot using the classical a,b and c parameters
%a=1;
%b=50;
%c=15;
%f=a*exp(-(x-b).^2/(2*c^2));
%figure(1);
%subplot(2,2,1);
%plot(x,f)

%%plot using the sigma function (like the SD), whose square is the variance
sigma= 5;
f0=exp(-(x).^2/(2*sigma^2))./(sigma*sqrt(2*pi));
%axis([-100 xmax ymin ymax])
%figure(2);
subplot(2,4,1);
plot(x,f0)

%%plot for the firsr order gaussian pulse
f1=f0.*(-x./sigma^2);
subplot(2,4,2);
plot(x,f1)

%%plot for the second order gaussian pulse
f3=f0.*((x.^2.-sigma^2)./(sigma^4));
subplot(2,4,3);
plot(x,f3)

%%plot for the third order gaussian pulse
f3=f0.*((x.^3-(3*x.*sigma^2))/(-sigma^6));
subplot(2,4,4);
plot(x,f3)

%%plot for the fourth order gaussian pulse
f4=f0.*((x.^4-(6*x.^2*sigma^2)+(3*sigma^4))/(sigma^8));
subplot(2,4,5);
plot(x,f4)

%%plot for the fifth order gaussian pulse
f5=f0.*((x.^5-(10*x.^3*sigma^2)+(15*x.*sigma^4))/(-sigma^10));
subplot(2,4,6);
plot(x,f5)

%%plot for the sixth order gaussian pulse
f6=f0.*((x.^6-(15*x.^4*sigma^2)+(45*x.^2*sigma^4)-(15*sigma^6))/(sigma^12));
subplot(2,4,7);
plot(x,f6)

%%plot for the seventh order gaussian pulse
f7=f0.*((x.^7-(21*x.^5*sigma^2)+(105*x.^3*sigma^4)-(105*x.*sigma^6))/(-sigma^14));
subplot(2,4,8);
plot(x,f7)

figure(2);
plot(x,(f1+f0))

figure(3);
plot(x,conv(f0,f1))

