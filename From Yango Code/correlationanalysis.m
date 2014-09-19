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

f1t=corrcoef(nn11, (nn41+nn21+nn31))
f2t=corrcoef(nn21,(nn41+nn21+nn31))
f3t=corrcoef(nn31, (nn41+nn21+nn31))
f4t=corrcoef(nn41,(nn41+nn21+nn31))



