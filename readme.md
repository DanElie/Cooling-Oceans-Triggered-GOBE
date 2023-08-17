## The model

This Matlab code is associated with this research article, currently in revision:

Daniel Eliahou Ontiveros, Gregory Beaugrand, Bertrand Lefebvre, Chloe Markussen Marcilly, Thomas Servais, Alexandre Pohl (in revision)

Impact of global climate cooling on Ordovician marine biodiversity.

## Requirements

The code needs at least MATLAB 2020a to run. The ‘Mapping Toolbox’ is needed to produce the maps currently presented in the manuscript, although it is still possible to produce simpler maps with the base functions. The ‘Statistics and Machine Learning Toolbox’ is needed to produce the regional biodiversity curves.

It takes between 30 minutes and 1 hour to complete the code on a laptop, using 100 niches.

## Introduction

We couple an ocean-atmosphere general circulation model with a macroecological model validated in the Modern to quantify the response of marine biodiversity to the well-documented long-term Ordovician cooling trend.

## Main

The main code is found in "main.mat” and produces the four main figures:

- the global biodiversity curve;

- the biodiversity maps;

- the latitudinal gradient;

- the regional curves.

It is possible to choose some of the inputs, such as the paleoclimatic scenario used (after Song et al. (2019), Goldberg et al. (2021) or Grossman and Joachimski (2022)), to account for seasonality, and to display the results for a detrended paleoclimatic scenario (at 12 PAL).

The code also compares our simulated diversity to fossil brachiopod diversity for the paleocontinents Laurentia, Baltica, Siberia and South China.

### The code

The first 4 steps of the code format the NetCDF files in order to get exploitable matrices. There are three different temperature scenarios available. You can specify the one you prefer in "My inputs", that you see in the "main.m" script. For this, you just need to change the parameter “scenario_Song”.

The 5th step creates the (rectangular) niches.

The 6th step is the main model, and the pseudo-species settle where their thermal tolerance allows them to settle.

The steps afterwards produce the figures, such as the biodiversity curve:

![GlobalCurve_Song](https://github.com/DanElie/Cooling-Oceans-Triggered-GOBE/assets/114865367/762b6f41-b578-490d-96a4-3dbbc2a78d3b)
It is the curve produced with the Song paleoclimatic scenario

Finally, the 10th step produces the regional biodiversity curves, from Baltica, Laurentia, Siberia and South China.
