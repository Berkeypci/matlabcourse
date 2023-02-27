clc
clear

v0 = input("hýz=");
alfa = input("açý=");

g = 9.81;

tv = (2 * v0 * sind(alfa)) / g;
t = 0:0.1:tv
x = v0 * t * cosd(alfa);
h = (v0 * t * sind(alfa)) - ((g * (t.^2)) / 2);

plot(x,h);
title("Eðik Atýþ x-h Grafiði");
xlabel("Yatay Ýlerleme (x)");
ylabel("Yükseklik (h)");
grid

fprintf("ucus %4f.\n",tv);

