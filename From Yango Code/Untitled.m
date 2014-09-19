% figure (1);
% plot(nn11,'-.r');
% hold on;
% plot(nn21, '--g');
% hold on;
% plot(nn31,':b');
% hold on;
% plot(nn41,'-');
% title('Gaussian Derivatives (N1)')
% xlabel('time ns')
% ylabel('normalized magnitude')
% 
% 
% figure (2);
% plot(nn12,'-.r');
% hold on;
% plot(nn22, '--g');
% hold on;
% plot(nn32,':b');
% hold on;
% plot(nn42,'-');
% title('Gaussian Derivatives (N2)')
% xlabel('time ns')
% ylabel('normalized magnitude')

corrcoef(nn11, (nn21+nn41))