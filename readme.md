# The model :

The script comes from this research article, currently in preprint:

Daniel Eliahou Ontiveros, Gregory Beaugrand, Bertrand Lefebvre, Chloe Markussen Marcilly, Thomas Servais, Alexandre Pohl (in revision)
Cooling Oceans Did Trigger Ordovician Biodiversification.

## Requirements

The code needs at least MATLAB 2020 a. to be active. The Mapping Toolbox is needed to produce the maps currently presented in the manuscript, although it is still possible to produce some maps with the base functions.

## Introduction

We couple an ocean-atmosphere general circulation model with a macroecological model validated in the Modern to quantify the response of marine biodiversity to the well-documented long-term Ordovician cooling trend.

An in depth explanation of the paleoclimatic model is available here:
https://paleoclim-cnrs.github.io/documentation-model/FOAM/


The main code is found on "main.mat, and produces the four main figures : 
- the biodiversity curve
- the biodiversity maps
- the Latitudinal Gradient
- the Regional Curves

It is possible to chose some of the inputs, such as the paleoclimatic scenario used (Song or Goldberg),
to account the seasonality, to display the results of a detrended paleoclimatic scenario (at 12 PAL).

The code also compares our simulated diversity to fossil brachiopods in the paleocontinents of Laurentia, Baltica,
Sibera and South China.

### The code :

The first 4 steps of the code will format the .ncdf files in order to get exploitable matrices.

The 5th step creates the niches (rectangular niches).


