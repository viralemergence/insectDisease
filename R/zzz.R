#' new_asso
#'
#' These data are included because they were originally part of the EDWIP data. 
#' We caution the user to not use these data, as we do not believe the records 
#' are correct. 
#' 
#' \itemize{
#' \item ERNnew. EDWIP record number
#' \item    HostSpecies. Host species  
#' \item    HostOrder. Host order  
#' \item    HostFamily. Host family 
#' \item    HostHabitat. Habitat type of host 
#' \item    HostFood. What does the host eat? 
#' \item    HostGenYr. Number of generations of hosts per year
#' \item    PathSpecies. Nematode species 
#' \item    PathGroup. Pathogen group (fungi, protozoa, nematode, etc.) 
#' \item    PathHighTaxon. Pathogen taxonomic information (mostly `NA`)  
#' \item    PathLowTaxon. Pathogen taxonomic information (mostly `NA`) 
#' \item    StageInf. Host life stage infected 
#' \item    TissueInfected. Host tissue infected 
#' \item    Field. Was this a field or lab tested association? 
#' \item    Country. Country of host-pathogen association 
#' \item    IntermediateHost .  Information on intermediate hosts 
#' \item    Citation. Citation for host-pathogen record 
#' \item    MoreInfo. Additional comments or notes  
#' \item    Who. Identity of researcher who entered data 
#' \item    CreationDate. Record creation date 
#' \item    ModificationDate. Record modification date 
#' \item    StainFCB . takes values: Adult, egg, larvae, pupa   
#'  }
#'
#' @docType data
#' @keywords datasets
#' @name new_asso
#' @usage data(new_asso)
#' @format A data.frame of not good records

"new_asso"


#' newnema
#'
#' These data are included because they were originally part of the EDWIP data. 
#' These data are identical to the `nematode` data, as far as we can tell.
#' 
#'
#' \itemize{
#' \item ERNnem .   EDWIP record identifier
#' \item  Host. Host species
#' \item  Nematode. Nematode parasite species
#' \item  NemaOrder. Pathogen order
#' \item  NemaFamily. Pathogen family 
#' \item  NemaStrain. Pathogen strain 
#' \item  StageInfected. Host stage infected 
#' \item  TissueInfected. Host tissue infected 
#' \item  FieldOrLab. Was this a field or lab tested association? 
#' \item  Country. What country did the interaction occur in? 
#' \item  SoilType. Type of soil where interaction was observed 
#' \item  AssociatedBacterium. Associated bacterium
#' \item  IntermediateHost. Is there an intermediate host present? 
#' \item  CreationDate. Date of initial data entry
#' \item  ModificationDate. Modification date of entry 
#' \item  Group. all just say 'nematode'  
#'  }
#'
#' @docType data
#' @keywords datasets
#' @name new_asso
#' @usage data(newnema)
#' @format A data.frame 

"newnema"



#' noassref
#'
#' These data are included because they were originally part of the EDWIP data. 
#' We caution the user in using these data, as they do not have associated 
#' metadata that the other records have.
#'
#' \itemize{
#'   \item RefCode. Index of reference 
#'   \item ERNntr. EDWIP record number
#'   \item HostSpecies. Host species
#'   \item PathogenSpecies. Pathogen species
#'   \item Citation. Citation for host-pathogen record
#'   \item HostTaxID. Host NCBI ID number 
#'   \item HostGenus. Host genus 
#'   \item HostFamily. Host family 
#'   \item HostOrder. Host order 
#'   \item HostClass. Host class 
#'   \item PathTaxID. Pathogen NCBI ID number 
#'   \item PathGenus. Pathogen genus 
#'   \item PathFamily. Pathogen family 
#'   \item PathOrder. Pathogen order 
#'   \item PathClass. Pathogen class 
#'   \item PathKingdom. Pathogen kingdom 
#'  }
#'
#' @docType data
#' @keywords datasets
#' @name noassref
#' @usage data(noassref)
#' @format A data.frame 


"noassref"

