E = 0.08;
a = 1.0;
b = 0.2;
I0 = 1.0;
D = 0.9;
tstart = 40;
tstop = 47;

initv = [-1.13]*ones(50,1);
initw = [-0.65]*ones(50,1);

I = @(t) I0*(t>tstart).*(t<tstop);

dvdt = @(v,w,t) v-(1/3)*v.^3-w;
dwdt = @(v,w,t) E*(v+a-b*w);

dxdt = @(t,x)[dvdt(x(1:50),x(51:100),t)+[I(t);zeros(49,1)]+D*([x(50);x(1:49)]-2*x(1:50)+[x(2:50);x(1)]);
              dwdt(x(1:50),x(51:100),t)];

[T,X] = ode45(dxdt,[0,200],[initv;initw]);

%figure(1); clf; hold on;

%plot(T,X)

for nt=1:numel(T)
    figure(5); clf; hold on; box on;
    plot(X(nt,1:50));
    set(gca, 'ylim',[-2.5,2.5])
    xlabel('Cell')
    ylabel('Voltage')
    drawnow;
end


%2)steady state  -1.13,-0.69
