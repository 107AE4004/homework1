clear all；
[s, fs]=audioread('C:\Users\mechrevo\Desktop\matlab\abc.wav');
sound(s,fs);
time=(1:length(s))/fs;
left=s(:,1);   %因?錄音檔的問題，本機添加此項才可以用到spectrogram
x=left; 
audiowrite('C:\Users\mechrevo\Desktop\matlab\abc1.wav',x,fs);
subplot(7,2,1);plot(time,x);title('原本的聲音');
subplot(7,2,2);
spectrogram(x,1024,1000,[],fs,'yaxis');
A=min(x);
B=max(x);
C=mean(x);
audiowrite('C:\Users\mechrevo\Desktop\matlab\abc1-1.wav',x,fs*2);
sound(x,fs*2);
time11=(1:length(x))/(fs*2);
subplot(7,2,7);plot(time11,x);title('聲音加快2倍');
subplot(7,2,8);
spectrogram(x,1024,1000,[],fs*2,'yaxis');


audiowrite('C:\Users\mechrevo\Desktop\matlab\abc1-2.wav',x,fs/2);
sound(x,fs/2);
time12=(1:length(x))/(fs/2);
subplot(7,2,9);plot(time12,x);title('聲音變慢2倍');
subplot(7,2,10);
spectrogram(x,1024,1000,[],fs/2,'yaxis');

y=x*2;
audiowrite('C:\Users\mechrevo\Desktop\matlab\abc2.wav',y,fs);
sound(y,fs);
time2=(1:length(y))/fs;
subplot(7,2,3);plot(time2,y);title('放大2倍的聲音');
subplot(7,2,4);
spectrogram(y,1024,1000,[],fs,'yaxis');
z=x/2;
audiowrite('C:\Users\mechrevo\Desktop\matlab\abc3.wav',z,fs);
sound(z,fs);
time3=(1:length(z))/fs;
subplot(7,2,5);plot(time3,z);title('減小2倍的聲音');
subplot(7,2,6);
spectrogram(z,1024,1000,[],fs,'yaxis');

t=0:0.0000226758:2.089;
AM=3*(1+0.5*x').*cos(2*pi*10000*t);
subplot(7,2,11);plot((1:length(AM))/fs,AM);title('AM波形圖');
subplot(7,2,12);
spectrogram(AM,1024,1000,[],fs,'yaxis');title('AM時頻譜');
w=cumsum(x);
FM=cos(2*pi*10000*t+w');
subplot(7,2,13);plot((1:length(FM))/fs,FM);title('FM波形圖');
subplot(7,2,14);
spectrogram(FM,1024,1000,[],fs,'yaxis');title('FM時頻譜');
