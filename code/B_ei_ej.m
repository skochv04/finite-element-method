%count B (ei , ej)
function B = B_ei_ej(j, i, n)
    a = 0;
    b = 0;
    if (i == j) %the main diagonal of the matrix
        a = 2.* max(0, (i - 1) / n);
        b = 2.* min(1, (i + 1) / n);
    elseif (abs(i - j) == 1) %elements below the diagonal and above the diagonal
        a = 2.* max(0, min(i, j) / n);
        b = 2.* min(1, max(i, j) / n);
    end
    B = - gaussian_integral(@(x) (element_deriv(j, n, x) .* element_deriv(i, n, x) ) , a, b, n)... 
    + element(i, n, 0) .* element(j, n, 0);
end