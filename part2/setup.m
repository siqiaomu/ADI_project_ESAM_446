function [NX, NY, XL, XR, YBOT, YTOP, sigma, xc, yc, d1, d2, DT, TFIN, NSTEPS, DTPLOT] = setup(filename)
    M = csvread(filename, 1, 0); %read second row bc first row is full of text
    NX = M(1, 1);
    NY = M(1, 2);
    XL = M(1, 3);
    XR = M(1, 4);
    YBOT = M(1, 5);
    YTOP = M(1, 6);
    sigma = M(1, 7);
    xc = M(1, 8);
    yc = M(1, 9);
    d1 = M(1, 10);
    d2 = M(1, 11);
    DT = M(1:4, 12);
    TFIN = M(1, 13);
    NSTEPS = M(1:4, 14);
    DTPLOT= M(1:10, 15);
end