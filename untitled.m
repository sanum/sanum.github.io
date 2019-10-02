N = 10;
n = 1:N;
x = 1./n;
f = 1./n;

f(1) = 0.5;

plot(x, f), shg



% p = polyfit(x, f, N-1);
% polyval(p, 0.5)

spline(x, f, .5)

xx = linspace(min(x), max(x));
hold on
plot(xx, spline(x, f, xx))
hold off

%%
clc
t = linspace(0,2*pi, 10001);
c = exp(1i*t);
f = 1./mygamma(c);
plot(f), shg


%%
clc
f = @(x) 1./gamma(x);
f = chebfun(f, [0, 2*pi]);
G = @(x) norm(chebfun(@(y) polyval(polyfit([1 2 3 4 5 x], f([1 2 3 4 5 x]), 1), y), [0 , 2*pi]) - f, inf)

fminbnd(G, 0, 2*pi)

x = .1;
g = chebfun(@(y) polyval(polyfit([1 2 3 4 5 x], f([1 2 3 4 5 x]), 1), y), [0 , 2*pi]);
plot(g);
hold on
plot(f)
hold off

norm(f-g, inf)






%%

t = linspace(0, 2*pi, 1001);
c = exp(1i*t);
f = @(x) 1./mygamma(x);
g = @(a) polyval(a, c);
opts = optimset('tolx', 1e-16, 'tolfun', 1e-16, 'MaxFunEvals', 1000);

% k = 1;
% mm = 100:10:400;
% n = [];
% for m = mm
%     m
%     a = fminsearch(@(a) norm(g(a) - f(c), m), [1 1 1 1], opts);
%     n(k) = norm(g(a) - f(c), inf);
%     k = k + 1;
% end
% 
% nn = n;

%

clc
m = 400;
a = fminsearch(@(a) norm(g(a) - f(c), m), [1 1 1 1], opts);
norm(g(a) - f(c), inf)
a = fminsearch(@(a) norm(g(a) - f(c), inf).^2, a, opts)
norm(g(a) - f(c), inf)






















































