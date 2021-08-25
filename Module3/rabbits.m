x = zeros(1,200);

r = 0.1;
K = 0.6;

x(1)=0.2;

figure(1);
hold on

for n=2:200
    x(n)=x(n-1)+r*(1-(x(n-1)/K))*x(n-1);
end

plot(x)

r = 2.1;
K = 0.6;

x(1)=0.2;

for n=2:200
    x(n)=x(n-1)+r*(1-(x(n-1)/K))*x(n-1);
end

plot(x)

r = 2.5;
K = 0.6;

x(1)=0.2;

for n=2:200
    x(n)=x(n-1)+r*(1-(x(n-1)/K))*x(n-1);
end

plot(x)


K = 0.6;

figure(3);
hold on
for r=0:0.02:3
    x(1)=0.2;
    for n=2:200
        x(n)=x(n-1)+r*(1-(x(n-1)/K))*x(n-1);
        if n>=150
            plot(r,x(n),'rx')
        end 
    end 
end 
