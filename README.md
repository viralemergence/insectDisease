### *insectDisease*: insect disease data from the USDA packaged as an R package

David Onstad from the USDA provided us with this USDA-gathered insect disease database, sometimes referred to as the "Ecological Database of the World's Insect Pathogens" or EDWIP. Files have been converted from SQL to csv, and ported into R for easy exploration and analysis. Thanks to the Macroecology of Infectious Disease RCN for funding and support.


### Install

Install from GitHub using the code below. 

```r

# install.packages("devtools")
devtools::install_github("viralemergence/insectDisease")
library("insectDisease")
```





### vignettes

The raw data can be called using the `data()` function on the various files within the `R` folder. In the `vignette` folder, there is some code that processes the data and organizes it as an edgelist for the three groups of parasites present in the data; protozoans, nematodes, and viruses. 



