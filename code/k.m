function result = k(x)
    result = ones(size(x));
    result(x >= 0 & x <= 1.0) = 1.0;
    result(x > 1 & x <= 2.0) = 2.0;
end