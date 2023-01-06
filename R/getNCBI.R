#' Get NCBI taxonomy data
#'
#' Process through a vector of species names to obtain taxonomic data
#' 
#' @param species a vector of species names
#' @param host (boolean) affects column naming (nice to keep host and pathogen separate)
#'
#' @return a data.frame with nrow == length(species) 
#' @name getNCBI
#' @examples
#'  \dontrun{
#'   mouse <- getNCBI("Peromyscus leucopus")
#'   worm  <- getNCBI("Ascaris lumbricoides", host=FALSE)
#'  }
#' @importFrom taxize classification get_uid
#' @importFrom stats na.omit 
#' @importFrom utils tail
#' @importFrom plyr mutate
#' @export


getNCBI <- function(species, host=TRUE){ 

  mutate_cond <- function(.data, condition, ..., envir = parent.frame()) {
    condition <- eval(substitute(condition), .data, envir)
    .data[condition, ] <- plyr::mutate(.data[condition, ], ...)
    .data
  }
  names.orig <- species
  species <- gsub(" cf\\.","", species)
  species <- gsub(" sp\\.","", species)
  species <- gsub(" gen\\.","",species)
  u <- try(taxize::get_uid(species, 
    rank_filter = c("subspecies", "species", "genus", "family", "order", "class"), 
      ask = FALSE))
  if(inherits(u, 'try-error')){
    stop('NCBI resource is unavailable. Try again later.')
  }
  cc <- try(taxize::classification(u, batch_size=50, max_tries=500))
  if(inherits(cc, 'try-error')){
    stop('NCBI resource is unavailable. Try again later.')
  }
  n <- !is.na(u)
  attributes(u) <- NULL
  s <- unlist(lapply(cc, function(x){tryCatch(x$name[[which(x$rank=="species")]], error = function(e) {NA})}), use.names = FALSE)
  g <- unlist(lapply(cc, function(x){tryCatch(x$name[[which(x$rank=="genus")]], error = function(e) {NA})}), use.names = FALSE)
  f <- unlist(lapply(cc, function(x){tryCatch(x$name[[which(x$rank=="family")]], error = function(e) {NA})}), use.names = FALSE)
  o <- unlist(lapply(cc, function(x){tryCatch(x$name[[which(x$rank=="order")]], error = function(e) {NA})}), use.names = FALSE)
  c2 <- unlist(lapply(cc, function(x){tryCatch(x$name[[which(x$rank=="class")]], error = function(e) {NA})}), use.names = FALSE)
  k <- unlist(lapply(cc, function(x){tryCatch(x$name[[which(x$rank=="kingdom")]], error = function(e) {NA})}), use.names = FALSE)  
  levels <- c("species", "genus", "family", "order", "class")
  u <- unlist(lapply(cc, function(x){
    tryCatch(tail(na.omit(x[x$rank %in% levels,'id']),1), 
      error = function(e) {NA})}), use.names = FALSE)
  
  if(host){  
    ret <- data.frame(
      HostSpecies = names.orig,
      HostTaxID = u,
      HostGenus = g,
      HostFamily = f,
      HostOrder = o, 
      HostClass = c2) 
    ret$Host <- NULL
  }
  if(host==FALSE){
    ret <- data.frame(
      PathogenSpecies=names.orig, 
      PathTaxID = u,
      PathGenus = g,
      PathFamily = f,
      PathOrder = o, 
      PathClass = c2,
      PathKingdom= k) 
  }
  return(ret)
}

