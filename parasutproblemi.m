clc
clear all
close all
m = input('m k�tlesini giriniz = ')
v0 = input('ik h�z giriniz= ')
g = 9.8; %ye�ekimi ivmesi
c = 125; %diren� katsayisi
h=0.1; % zaman arali�i fark� 0.1 s
t = 0:h:h+60;
k= max(size(t));
v(1)= v0;
for i = 1:k-1
    v(i+1)= v(i) + [g-(c/m)*v(i)]*h;
end

plot(t,v)



