%represents e(i) function for n amount of elements and x variable
function e = element(i, n, x)
    h = 2/n;
    if (x >= h*(i-1) && x <= h*i)
        e = (x - h*(i-1))/h;
    elseif (x > h*i && x <= h*(i+1))
        e = (h*(i+1) - x)/h;
    else
        e=0;
    end
end