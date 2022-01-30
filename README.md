<div id="top"></div>


<!-- PROJECT LOGO -->
<div align="center">
  <h2 align="center">TP2 : Jeux de mots</h2>
</div>

![logo](https://user-images.githubusercontent.com/80456274/151718182-54d53cc9-69bb-4710-af0e-f2fda10c0743.jpg)

<br />
<div align="center">
  <h3 align="center">Synthèse et analyse spectrale d’une gamme de musique</h3>
</div>


<!-- TABLE OF CONTENTS -->

  <summary>Table of Contents</summary>
  <ol>      
      <a href="#about-the-project">About The Project</a>         
      <li><a href="#Objectifs">Objectifs</a></li>
      <li><a href="#Jeux-de-mots">Jeux de mots</a></li> 
      <li><a href="#Synthèse-et-analyse-spectrale-d’une-gamme-de-musique">Synthèse et analyse spectrale d’une gamme de musique</a></li>
       <ul>
         <li><a href="#Synthèse-d’une-gamme-de-musique">Synthèse d’une gamme de musique</a></li> 
         <li><a href="#Spectre-de-la-gamme-de-musique">Spectre de la gamme de musique</a></li>
         <li><a href="#Approximation-du-spectre-d’un-signal-sinusoïdal-à-temps-continu-par-FFT">Approximation du spectre d’un signal sinusoïdal à temps continu par FFT</a></li>
       </ul>      
  </ol>



<!-- ABOUT THE PROJECT -->
# About The Project
This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

1. [**How to install Matlab**](https://csuf.screenstepslive.com/s/12867/m/48670/l/1263150-matlab-download-installation-for-windows-students)
2. **Clone the repo**
   ```sh
   git clone https://github.com/IlyasKadi/Rapport_TP1-Traitement-de-signal.git
   ```
 
<p align="right">(<a href="#top">back to top</a>)</p>


<!-- Overview -->
# Objectifs

> • Comprendre comment manipuler un signal audio avec Matlab, en effectuant
> certaines opérations classiques sur un fichier audio d’une phrase enregistrée via
> un smartphone.
>
> • Comprendre la notion des sons purs à travers la synthèse et l’analyse spectrale
> d’une gamme de musique.
> 
> **Commentaires** : Il est à remarquer que ce TP traite en principe des signaux continus.
> Or, l'utilisation de Matlab suppose l'échantillonnage du signal. Il faudra donc être
> vigilant par rapport aux différences de traitement entre le temps continu et le temps
> discret.
> 
> **Tracé des figures** : toutes les figures devront être tracées avec les axes et les
> légendes des axes appropriés.
> 
> **Travail demandé** : un script Matlab commenté contenant le travail réalisé et des
> commentaires sur ce que vous avez compris et pas compris, ou sur ce qui vous a
> semblé intéressant ou pas, bref tout commentaire pertinent sur le TP.


<p align="right">(<a href="#top">back to top</a>)</p>



# Synthèse-et-analyse-spectrale-d’une-gamme-de-musique

« phrase.wave » est un fichier audio enregistré à l’aide d’un smartphone, en
prononçant lentement la phrase :

   > **« Rien ne sert de courir, il faut partir à point ».**
   
1- Sauvegardez ce fichier sur votre répertoire de travail, puis charger-le dans MATLAB
à l’aide de la commande « **audioread** ».

```matlab
%-----------1----------
[y,Fs]=audioread('phrase.wav');
dt = 1/Fs;
t = 0:dt:(length(y)-1)*dt;
```

2- Tracez le signal enregistré en fonction du temps, puis écoutez-le en utilisant la
commande « **sound** ».

```matlab
%-----------2----------
sound(y,Fs);
```

3- Cette commande permet d’écouter la phrase à sa fréquence d’échantillonnage
d’enregistrement. Ecoutez la phrase en modifiant la fréquence d’échantillonnage à
double ou deux fois plus petite pour vous faire parler comme « Terminator » ou «
Donald Duck ». En effet, modifier la fréquence d’échantillonnage revient à appliquer
un changement d’échelle y(t) = x(at) en fonction de la valeur du facteur d’échelle, cela
revient à opérer une compression ou une dilatation du spectre initial d’où la version
plus grave ou plus aigüe du signal écouté.

```matlab
%-----------3----------
sound(y,2*Fs); %Donald Duck
sound(y,Fs/2); %Terminator
```

4- Tracez le signal en fonction des indices du vecteur x, puis essayez de repérer les
indices de début et de fin de la phrase « Rien ne sert de ».

```matlab
%-----------4----------
rien_ne_sert_de = y(5055:77249);
plot(rien_ne_sert_de);
title('Rien ne sert de');
```
![Rien_ne_plot](https://user-images.githubusercontent.com/80456274/151722854-f0219d9d-5db7-4a12-b72b-16052a355727.jpg)


5- Pour segmenter le premier mot, il faut par exemple créer un vecteur « riennesertde »
contenant les n premières valeurs du signal enregistré x qui correspondent à ce
morceau. Créez ce vecteur, puis écoutez le mot segmenté.

```matlab
%-----------5----------
rien_ne_sert_de = y(5055:77249);
sound(rien_ne_sert_de,Fs);
```

6- Segmentez cette fois-ci toute la phrase en créant les variables suivantes :
riennesertde, courir, ilfaut, partirapoint.

```matlab
%-----------6----------
rien_ne_sert_de = y(5055:77249);
partir_a_point  = y(121652:168300);
il_faut = y(95393:121652);
courir  = y(76613:95393);
```

7- Notez que le signal initial de parole est un vecteur colonne contenant un certain
nombre de valeurs (length(x)). Réarrangez ce vecteur pour écouter la phrase
synthétisée « Rien ne sert de partir à point, il faut courir ». 

```matlab
%-----------7----------
new_phrase =[rien_ne_sert_de,partir_a_point,il_faut,courir];
sound(new_phrase,Fs);
```


<p align="right">(<a href="#top">back to top</a>)</p>


# Synthèse-et-analyse-spectrale-d’une-gamme-de-musique
## Synthèse-d’une-gamme-de-musique

Les notes de musique produites par un piano peuvent être synthétisées
approximativement numériquement. En effet, chaque note peut être considérée
comme étant un son pur produit par un signal sinusoïdal. La fréquence de la note
« La » est par exemple de 440 Hz.

1- Créez un programme qui permet de jouer une gamme de musique. La fréquence
de chaque note est précisée dans le tableau ci-dessous. Chaque note aura une durée
de 1s. La durée de la gamme sera donc de 8s. La fréquence d’échantillonnage fe sera
fixée à 8192 Hz.

| Dol  | Ré  | Mi  | Fa  | Sol  | la  | Si  | Do2  |
|---|---|---|---|---|---|---|---|
| 262 Hz  | 294 Hz  | 330 Hz  | 349 Hz  | 392 Hz  | 440 Hz  | 494 Hz  | 523 Hz  |

```matlab
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
sound(doremifasol_solfamiredo,m_Fs);
```

<div align="center">
    <img src="images/dialog.png"/>
</div>

> An example of a dialog to get a new task.

<p align="right">(<a href="#top">back to top</a>)</p>




## Spectre-de-la-gamme-de-musique

2- Utilisez l’outil graphique d’analyse de signaux signalAnalyzer pour visualiser le
spectre de votre gamme. Observez les 8 fréquences contenues dans la gamme et
vérifiez leur valeur numérique à l’aide des curseurs.

```matlab
%-----------6----------
rien_ne_sert_de = y(5055:77249);
partir_a_point  = y(121652:168300);
il_faut = y(95393:121652);
courir  = y(76613:95393);
```

3- Tracez le spectrogramme qui permet de visualiser le contenu fréquentiel du signal
au cours du temps (comme le fait une partition de musique) mais la précision sur l’axe
des fréquences n’est pas suffisante pour relever précisément les 8 fréquences.

> Spectre doremifa

![spectre](https://user-images.githubusercontent.com/80456274/151722986-203dfa2e-a5ab-4d3b-b357-f24d5ff5afe7.jpg)


> spectrogramme doremifa

![spectrogramme](https://user-images.githubusercontent.com/80456274/151722991-539a8507-76c2-4414-9a86-0f847d271cc3.jpg)



<p align="right">(<a href="#top">back to top</a>)</p>

## Approximation-du-spectre-d’un-signal-sinusoïdal-à-temps-continu-par-FFT

4- Le spectre d’un signal à temps continu peut être approché par transformée de
Fourier discrète (TFD) ou sa version rapide (Fast Fourier Transform (FFT). Afficher le
spectre de fréquence de la gamme musicale crée en échelle linéaire, puis avec une
échelle en décibels. 

> S(dB) =20×log₁₀|S(f)|

```matlab
Sp=abs(fft(doremifa));
u=mag2db(Sp);
subplot(2,1,1);
fshift=(-length(doremifa)/2:length(doremifa)/2 -1 )*Fs/length(doremifa);
plot(fshift,fftshift(Sp));
title('signal(doremi) spectre');
subplot(2,1,2);
plot(fshift,fftshift(u));
title('signal(doremi) spectre shifted');
```

 ![Uploading 4_II.jpg…]()

 
 
 





Code matlab :

```matlab
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
```
 
 

<p align="right">(<a href="#top">back to top</a>)</p>



 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Our Team     : [AIT EL KADI Ilyas](https://github.com/IlyasKadi) - [AZIZ Oussama](https://github.com/ATAMAN0)  
 
   Project Link : [Rapport_TP1 : Traitement-de-signal](https://github.com/IlyasKadi/Rapport_TP1-Traitement-de-signal)   
 
  > Encadré par  : [Pr. AMMOUR Alae]()  
                                                                                             
<p align="right">(<a href="#top">back to top</a>)</p>
