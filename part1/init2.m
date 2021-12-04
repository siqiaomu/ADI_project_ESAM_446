function [u0] = init2(x, y)
    global k1
    u0 =  sin(k1 * pi * x) * ones(1, length(y))
end