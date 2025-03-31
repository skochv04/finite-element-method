%count integral using Gaussian quadrature
function gaussian = gaussian_integral(f, a, b, n)
x = linspace(a, b, n);
gaussian = 0;
for i=1:n-1
    a = x(i); b = x(i+1);
    gaussian = gaussian + (b-a)/2 *( f((a+b)/2-(b-a)/(2*sqrt(3))) + f((a+b)/2+(b-a)/(2*sqrt(3))) );
end