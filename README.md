### *insectDisease*: insect disease data from the USDA's Ecological Database of the World's Insect Pathogens

[![R build status](https://github.com/viralemergence/insectDisease/workflows/R-CMD-check/badge.svg)](https://github.com/viralemergence/insectDisease/actions)





David Onstad from the USDA provided us with this USDA-gathered insect disease database, sometimes referred to as the "Ecological Database of the World's Insect Pathogens" or EDWIP. Files have been converted from SQL to csv, and ported into R for easy exploration and analysis. 




### Install

Install from GitHub using the code below. 


```r

# install.packages("devtools")
devtools::install_github("viralemergence/insectDisease")
library("insectDisease")

```






### vignette

The raw data can be called using the `data()` function on the various files within the `R` folder. In the `vignette` folder, there is some code that cleans, processes, and taxononymizes the data.






---

This work has been supported by funding to the Viral Emergence Research Initiative (VERENA) consortium, including a grant from the U.S. National Science Foundation (NSF-BII-2021909) and a grant from Institut de Valorisation des Données (IVADO).

This study is supported by the U.S. National Science Foundation Research Coordination Network (NSF/NIH/USDA DEB 131223).
