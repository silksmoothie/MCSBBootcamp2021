kAon = 10;
kAoff = 10;
kIon = 10;
kIoff = 10;
kAcat = 100;
kIcat = 10;
Ptot = 1;
Ktot = 1;
Itot = 1;

figure; hold on;

for n=10.^[-3:.01:2]
    Ktot = n;
    dAdt = @(A,AP,I,IK) -kAon*(Ptot-AP)*A+kAoff*AP+kAcat*IK; %x(1)
    dAPdt = @(A,AP,I,IK) kAon*(Ptot-AP)*A-kAoff*AP-kIcat*AP; %x(2)
    dIdt = @(A,AP,I,IK) -kIon*(Ktot-IK)*I+kIoff*IK+kIcat*AP; %x(3)
    dIKdt = @(A,AP,I,IK) kIon*(Ktot-IK)*I-kIoff*IK-kAcat*IK; %x(4)

    [T, X] = ode45(@(t,x)[dAdt(x(1),x(2),x(3),x(4));
                          dAPdt(x(1),x(2),x(3),x(4));
                          dIdt(x(1),x(2),x(3),x(4));
                          dIKdt(x(1),x(2),x(3),x(4))], [0,10], [0,0,Itot,0] );
    
    Asteady = mean(X(floor(length(T)/2):length(T),1));
    Isteady = mean(X(floor(length(T)/2):length(T),3));
    scatter(Ktot, Asteady/(Asteady+Isteady))
    
end 
set(gca, 'XScale', 'log')
ylabel('A/(A+I)');
xlabel('K Total');