#' Get NCBI taxonomy data
#'
#' Process through a vector of species names to obtain taxonomic data
#' 
#' @param species a vector of species names
#' @param host (boolean) affects column naming (nice to keep host and pathogen separate)
#'
#' @return a data.frame with nrow == length(species) 
#' @name getNCBI
#' @usage getNCBI('Peromyscus')


getNCBI <- function(species, host=TRUE){ 
  names.orig <- species
  species <- str_replace(species, " cf\\.","")
  species <- str_replace(species, " sp\\.","")
  species <- str_replace(species, " gen\\.","")
  u <- get_uid(species, 
    rank_filter = c("subspecies", "species", "genus", "family", "order", "class"), 
    division_filter = "vertebrates", ask = FALSE)
  c <- classification(u)
  n <- !is.na(u)
  attributes(u) <- NULL
  s <- unlist(lapply(c, function(x){tryCatch(x$name[[which(x$rank=="species")]], error = function(e) {NA})}), use.names = FALSE)
  g <- unlist(lapply(c, function(x){tryCatch(x$name[[which(x$rank=="genus")]], error = function(e) {NA})}), use.names = FALSE)
  f <- unlist(lapply(c, function(x){tryCatch(x$name[[which(x$rank=="family")]], error = function(e) {NA})}), use.names = FALSE)
  o <- unlist(lapply(c, function(x){tryCatch(x$name[[which(x$rank=="order")]], error = function(e) {NA})}), use.names = FALSE)
  c2 <- unlist(lapply(c, function(x){tryCatch(x$name[[which(x$rank=="class")]], error = function(e) {NA})}), use.names = FALSE)
  k <- unlist(lapply(c, function(x){tryCatch(x$name[[which(x$rank=="kingdom")]], error = function(e) {NA})}), use.names = FALSE)  
  levels <- c("species", "genus", "family", "order", "class")
  u <- unlist(lapply(c, function(x){tryCatch(last(na.omit(x[x$rank %in% levels,'id'])), 
    error = function(e) {NA})}), use.names = FALSE)
  
  if(host){  
    ret <- data.frame(HostOriginal = names.orig,
             HostTaxID = u,
             HostNCBIResolved = n, 
             Host = s,
             HostGenus = g,
             HostFamily = f,
             HostOrder = o, 
             HostClass = c2) %>% mutate_cond(HostNCBIResolved == FALSE, Host = HostOriginal) 
    ret$Host <- NULL
  }
  if(host==FALSE){
    ret <- data.frame(
      PathOriginal=names.orig, 
      PathTaxID = u,
      PathNCBIResolved = n, 
      PathGenus = g,
      PathFamily = f,
      PathOrder = o, 
      PathClass = c2,
      PathKingdom= k) %>% 
    mutate_cond(PathNCBIResolved == FALSE, Path = PathOriginal) 
    ret$PathOriginal <- NULL
  }
  return(ret)
}

