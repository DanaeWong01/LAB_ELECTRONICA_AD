N = 256;
n = 0:N-1;
x = round(128 + 127*sin(2*%pi*n/N));
clf();
plot(n,x);
xlabel("Muestra");
ylabel("Amplitud");
title("Seno entre 0 y 256");
xgrid();
// Generamos ahora un archivo txt con los valores del seno para hacer la rom
arch = mopen("C:\LAB_ELECTRONICA_AD\EXP2\Scilab\seno.txt", "wt");
for k = 1:N
    mfprintf(arch, "%d\n", x(k));
end
mclose(arch); 
