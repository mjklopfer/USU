%% Problem 1 - flute22.wav

[x,fs]=audioread('flute22.wav');
time=[0:length(x)-1]/fs;

subplot(311)
plot(time,x);
title("flute22.wav");
xlabel('time [seconds]','FontSize',18);
ylabel('Amplitude','FontSize',18);
set(gca,'FontSize',16)
xlim([1.0 1.01]);
grid on;

t1=1.0;
t2=1.01;
i1=round(t1*fs);
i2=round(t2*fs);
nfft=2^12;
freq=([0:nfft-1]/nfft-0.5)*fs;
X=fft(x(i1:i2),nfft);
subplot(312)
plot(freq,20*log10(abs(fftshift(X))));
xlabel('frequency [Hz]','FontSize',18);
ylabel('magnitude [dB]','FontSize',18);
set(gca,'FontSize', 16)
grid on;

nfft2=2^8;
overlap=round(0.8*nfft2);
window=hamming(nfft2);
subplot(313)
spectrogram(x,window,overlap,nfft2,fs);
set(gca,'FontSize',16);
grid on;


print -fillpage -dpdf plot_flute22wav_time_freq.pdf



%% Problem 1 - music.mp3

[x,fs]=audioread('music.mp3');
time=[0:length(x)-1]/fs;

subplot(311)
plot(time,x);
title("music.mp3");
xlabel('time [seconds]','FontSize',18);
ylabel('Amplitude','FontSize',18);
set(gca,'FontSize',16)
xlim([1.0 1.01]);
grid on;

t1=1.0;
t2=1.01;
i1=round(t1*fs);
i2=round(t2*fs);
nfft=2^12;
freq=([0:nfft-1]/nfft-0.5)*fs;
X=fft(x(i1:i2),nfft);
subplot(312)
plot(freq,20*log10(abs(fftshift(X))));
xlabel('frequency [Hz]','FontSize',18);
ylabel('magnitude [dB]','FontSize',18);
set(gca,'FontSize', 16)
grid on;

nfft3=2^8;
overlap=round(0.8*nfft3);
window=hamming(nfft3);
subplot(313)
spectrogram(x,window,overlap,nfft3,fs);
set(gca,'FontSize',16);
grid on;


print -fillpage -dpdf plot_musicmp3_time_freq.pdf

%% Problem 2 liftingbody.png

%% Problem 2 coloredChips.png
