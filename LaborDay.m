Fs= 1e1
dt = 1/Fs;
stoptime = 3;

% x= -stoptime:dt:stoptime;
x=0;
sigma = 0.4;

fo = exp(-(x).^2/(2*sigma^2))./(sigma*sqrt(2*pi));
f1 = fo.*(-x./sigma^2);
plot(x,(fo));
% Fs = 1e2;
% dt = 1/Fs;
% StopTime= 1;
% t=(0:dt:StopTime-dt);
% %Sine Wave:
% Fc= 10;
% x=sin(2*pi*Fc*t);
% %Plot
% plot(t,x);


        % %Time specifications:
        %    Fs = 1e6;                   % samples per second
        %    dt = 1/Fs;                   % seconds per sample
        %    StopTime = 0.6;             % seconds
        %    t = (0:dt:StopTime-dt)';     % seconds
        %     % Sine wave:
        %    Fc = 500;                     % hertz
        %    x = sin(2*pi*Fc*t);
        %    % Plot the signal versus time:
        %    figure;
        %    plot(t,x);
        %    xlabel('time (in seconds)');
        %    title('Signal versus Time');
        %    zoom xon;

