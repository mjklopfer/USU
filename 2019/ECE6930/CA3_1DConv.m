orig='fireflyintro.wav';
conv='fireflyconv.wav';
fid=fopen('lpf_260_400_44100_80dB.bin','rb');
head=fread(fid,5,'int'); %Read in header
h=fread(fid,inf,'float'); %Read in impulse response
fclose(fid);
N=2^14; %FFT size
f=[0:N-1]*44100/N; %Make a frequency vector for plotting
H=abs(fft(h,N)).^2; %Compute the magnitude response

figure(1);
subplot(311)
%Magnitude Response Plot
semilogx(f,10*log10(H));
title('Magnitude Frequency Response of Filter');
grid on;
xlim([10 44100/2]);
ylim([-100 10]);
xlabel('log(frequency) [Hz]');
ylabel('Magnitude [dB]');
[xo,fso]=audioread(orig);
[xc,fsc]=audioread(conv);

nfft2=2^8;
overlap=round(0.8*nfft2);
window=hamming(nfft2);
subplot(312)

spectrogram(xo,window,overlap,nfft2,fso);
title('Firefly Input');
set(gca,'FontSize',16);
grid on;

subplot(313)

spectrogram(xc,window,overlap,nfft2,fsc);
title('Firefly Output');
set(gca,'FontSize',16);
grid on;

print -fillpage -dpdf plot_conv1D_time_freq.pdf