% ------------------------------------------------------
A     = 1.1; % fluorescence intensity units
omega = 2.6; % rad/s
A_0   = 0.01;

u=@(t) A*sin(omega*t)+A_0;

tArray = linspace(0,1.6,200);
uArray = u(tArray); % an array of samples of u
% ------------------------------------------------------

% analytical solutions (in real life, we might not know these)
dudtExact      =  A*omega*cos(omega*tArray);
du2dt2Exact    = -A*omega^2*sin(omega*tArray);
du3dt3Exact    = -A*omega^3*cos(omega*tArray);

% Take the sample and add a bit of noise
 uObserved = u(tArray) + (1e-7)*randn(size(tArray));
 
%display(uObserved);

uOdudt = diff(uObserved)./diff(tArray);

figure(1);clf;hold on;
plot(tArray(1:end-1),uOdudt)
plot(tArray,dudtExact)
ylabel('du/dt');xlabel('t')

uOdu2dt2 = diff(uOdudt)./diff(tArray(1:end-1));
plot(tArray(1:end-2),uOdu2dt2)
plot(tArray,du2dt2Exact)
ylabel('du2/dt2');xlabel('t')

uOdu3dt3 = diff(uOdu2dt2)./diff(tArray(1:end-2));
plot(tArray(1:end-3),uOdu3dt3)
plot(tArray,du3dt3Exact)
ylabel('du3/dt3');xlabel('t')

%pDiffdudt = 100*abs(uOdudt-dudtExact(1:end-1))./dudtExact(1:end-1);
%meanDiff = mean(pDiffdudt);
%display(meanDiff)

for n=10.^[-3:-.1:-12]
   uObserved = u(tArray)+n*randn(size(tArray));
   uOdudt = diff(uObserved)./diff(tArray);
   uOdu2dt2 = diff(uOdudt)./diff(tArray(1:end-1));
   uOdu3dt3 = diff(uOdu2dt2)./diff(tArray(1:end-2));
   
   pDiffdudt = 100*abs(max(uOdudt-dudtExact(1:end-1)))./max(dudtExact(1:end-1));
   pDiffdu2dt2 = 100*abs(max(uOdu2dt2-du2dt2Exact(1:end-2)))./max(du2dt2Exact(1:end-2));
   pDiffdu3dt3 = 100*abs(max(uOdu3dt3-du3dt3Exact(1:end-3)))./max(du3dt3Exact(1:end-3));
   
   meanDiff = mean(pDiffdudt);
   meanDiff2 = mean(pDiffdu2dt2);
   meanDiff3 = mean(pDiffdu3dt3);

   if (meanDiff<=10)&&(meanDiff2<=10)&&(meanDiff3<=10)
      disp(n)
      disp(meanDiff)
      disp(meanDiff2)
      disp(meanDiff3)
      break
   end 

end