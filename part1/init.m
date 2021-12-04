function [u0] = init(x, y)
    global k1 k2
    u0 =  sin(k1 * pi * x) * sin(k2 * pi * y); %since x is vertical and y is horizontal this is an outerproduct and produces a matrix
end