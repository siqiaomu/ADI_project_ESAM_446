function [u0] = init(x, y)
    global k1 k2
    u0 = sin(k2 * pi * y) * sin(k1 * pi * x);
end