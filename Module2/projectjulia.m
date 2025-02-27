nMax = 22; 

x = zeros(1,nMax); 
y = zeros(1,nMax);
x(1) = 0.1;
y(1) = 0.1;
c = -0.8;
d = 0.156;

for n=2:nMax
    
    x(n)=x(n-1).^2-y(n).^2+c;
    y(n)=2*x(n-1)*y(n-1)+d;
    
end 

figure(1);
clf;
hold on
%subplot(1,2,1);
plot(x)
%subplot(1,2,2);
plot(y)

