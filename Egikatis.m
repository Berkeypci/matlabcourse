clc
clear

v0 = input("h�z=");
alfa = input("a��=");

g = 9.81;

tv = (2 * v0 * sind(alfa)) / g;
t = 0:0.1:tv
x = v0 * t * cosd(alfa);
h = (v0 * t * sind(alfa)) - ((g * (t.^2)) / 2);

plot(x,h);
title("E�ik At�� x-h Grafi�i");
xlabel("Yatay �lerleme (x)");
ylabel("Y�kseklik (h)");
grid

fprintf("ucus %4f.\n",tv);

