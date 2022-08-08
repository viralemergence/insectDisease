#' Citation information for host-virus interactions
#'
#' Edgelist of known associations between insect host (`Host`) and viral pathogen (`Virus`),
#' and associated references and indexing values. These data are smaller than `assocref`, and
#' `citation`. The variables are as follows:
#'
#' \itemize{
#'   \item RefCode. Index of reference obtained from `nematode` data frame
#'   \item Citation. Reference.
#'   \item ERNv. EDWIP record number
#'   \item HostSpecies. Host species
#'   \item PathogenSpecies. Virus name
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
#' @name viraref
#' @usage data(viraref)
#' @format A data.frame with 2124 observations 

"viraref"
