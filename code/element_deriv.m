%represents derivative of an element e'(i), which is simple to calculate
%without the external functions
function e_prim = element_deriv(i, n, x)
    e_prim = zeros(size(x));
    
    range1 = (2 * (i - 1) / n <= x) & (x < 2 * i / n) & (0 <= x);
    range2 = (2 * i / n <= x) & (x < 2 * (i + 1) / n) & (x <= 2);
    
    e_prim(range1) = n / 2;
    e_prim(range2) = -n / 2;
end