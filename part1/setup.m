function [NX, NY, XL, XR, YBOT, YTOP, k1, k2, d1, d2, DT, TFIN, NSTEPS, DTPLOT] = setup(filename)
    M = csvread(filename, 1, 0); %read second row bc first row is full of text
    NX = M(1);
    NY = M(2);
    XL = M(3);
    XR = M(4);
    YBOT = M(5);
    YTOP = M(6);
    k1 = M(7);
    k2 = M(8);
    d1 = M(9);
    d2 = M(10);
    DT = M(11);
    TFIN = M(12);
    NSTEPS = M(13);
    DTPLOT= M(14);
end