F=[-1:0.01:1];
 X=1./(1-0.9*exp(-i*2*pi*(F-(1./8))));
 Y=0.5*(1./(1-0.9*exp(-i*2*pi*(F-(1./8)))))+(0.5*conj(1./(1-0.9*exp(-i*2*pi*(-F-(1./8))))));
 figure(1);
 clf;
 subplot(211)
 hold on
 plot(F,real(X),'LineWidth',2);
 plot(F,real(Y),'LineWidth',2);
 xlabel('Frequency [cycles/sample]');
 ylabel('Real component');
 legend('X(f)','Y(f)');
 hold off
 subplot(212)
 hold on
 plot(F,imag(X),'LineWidth',2);
 plot(F,imag(Y),'LineWidth',2);
 xlabel('Frequency [cycles/sample]');
 ylabel('Imaginary component');
 legend('X(f)','Y(f)');
 hold off
 print -dpng realImagHW4-5.png
 figure(2);
 clf;
 subplot(211)
 hold on
 plot(F,abs(X),'LineWidth',2);
 plot(F,abs(Y),'LineWidth',2);
 xlabel('Frequency [cycles/sample]');
 ylabel('Magnitude');
 legend('X(f)','Y(f)');
 hold off
 subplot(212)
 hold on
 plot(F,angle(X),'LineWidth',2);
 plot(F,angle(Y),'LineWidth',2);
 xlabel('Frequency [cycles/sample]');
 ylabel('Phase');
 legend('X(f)','Y(f)');
 hold off
 print -dpng magPhaseHW4-5.png