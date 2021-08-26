#' Detailed information on insect host species
#'
#' 
#' Data on host species taxonomy, habitat, diet preferences, and distribution (in Canada)
#' 
#' 
#'
#' \itemize{
#'   \item RecordNo. Sequence from 1:nrow(hosts)
#'   \item DateEntered. Date of initial data entry
#'   \item Habitat. Habitat of host
#'   \item HostSpecies. Host species
#'   \item HostOrder. Host order
#'   \item HostFamily. Host family
#'   \item Synonyms. Other names for the host species
#'   \item Food. What does the host eat?
#'   \item genYr. Number of generations per year. Can be <1, =1, >1, or some combination of these.
#'   \item CommonName. Host common name
#'   \item ProvinceI. Canadian provinces where host has been found.
#'   \item InsectStatus. Is the insect a pest, beneficial, endangered, unknown? Factor variable with
#'     7 unique values
#'   \item ModificationDate. Modification date of entry
#'   \item InCanada. Citations for presence/absence of host in Canada. Numeric indices can be
#'     related to the citations in the `citations.rda` data file. `Y` and `N` relate to presence and
#'     absence, respectively.
#'   \item ChangeSpeciesTo. 
#'   \item CommonNameOther. Other common names?
#'   \item Complete. Is this record complete?
#'   \item AdditionalReferences. Additional reference indices. 
#'   \item HostTaxID. Host NCBI ID number
#'   \item HostGenus. Host genus
#'   \item HostFamily. Host family
#'   \item HostOrder. Host order
#'   \item HostClass. Host class
#'  }
#'
#' @docType data
#' @keywords datasets
#' @name hosts
#' @usage data(hosts)
#' @format A data.frame with 4392 observations of 18 variables



"hosts"
