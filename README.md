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

• Comprendre comment manipuler un signal audio avec Matlab, en effectuant
certaines opérations classiques sur un fichier audio d’une phrase enregistrée via
un smartphone.
• Comprendre la notion des sons purs à travers la synthèse et l’analyse spectrale
d’une gamme de musique.

**Commentaires** : Il est à remarquer que ce TP traite en principe des signaux continus.
Or, l'utilisation de Matlab suppose l'échantillonnage du signal. Il faudra donc être
vigilant par rapport aux différences de traitement entre le temps continu et le temps
discret.

**Tracé des figures** : toutes les figures devront être tracées avec les axes et les
légendes des axes appropriés.

**Travail demandé** : un script Matlab commenté contenant le travail réalisé et des
commentaires sur ce que vous avez compris et pas compris, ou sur ce qui vous a
semblé intéressant ou pas, bref tout commentaire pertinent sur le TP.


<p align="right">(<a href="#top">back to top</a>)</p>



# Synthèse-et-analyse-spectrale-d’une-gamme-de-musique

« phrase.wave » est un fichier audio enregistré à l’aide d’un smartphone, en
prononçant lentement la phrase :

   > **« Rien ne sert de courir, il faut partir à point ».**
1- Sauvegardez ce fichier sur votre répertoire de travail, puis charger-le dans MATLAB
à l’aide de la commande « **audioread** ».

2- Tracez le signal enregistré en fonction du temps, puis écoutez-le en utilisant la
commande « **sound** ».

3- Cette commande permet d’écouter la phrase à sa fréquence d’échantillonnage
d’enregistrement. Ecoutez la phrase en modifiant la fréquence d’échantillonnage à
double ou deux fois plus petite pour vous faire parler comme « Terminator » ou «
Donald Duck ». En effet, modifier la fréquence d’échantillonnage revient à appliquer
un changement d’échelle y(t) = x(at) en fonction de la valeur du facteur d’échelle, cela
revient à opérer une compression ou une dilatation du spectre initial d’où la version
plus grave ou plus aigüe du signal écouté.

4- Tracez le signal en fonction des indices du vecteur x, puis essayez de repérer les
indices de début et de fin de la phrase « Rien ne sert de ».


5- Pour segmenter le premier mot, il faut par exemple créer un vecteur « riennesertde »
contenant les n premières valeurs du signal enregistré x qui correspondent à ce
morceau. Créez ce vecteur, puis écoutez le mot segmenté.

6- Segmentez cette fois-ci toute la phrase en créant les variables suivantes :
riennesertde, courir, ilfaut, partirapoint.

7- Notez que le signal initial de parole est un vecteur colonne contenant un certain
nombre de valeurs (length(x)). Réarrangez ce vecteur pour écouter la phrase
synthétisée « Rien ne sert de partir à point, il faut courir ». 







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

<div align="center">
    <img src="images/dialog.png"/>
</div>

> An example of a dialog to get a new task.

<p align="right">(<a href="#top">back to top</a>)</p>




## Spectre-de-la-gamme-de-musique

Rappel : Une aide en ligne de toutes les fonctions Matlab sont disponibles grâce à la
commande : help nom_de_function





<p align="right">(<a href="#top">back to top</a>)</p>

## Approximation-du-spectre-d’un-signal-sinusoïdal-à-temps-continu-par-FFT


<p align="right">(<a href="#top">back to top</a>)</p>



 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Our Team     : [AIT EL KADI Ilyas](https://github.com/IlyasKadi) - [AZIZ Oussama](https://github.com/ATAMAN0)  
 
   Project Link : [Rapport_TP1 : Traitement-de-signal](https://github.com/IlyasKadi/Rapport_TP1-Traitement-de-signal)   
 
  > Encadré par  : [Pr. AMMOUR Alae]()  
                                                                                             
<p align="right">(<a href="#top">back to top</a>)</p>
