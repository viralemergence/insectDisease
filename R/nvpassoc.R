#' Information on non-viral pathogens of insect hosts
#'
#' 
#' Non-viral parasite (protozoan, fungi, bacteria) occurrences on host species. The variables are 
#' as follows: 
#' 
#' 
#' \itemize{
#'   \item ERNnvp. EDWIP record number
#'   \item Pathogen. Pathogen species
#'   \item Group. Pathogen group (e.g. Protozoa)
#'   \item HighTaxon. General classification of pathogen (e.g. Microspora)
#'   \item LowTaxon. More specific classification of pathogen (e.g. Microsporea)
#'   \item Host. Host species examined
#'   \item Order. Host taxonomic order.
#'   \item Family. Host taxonomic family.
#'   \item HostStageTested. Host stage exposed to pathogen (e.g. Larvae, Nymph, Adult)
#'   \item HostTissueInfected. Host tissue infected
#'   \item FieldOrLab. Was this a field or lab tested association?
#'   \item Country. What country did the interaction occur in?
#'   \item IntermediateHost. Is there an intermediate host present?
#'   \item DateEntered. Date of initial data entry
#'   \item DateModified. Modification date of entry
#'   \item BiogeographicRegion. Biogeographic region (or some combination thereof)
#'  }
#'
#' @docType data
#' @keywords datasets
#' @name nvpassoc
#' @usage data(nvpassoc)
#' @format A data.frame with 7164 observations of 16 variables

"nvpassoc"
