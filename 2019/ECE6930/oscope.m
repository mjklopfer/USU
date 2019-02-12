%% oscilloscope
filename='flute22.wav';
[x,fs]=audioread(filename);
time=[0:length(x)-1]/fs;
plot(time,x);
xlabel('time [seconds]','FontSize',18);
ylabel('Amplitude','FontSize',18);

win_sec=0.01; %window length [seconds]
win_sam=round(win_sec*fs);%window length [samples]
step_sec=0.001; %step length [seconds]
step_sam=round(step_sec*fs); %step length [samples]

han=plot(time(1:win_sam),x(1:win_sam)); drawnow;
ylim(0.1*[-1 1]);
title(filename);
 xlabel('time [seconds]','FontSize',18);
    ylabel('Amplitude','FontSize',18);
for i=win_sam:step_sam:length(x)
    ind =[i-win_sam+1:i];
    set(han,'XData',time(ind),'Ydata',x(ind));
    xlim(time(ind([1,end])));
   
    drawnow;
    pause %used if plot runs too fast
end
