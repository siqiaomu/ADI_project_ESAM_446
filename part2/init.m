function [u0] = init(x, y)
    global xc yc sigma
    u0 = exp(-(x - xc).^2/(2*sigma^2)) * exp(-(y - yc).^2/(2*sigma^2))/(2 * pi * sigma^2); %since x is vertical and y is horizontal this is an outerproduct and produces a matrix
end