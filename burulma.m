clc 
clear

fprintf("Lütfen moment giriþ tercihinizi yapýnýz \n");
fprintf("------------------------------------------------------- \n");
fprintf("1. Momentleri doðrudan moment olarak girmek istiyorum  \n");
fprintf("2. Momentleri güç ve devir sayýsý olarak girmek istiyorum  \n");
fprintf("------------------------------------------------------- \n");
tercih = 0;
while (tercih< 1) || (tercih>2)
    tercih = input("Tercih(1-2):");
end

fprintf("\n");

if(tercih == 2)
   guctercihi = 0; 
   while ( guctercihi < 1 ) || (guctercihi >2 )
       guctercihi = input("Güç birimi tercihinizi yapýnýz(1- kw,2-BG):");
   end
   devir = input("Devir sayýsýný (dönüþ hýzýný) giriniz (d/dak):");
   fprintf("\n");
end
disli = input("Mil üzerindeki diþli sayýsýný giriniz:");
M = zeros(1,disli);
for k = 1:disli
    if (tercih == 1)
        fprintf("%d. diþlideki burulma momentini giriniz (Nm):",k);
        moment = input(" ");
        M(k) = moment * 1000;
    end
    if (tercih == 2) &&(guctercihi == 1)
        fprintf("%d.diþlideki gücü giriniz (kW):",k);
        guc = input(" ");
        M(k) = (9550 * ( guc / devir)) * 1000;
    end
     if (tercih == 2) &&(guctercihi == 2)
        fprintf("%d.diþlideki gücü giriniz (BG):",k);
        guc = input(" ");
        M(k) = (7026 * ( guc / devir)) * 1000;
     end
end
fprintf("\n");

mil = disli -1;
L = zeros(1,mil);
D = zeros(1,mil);
for k = 1:mil
    fprintf("%d. mil bölgesinin boyunu giriniz (mm):",k);
    boy = input(" ");
    fprintf("%d. mil blgesinin çapýný giriniz (mm):",k);
    cap = input(" ");
    L(k) = boy;
    D(k) = cap;
end
fprintf("\n");

MilMoment =  zeros(1,mil);
TauBurulma = zeros(1,mil);

MilMoment(1) = M(1);
for k = 2:mil
    MilMoment(k) = MilMoment(k-1) + M(k);
end

for k = 1:mil
    TauBurulma(k) = (MilMoment(k) / ((pi/32)*(D(k)^4))) * (D(k)/2);
end

G = 80000;
TwistAngle = 0;
for k = 1:mil
    BolgeAngle = (MilMoment(k) * L(k) / ( G * ((pi/32)*D(k)^4)));
    TwistAngle = TwistAngle + BolgeAngle;
end

fprintf("SONUÇLAR\n");
fprintf("--------------------------------------------------- \n");
for k = 1:disli
    fprintf("%d. diþlideki burulma momenti = %.2f Nm \n", k,M(k)/1000);
end
fprintf("---------------------------------------------------- \n");

for k = 1:mil
    fprintf("%d. mil bölgesindeki burulma momenti = %.2f Nm \n",k,MilMoment(k)/1000);
    fprintf("%d. mil bölgesindeki burulma gerilmesi = %.2f MPa \n",k,TauBurulma(k));
end
fprintf("-------------------------------------------------------\n");
fprintf("Milin toplam burulma açýsý %.4f radyam \n", TwistAngle);
fprintf("Milin toplam burulma açýsý %.4f derece \n", (TwistAngle/pi)*180);
fprintf("-------------------------------------------------------\n");

hold on
bas = 0;
son = L(1);
sonnoktax = 0;
sonnoktay = 0;
for k = 1:mil
    moment = MilMoment(k) / 1000;
    plot([bas son],[moment moment]);
    plot([sonnoktax bas],[sonnoktay moment])
    sonnoktax = son;
    sonnoktay = moment;
    if(k == mil)
        break
    end
    bas = son;
    son = bas + L(k+1);
end
plot([sonnoktax son],[sonnoktay 0])
plot([0 son],[0 0])
title("Burulma Momenti Grafiði")
xlabel("z (mm)")
ylabel("Burulma Momenti (Nm)")
grid








