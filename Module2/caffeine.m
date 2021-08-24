% how much caffeine is there in the jar?

nMax = 20; %number of days

N = 10; %number of coffee servings in a jar

x = zeros(1,nMax); %fraction of caffeine on day n
x(1) = 1.0; %initial fraction; matlab is a base 1 language

for n=2:nMax
    
    x(n) = x(n-1) - 1/N*x(n-1); %governing law, how system evolves over time

end % finished loop through days

figure(1);
plot(x,'-ob') % -ob is lines (-) connecting circles (o) blue (b)
ylabel('fraction caffeine')
xlabel('Days')

display(x); %displays the values of x in the command window

%right click can be used to evaluate variables (partial code execution)