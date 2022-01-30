clear all
close all 
clc

%-----------I----------
%-----------1----------
[y,Fs]=audioread('phrase.wav');
dt = 1/Fs;
t = 0:dt:(length(y)-1)*dt;
%-----------2----------
%sound(y,Fs);

%-----------3----------
%sound(y,2*Fs);
%sound(y,Fs/2);

%-----------4----------
rien_ne_sert_de = y(5055:77249);
plot(rien_ne_sert_de);
title('Rien ne sert de');

%-----------5----------
%sound(rien_ne_sert_de,Fs);

%-----------6----------
rien_ne_sert_de = y(5055:77249);
partir_a_point  = y(121652:168300);
il_faut = y(95393:121652);
courir  = y(76613:95393);

%-----------7----------
new_phrase =[rien_ne_sert_de,partir_a_point,il_faut,courir];
%sound(new_phrase,Fs);


%-----------II----------
%-----------1----------
 m_Fs=8192;
 Ts=1/m_Fs;
 t=[0:Ts:1];
 F_A=440; 
 F_dol=262;
 F_re=294;
 F_m=330;
 F_fa=349;
 F_sol=392;
 F_si=494;
 F_do2=523;
 A=sin(2*pi*F_A*t);
 Dol=sin(2*pi*F_dol*t); 
 re=sin(2*pi*F_re*t);
 mi=sin(2*pi*F_m*t);
 fa=sin(2*pi*F_fa*t);
 so=sin(2*pi*F_sol*t);
 la=sin(2*pi*F_A*t);
 si=sin(2*pi*F_si*t);
 do=sin(2*pi*F_do2*t);

doremifasol_solfamiredo= [Dol,re,mi,fa,so,la,si,do,do,si,la,so,fa,mi,re,Dol];
faded =[fa,fa,fa,si,mi,mi,re,si,si,si,si,fa,fa,fa,mi];
doremifa =[Dol,re,mi,fa,so,la,si,do];
inv =[do,si,la,so,fa,mi,re,do];
%sound(faded,2*m_Fs);


%-----------2_3----------
%signal analyzer
%-----------1---------- 
Sp=abs(fft(doremifa));
u=mag2db(Sp);
subplot(2,1,1);
fshift=(-length(doremifa)/2:length(doremifa)/2 -1 )*Fs/length(doremifa);
plot(fshift,fftshift(Sp));
title('signal(doremi) spectre');
subplot(2,1,2);
plot(fshift,fftshift(u));
title('signal(doremi) spectre shifted');

 
 
 
 


