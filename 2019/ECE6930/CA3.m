orig='fireflyintro.wav';
conv='fireflyconv.wav';
fir='fireflyfir.wav';
[xo,fso]=audioread(orig);
[xc,fsc]=audioread(conv);
[xf,fsf]=audioread(fir);
timeo=[0:length(xo)-1]/fso;
timec=[0:length(xc)-1]/fsc;
timef=[0:length(xf)-1]/fsf;
subplot(311)
plot(timeo,xo);
title('Original Firefly intro');
xlabel('time [seconds]','FontSize',18);
ylabel('Amplitude','FontSize',18);
subplot(312)
plot(timec,xc);
title('Convolution Firefly intro');
xlabel('time [seconds]','FontSize',18);
ylabel('Amplitude','FontSize',18);
subplot(313)
plot(timef,xf);
title('Filtering Firefly intro');
xlabel('time [seconds]','FontSize',18);
ylabel('Amplitude','FontSize',18);