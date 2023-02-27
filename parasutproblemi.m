clc
clear all
close all
m = input('m kütlesini giriniz = ')
v0 = input('ik hýz giriniz= ')
g = 9.8; %yeçekimi ivmesi
c = 125; %direnç katsayisi
h=0.1; % zaman araliði farký 0.1 s
t = 0:h:h+60;
k= max(size(t));
v(1)= v0;
for i = 1:k-1
    v(i+1)= v(i) + [g-(c/m)*v(i)]*h;
end

plot(t,v)



