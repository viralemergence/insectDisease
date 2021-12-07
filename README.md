### *insectDisease*: insect disease data from the Ecological Database of the World's Insect Pathogens

[![R build status](https://github.com/viralemergence/insectDisease/workflows/R-CMD-check/badge.svg)](https://github.com/viralemergence/insectDisease/actions)


This is a database of known pathogens of many species of insects and other arthropods. This database was designed by David Onstad, and first described in Braxton et al (2003). The database is somewhat unique in that in addition to host-parasite associations that occur in nature, it also contains some true host absences: records of instances where a given host species was inoculated with a pathogen and found not to be susceptible to it. This database also contains a large amount of ecological data on hosts and parasites. Here, we document and preserve these data as an R package, also providing csv flatfiles in the `csv` folder and an [interactive web platform](https://edwip.ecology.uga.edu/download)


### Install

Install from GitHub using the code below. 


```r

# install.packages("devtools")
devtools::install_github("viralemergence/insectDisease")
library("insectDisease")

```






### vignette

The raw data can be called using the `data()` function on the various files within the `R` folder. In the `vignette` folder, there is some code that cleans, processes, and taxononymizes the data.








*When using this database, cite this reference*

> Braxton, S. M., et al. "Description and analysis of two internet-based databases of insect pathogens: EDWIP and VIDIL." Journal of Invertebrate Pathology 83.3 (2003): 185-195.


Also, this database was originally created by the following people, to whom we are indebted:

David W. Onstad, EDWIP Director.
Center for Economic Entomology, Illinois Natural History Survey

Ellen Brewer, Research Programmer
Center for Economic Entomology, Illinois Natural History Survey
 
Susan Braxton, Science & Technology Librarian
Milner Library, Illinois State University



---

This work has been supported by funding to the Viral Emergence Research Initiative (VERENA) consortium, including a grant from the U.S. National Science Foundation (NSF-BII-2021909) and a grant from Institut de Valorisation des Données (IVADO).

This study is supported by the U.S. National Science Foundation Research Coordination Network (NSF/NIH/USDA DEB 131223).
