# insectDisease

[![R build status](https://github.com/viralemergence/insectDisease/workflows/R-CMD-check/badge.svg)](https://github.com/viralemergence/insectDisease/actions)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5821896.svg)](https://doi.org/10.5281/zenodo.5821896)

### insectDisease: Programmatically access insect disease data from the Ecological Database of the World's Insect Pathogens (EDWIP)

See preprint ([available here](https://ecoevorxiv.org/yd3x5/))

This is a database of known pathogens of many species of insects and other arthropods. This database was designed by David Onstad, and first described in Braxton et al (2003). The database is unique in that in addition to host-parasite associations that occur in nature, it also contains some true host absences: records of instances where a given host species was inoculated with a pathogen and found not to be susceptible to it. This database also contains a large amount of ecological data on hosts and parasites. Here, we document and preserve these data as an R package, also providing csv flatfiles in the `csv` folder. EDWIP data can also be downloaded from an [interactive web platform](https://edwip.ecology.uga.edu/download)

Data are available programmatically through R or can be downloaded from the `csv` folder and used outside of R. The data consist of a set of files that maintain the original structure of the EDWIP data resource, with the main files serving to detail the interactions between insect hosts and nematode (`?nematode` or `csv/nematode.csv`), viral ((`?viruses` or `csv/viruses.csv`) and non-viral pathogens such as bacteria and protozoans (`?nvpassoc` or `csv/nvpassoc.csv`). There are also data on negative associations, which are failed inoculation attempts (`?negative` or `csv/negative.csv`) and represent "true zeros", which are rare data. Other information on citations (`assocref`, `citation`, `viraref` and `noassref`) are provided as well as host (`hosts`) and pathogne (`pathogen`) trait data. Cached versions of host and pathogen taxonomy are also included (`hostTaxonomy` and `pathTaxonomy`) and will be updated (along with the taxonomic information within each data product) with every release of the data. 

---

## The Data

  
### hosts

|  column name | description |
|  --------    |  --------------- |
|   RecordNo | Sequence from 1:nrow(hosts)  | 
|   DateEntered| Date of initial data entry  | 
|   Habitat| Habitat of host  | 
|   HostSpecies| Host species  | 
|   Synonyms| Other names for the host species  | 
|   Food| What does the host eat?  | 
|   genYr| Number of generations per year| Can be <1, =1, >1, or some combination of these   | 
|   CommonName| Host common name   | 
|   ProvinceI| Canadian provinces where host has been found.  | 
|   InsectStatus| Is the insect a pest, beneficial, endangered, unknown? Factor variable with 7 unique values  | 
|  ModificationDate| Modification date of entry  | 
|  InCanada| Citations for presence/absence of host in Canada. Numeric indices can be     related to the citations in the `citations.rda` data file. `Y` and `N` relate to presence and absence, respectively.  | 
|  ChangeSpeciesTo| Taxonomic verification column  | 
|  CommonNameOther| Other common names?  | 
|  Complete| Is this record complete?  | 
|  AdditionalReferences| Additional reference indices.   | 
|  HostTaxID| Host NCBI ID number  | 
|  HostGenus| Host genus  | 
|  HostFamily| Host family  | 
|  HostOrder| Host order  | 
|  HostClass| Host class  | 
  


### pathogen

|  column name | description |
|  --------    |  --------------- |
| PathogenSpecies | Pathogen species.
| Group | Pathogen group (e.g. Protozoa)|
| AdditionalNotes | Some additional notes |
| PathTaxID || Pathogen NCBI ID number|
| PathGenus | Pathogen genus|
| PathFamily| Pathogen family|
| PathOrder | Pathogen order|
| PathClass | Pathogen class|
| PathKingdom | Pathogen kingdom |





--- 
  
### getNCBI

Function to get taxonomic information for host and parasite species 


### hostTaxonomy

created with getNCBI, so can be regenerated if/when new data are added. 

|  column name | description |
|  --------    |  --------------- |
|   HostSpecies | original host name from EDWIP   |
|   HostTaxID   | NCBI taxonomic ID  |
|   HostGenus   | Host genus  |
|   HostFamily  | Host family  |
|   HostOrder   | Host order  |
|   HostClass   | Host class  |



### pathTaxonomy

created with getNCBI, so can be regenerated if/when new data are added. 


|  column name | description |
|  --------    |  --------------- |
|   PathogenSpecies| Pathogen species    |
|   PathTaxID | NCBI taxonomic ID  |
|   PathNCBIResolved |  is the pathogen found in NCBI   |
|   PathGenus |  Pathogen genus  |
|   PathFamily|  Pathogen family  |
|   PathOrder |  Pathogen order  |
|   PathClass  |  Pathogen class  |
|   PathKingdom  |  Pathogen kingdom  |





---

### negative

|  column name | description |
|  --------    |  --------------- |
|   ERNntr| EDWIP record number    |
|   PathogenSpecies| Pathogen species    |
|   DateEntered| Date of initial data entry    |
|   DateModified| Modification date of entry    |
|   LogMaxDose| Dosage, in many different units    |
|   HostStageTested| Host stage exposed to pathogen (e.g. Larvae, Nymph, Adult)    |
|   HostSpecies| Host species examined    |
|   Group| Pathogen group (e.g. viruses)     |
|   HighTaxon| General classification of pathogen (e.g. DNA virus)    |
|   LowTaxon| More specific classification of pathogen (e.g. Baculoviridae)    |
|   HostTaxID| Host NCBI ID number    |
|   HostGenus| Host genus    |
|   HostFamily| Host family    |
|   HostOrder| Host order    |
|   HostClass| Host class    |
|   PathTaxID| Pathogen NCBI ID number    |
|   PathGenus| Pathogen genus    |
|   PathFamily| Pathogen family    |
|   PathOrder| Pathogen order    |
|   PathClass| Pathogen class    |
|   PathKingdom| Pathogen kingdom    |




---
### nemaref

|  column name | description |
|  --------    |  --------------- |
|   ERNnem| EDWIP record number  |
|   refCode| Index of reference obtained from `nematode` data frame  |
|   Reference| Citation for host-nematode record  |
|   HostSpecies| Host species  |
|   PathogenSpecies| Nematode parasite species  |
|   HostTaxID| Host NCBI ID number  |
|   HostGenus| Host genus  |
|   HostFamily| Host family  |
|   HostOrder| Host order  |
|   HostClass| Host class  |
|   PathTaxID| Pathogen NCBI ID number  |
|   PathGenus| Pathogen genus  |
|   PathFamily| Pathogen family  |
|   PathOrder| Pathogen order  |
|   PathClass| Pathogen class  |
|   PathKingdom| Pathogen kingdom  |


### nematode

|  column name | description |
|  --------    |  --------------- |
|   ERNnem |   EDWIP record identifier |
|   HostSpecies| Host species |
|   PathogenSpecies| Nematode parasite species |
|   PathogenStrain| Nematode parasite strain |
|   StageInfected| Host stage infected |
|   TissueInfected| Host tissue infected |
|   FieldOrLab| Was this a field or lab tested association? |
|   Country| What country did the interaction occur in? |
|   SoilType| Type of soil where interaction was observed |
|   AssociatedBacterium| Associated bacterium| |
|   IntermediateHost| Is there an intermediate host present?   |
|   CreationDate| Date of initial data entry |
|   ModificationDate| Modification date of entry |
|   HostTaxID| Host NCBI ID number |
|   HostGenus| Host genus |
|   HostFamily| Host family |
|   HostOrder| Host order |
|   HostClass| Host class |
|   PathTaxID| Pathogen NCBI ID number |
|   PathGenus| Pathogen genus |
|   PathFamily| Pathogen family |
|   PathOrder| Pathogen order |
|   PathClass| Pathogen class |
|   PathKingdom| Pathogen kingdom |




### citation 

Edgelist of known associations between insect host (`Host`) and pathogen (`Pathogen`), and
associated references and indexing values. These data are smaller than assocref, which provides
more data on host-parasite interactions. CreationDate and ModificationDate are incorrect.

|  column name | description |
|  --------    |  --------------- |
|   CitationCode| Citation code |
|   Reference| Actual citation |
|   CreationDate| Record creation date |
|   ModificationDate| Record modification date |
|   ReadBy |     Comments about the reading and identity of reader | 
|   GetIt |  Notes on article acquisition   |
|   nvpCount |  Number of pathogens reported in the citation  |













---

We believe `assocref` are links and citations for `nvpassoc`, but there are around 3k more rows of data for assocref. However, `nvpassoc` has more unique host-pathogen association data, so the `assocref` data may provide multiple citations for the same interaction. 

### assocref

|  column name | description |
|  --------    |  --------------- |
|   ERNnvp| EDWIP record number  |
|   refCode| Reference code |
|   Reference| Actual citation|
|   HostSpecies| Host species|
|   PathogenSpecies| Pathogen species|
|   HostTaxID| Host NCBI ID number|
|   HostGenus| Host genus|
|   HostFamily| Host family|
|   HostOrder| Host order|
|   HostClass| Host class|
|   PathTaxID| Pathogen NCBI ID number|
|   PathGenus| Pathogen genus|
|   PathFamily| Pathogen family|
|   PathOrder| Pathogen order|
|   PathClass| Pathogen class|
|   PathKingdom| Pathogen kingdom|
  
  
### nvpassoc

|  column name | description |
|  --------    |  --------------- |
|   ERNnvp| EDWIP record number |
|   PathogenSpecies| Pathogen species |
|   Group| Pathogen group (e.g. Protozoa) |
|   HostSpecies| Host species examined |
|   HostStageTested| Host stage exposed to pathogen (e.g. Larvae, Nymph, Adult)|
|   HostTissueInfected| Host tissue infected |
|   FieldOrLab| Was this a field or lab tested association? |
|   Country| What country did the interaction occur in? |
|   IntermediateHost| Is there an intermediate host present? |
|   DateEntered| Date of initial data entry |
|   DateModified| Modification date of entry |
|   BiogeographicRegion| Biogeographic region (or some combination thereof) |
|   HostTaxID| Host NCBI ID number |
|   HostGenus| Host genus |
|   HostFamily| Host family |
|   HostOrder| Host order |
|   HostClass| Host class |
|   PathTaxID| Pathogen NCBI ID number |
|   PathGenus| Pathogen genus |
|   PathFamily| Pathogen family |
|   PathOrder| Pathogen order |
|   PathClass| Pathogen class |
|   PathKingdom| Pathogen kingdom |






---

### viraref

|  column name | description |
|  --------    |  --------------- |
|   RefCode| Index of reference obtained from `nematode` data frame |
|   Citation| Reference|
|   ERNv| EDWIP record number  |
|   HostSpecies| Host species |
|   PathogenSpecies| Virus name |
|   HostTaxID| Host NCBI ID number |
|   HostGenus| Host genus |
|   HostFamily| Host family |
|   HostOrder| Host order |
|   HostClass| Host class |
|   PathTaxID| Pathogen NCBI ID number |
|   PathGenus| Pathogen genus |
|   PathFamily| Pathogen family |
|   PathOrder| Pathogen order |
|   PathClass| Pathogen class |
|   PathKingdom| Pathogen kingdom |
  
  
  
  
### viruses

|  column name | description |
|  --------    |  --------------- |
|   ERNv| EDWIP record number|
|   HostSpecies| Host species|
|   VirusType| DNA or RNA virus|
|   PathogenSpecies| Viral family |
|   Virus| Virus identity|
|   HostStageInfected| Host stage infected|
|   HostTissueInfected| Host tissue infected|
|   FieldOrLab| Was this a field or lab tested association?|
|   Country| What country did the interaction occur in?|
|   IntermediateHost| Is there an intermediate host present?|
|   CreationDate| Date of initial data entry (wrong)|
|   ModificationDate| Modification date of entry (wrong)|
|   ProvinceA| Canadian provinces where host-virus interaction occurs|
|   PathogenValue| Is there value to the pathogen (can it be used as a control agent?)|
|   Group| Viruses|
|   HostTaxID| Host NCBI ID number|
|   HostGenus| Host genus|
|   HostFamily| Host family|
|   HostOrder| Host order|
|   HostClass| Host class|
|   PathTaxID| Pathogen NCBI ID number|
|   PathGenus| Pathogen genus|
|   PathFamily| Pathogen family|
|   PathOrder| Pathogen order|
|   PathClass| Pathogen class|
|   PathKingdom| Pathogen kingdom |
  
  
  
  




--- 

### noassref
These data are included because they were originally part of the EDWIP data. 
We caution the user in using these data, as they do not have associated 
metadata that the other records have.

|  column name | description |
|  --------    |  --------------- |
|   RefCode| Index of reference  |
|   ERNntr| EDWIP record number |
|   HostSpecies| Host species |
|   PathogenSpecies| Virus name |
|   Citation| Citation for host-pathogen record |
|   HostTaxID| Host NCBI ID number |
|   HostGenus| Host genus |
|   HostFamily| Host family |
|   HostOrder| Host order |
|   HostClass| Host class |
|   PathTaxID| Pathogen NCBI ID number |
|   PathGenus| Pathogen genus |
|   PathFamily| Pathogen family |
|   PathOrder| Pathogen order |
|   PathClass| Pathogen class |
|   PathKingdom| Pathogen kingdom |


  
  
### new_asso
These data are included because they were originally part of the EDWIP data. 
We caution the user to not use these data, as we do not believe the records 
are correct.


|  column name | description |
|  --------    |  --------------- |
|   ERNnew   | EDWIP record number |
|   HostSpecies   | Host species | 
|   HostOrder   | Host order | 
|   HostFamily | Host family |
|   HostHabitat | Habitat type of host | 
|   HostFood | What does the host eat? | 
|   HostGenYr | Number of generations of hosts per year |
|   PathSpecies | Nematode species | 
|   PathGroup | Pathogen group (fungi, protozoa, nematode, etc.) |
|   PathHighTaxon | Pathogen taxonomic information (mostly `NA`) | 
|   PathLowTaxon | Pathogen taxonomic information (mostly `NA`) | 
|   StageInf | Host life stage infected |
|   TissueInfected | Host tissue infected |
|   Field | Was this a field or lab tested association? |
|   Country | Country of host-pathogen association |
|   IntermediateHost |  Information on intermediate hosts |
|   Citation| Citation for host-pathogen record |
|   MoreInfo | Additional comments or notes | 
|   Who | Identity of researcher who entered data | 
|   CreationDate| Record creation date |
|   ModificationDate| Record modification date |
|   StainFCB | takes values: Adult, egg, larvae, pupa   |









### newnema

These data are identical to the `nematode` data, as far as we can tell.

|  column name | description |
|  --------    |  --------------- |
| ERNnem |   EDWIP record identifier |
| Host| Host species |
| Nematode | Nematode parasite species |
| NemaOrder | Pathogen order |
| NemaFamily | Pathogen family |
| NemaStrain  | Pathogen strain |
| StageInfected  | Host stage infected | 
| TissueInfected  | Host tissue infected |
| FieldOrLab  |Was this a field or lab tested association? |
| Country| What country did the interaction occur in? |
| SoilType| Type of soil where interaction was observed |
| AssociatedBacterium| Associated bacterium| |
| IntermediateHost| Is there an intermediate host present?   |
| CreationDate| Date of initial data entry |
| ModificationDate| Modification date of entry |
| Group | all just say 'nematode' | 








---

### Install

Install from GitHub using the code below. 


```{r}

# install.packages("devtools")
devtools::install_github("viralemergence/insectDisease")
library("insectDisease")

```






### vignette

The raw data can be called using the `data()` function on the various files within the `R` folder. In the `vignette` folder, there is some code that cleans, processes, and taxononymizes the data.








*When using this database, cite this reference*

> Braxton, S. M., et al. "Description and analysis of two internet-based databases of insect pathogens: EDWIP and VIDIL." Journal of Invertebrate Pathology 83.3 (2003): 185-195.


Also, this database was originally created by the following people, to whom we are indebted:

+ David W. Onstad, EDWIP Director. Center for Economic Entomology, Illinois Natural History Survey

+ Ellen Brewer, Research Programmer. Center for Economic Entomology, Illinois Natural History Survey

+ Susan Braxton, Science & Technology Librarian. Milner Library, Illinois State University



### Contribute!

Feel free to fork it and contribute some functionality.  





### Funding
This work has been supported by funding to the Viral Emergence Research Initiative (VERENA) consortium, including a grant from the U.S. National Science Foundation (NSF-BII-2021909) and a grant from Institut de Valorisation des Données (IVADO).

This study is supported by the U.S. National Science Foundation Research Coordination Network (NSF/NIH/USDA DEB 131223).



---

### Meta

* Please [report any issues or bugs](https://github.com/viralemergence/insectDisease/issues).
* License: GPL-3
* Get citation information for `insectDisease` in R doing `citation(package = 'insectDisease')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md).
By participating in this project you agree to abide by its terms.