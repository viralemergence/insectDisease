
#' Programmatically adjust pathogen "Group" column based on taxonomy
#'
#' @param dat the data.frame containing a column "Group"
#' @param tax the taxonomy data.frame from above
#'
#' @return dat, but with updated "Group" designations based on taxonomy

fillTaxon <- function(edwip){
    
  protzC <- c('Kinetoplastea')
  bactC <- c('Gammaproteobacteria', 'Bacilli')
  
  fungz <- c('Unikaryon ixodis', 'Tompetchia webberi', 
    'Sphaerostilbe auranticola', 'Erynia sepulchralis',
    'Furia vomitoriae', 'Hymenostilbe sp.', 'Hymenostilbe spp.', 
    'Aquamortierella elegans', "Sorosporella sp.", "Coreomycetopsis oedipus",
    "Termitaria coronata", "Herpomyces paranensis", "Herpomyces tricuspidatus", 
    "Herpomyces arietinus", "Herpomyces nyctoborae", "Strongwellsea sp. nov. 1", 
    "Strongwellsea sp. nov. 2", "Strongwellsea sp. nov. 3", 
    "Strongwellsea sp. nov. 6", "Strongwellsea sp. nov. 5", 
    "Strongwellsea sp. nov. 4", "Eryniopsis lampyridarum", 
    "Entomophthora erupta", "Erynia erinacea", "Erynia spp.",
    "Thaxterosporium turbinatum", "Diheterospora sp.", "Neozygites cf floridana", 
    "Coelomomyces sp.", "Pandora gammae", "Myiophagus sp.", 
    "Septobasidium spp.", "Neozygites cucumeriformis", 
    "Synnematium sp.", "Fusarium oxysporum var. orthoceras", 
    "Fusarium sp. near solani","Apergillus sp.","Leptolegnia sp.", 
    "Zoophthora curvispora")

  virz <- c("Thymelicus lineola NPV", 
    "Carposina niponensis GV", "Colias eurytheme NPV", 
    "Celerio euphorbiae NPV", "Aedes taeniorhynchus IV (RMIV)", 
    "Bombyx mori CPV", "Dendrolimus spectabilis CPV")

  protz <- c('Gregarina guatemalensis', 'Hoplorhynchus polyhamatus', 
    'Adelina legeri', "Leishmania major") 

  bactz <- c("Rickettsiella sp.", "Pseudomonas florescens", "Bacillus tuviensis")

  # now go through rows where group is unknown and try to fix that
  for(i in 1:nrow(edwip)){
    if(edwip$Group[i] %in% c('', 'Not defined in EDWIP')){

      if(!is.na(edwip$PathKingdom[i]) & edwip$PathKingdom[i] == 'Fungi'){
        edwip$Group[i] <- 'Fungi'
      }
      if(edwip$PathClass[i] %in% bactC | edwip$Pathogen[i] %in% bactz){
        edwip$Group[i] <- 'Bacteria'
      }
      if(edwip$PathClass[i] %in% protzC | edwip$Pathogen[i] %in% protz){
        edwip$Group[i] <- 'Protozoa'
      }
      if(edwip$PathogenSpecies[i] %in% fungz){
        edwip$Group[i] <- 'Fungi'
      }
      if(edwip$PathogenSpecies[i] %in% virz){
        edwip$Group[i] <- 'Viruses'
      }

    }
  }
  # microsporidians used to be considered protozoa, but are now fungi.
  edwip$Group[which(edwip$PathKingdom == 'Fungi' & edwip$Group != 'Fungi')] <- 'Fungi'
  return(edwip)
}




#' Run fillTaxon function given a filename
#'
#' @param fileName name of EDWIP file
#'
#' @return updated data with filled in taxonomy

fixTaxonomy <- function(fileName){
  tmp <- read.csv(paste(fileName, '.csv', sep=''))

  if(any(colnames(tmp)=='X')){
    tmp$X <- NULL
  }

  if(!is.null(tmp$HostSpecies)){
#    hostTax <- getNCBI(tmp$HostSpecies, host=TRUE)
#    tmp <- cbind(tmp, hostTax)
    tmp$HostTaxID <- tmp$HostGenus <- tmp$HostClass <-
    tmp$HostOrder <- tmp$HostFamily <- NULL
    tmp <- dplyr::left_join(tmp, unique(hostTaxonomy),
      by='HostSpecies')
  }

  if(!is.null(tmp$PathogenSpecies)){
#    pathTax <- getNCBI(tmp$PathogenSpecies, host=FALSE)
#    tmp <- cbind(tmp, pathTax)
    tmp$PathTaxID <- tmp$PathGenus <- tmp$PathClass <-
    tmp$PathKingdom <- tmp$PathOrder <- tmp$PathFamily <- NULL
    tmp <- dplyr::left_join(tmp, unique(pathTaxonomy),
      by='PathogenSpecies')
  }
  
  if(!is.null(tmp$Group)){
    tmp <- fillTaxon(tmp)
  }
  return(tmp)
}


hostTaxonomy <- read.csv('hostTaxonomy.csv')
pathTaxonomy <- read.csv('pathTaxonomy.csv')


assocref <- fixTaxonomy('assocref')
citation <- fixTaxonomy('citation')
hosts    <- fixTaxonomy('hosts')
negative <- fixTaxonomy('negative')
nemaref  <- fixTaxonomy('nemaref')
nematode <- fixTaxonomy('nematode')
new_asso <- fixTaxonomy('new_asso')
newnema  <- fixTaxonomy('newnema')
noassref <- fixTaxonomy('noassref')
nvpassoc <- fixTaxonomy('nvpassoc')
pathogen <- fixTaxonomy('pathogen')
viraref  <- fixTaxonomy('viraref')
viruses  <- fixTaxonomy('viruses')








#### Now fix the date issues


#' fix the dates
#' 
#' let us assume that the year 2099 is actually 1999 and fix it.
#' any year after 2020 will be converted to 19--. 
#' 
#' @param data 
#'
#' @return updated data.frame

fixDates <- function(data){

  if(any(colnames(data) == 'CreationDate')){
    # creation date
    tmp <- strsplit(data$CreationDate, '/')
    tmp2 <- sapply(tmp, function(x){
      if(as.numeric(x[3]) > 2020){
        x[3] <- gsub('20', '19', x[3])
      }
      return(paste(x[1], '/', x[2], '/', x[3], sep=''))
    })
    tmp3 <- as.Date(tmp2, format="%m/%d/%Y") 
    data$CreationDate <- tmp3
  }

  if(any(colnames(data) == 'ModificationDate')){  
    # modification date
    mp <- strsplit(data$ModificationDate, '/')
    mp2 <- sapply(mp, function(x){
      if(as.numeric(x[3]) > 2020){
        x[3] <- gsub('20', '19', x[3])
      }
      return(paste(x[1], '/', x[2], '/', x[3], sep=''))
    })
    mp3 <- as.Date(mp2, format="%m/%d/%Y") 
    data$ModificationDate <- mp3 
  }
  return(data)
}




assocref <- fixDates(assocref)
citation <- fixDates(citation)
hosts    <- fixDates(hosts)
negative <- fixDates(negative)
nemaref  <- fixDates(nemaref)
nematode <- fixDates(nematode)
new_asso <- fixDates(new_asso)
newnema  <- fixDates(newnema)
noassref <- fixDates(noassref)
nvpassoc <- fixDates(nvpassoc)
pathogen <- fixDates(pathogen)
viraref  <- fixDates(viraref)
viruses  <- fixDates(viruses)








#' check for weird \v characters
#' 
#' @param data 
#'
#' @return updated data.frame

fixV <- function(data){

  inds <- apply(data, 2, function(x){any(grep('\v', x))})
  if(any(inds==TRUE)){
    inds <- which(inds)
    for(i in 1:length(inds)){
      # host species had some \v characters too caused by unicode garbo and bad data formatting
      if(names(inds)[i] %in% c('HostSpecies', 'PathogenSpecies', 'Reference', 'ChangeSpeciesTo', 'LogMaxDose', 'NemaOrder', 'Citation', 'AdditionalNotes', 'Virus', 'Country') ){
        data[,inds[i]] <- gsub('\v', '', data[,inds[i]])    
      }else{
      # but the focus is on providing separation for multiple entry columns like HostStageInfected
       data[,inds[i]] <- gsub('\v', ';', data[,inds[i]])
      }
    }
  }
  return(data)
}




assocref <- fixV(assocref)
citation <- fixV(citation)
hosts    <- fixV(hosts)
negative <- fixV(negative)
nemaref  <- fixV(nemaref)
nematode <- fixV(nematode)
new_asso <- fixV(new_asso)
newnema  <- fixV(newnema)
noassref <- fixV(noassref)
nvpassoc <- fixV(nvpassoc)
pathogen <- fixV(pathogen)
viraref  <- fixV(viraref)
viruses  <- fixV(viruses)






#' insert NA where data were just empty
#' 
#' @param data 
#'
#' @return updated data.frame

fixNA <- function(data){
  data <- as.data.frame(
    lapply(data, function(x){
      if(any(nchar(x)==0, na.rm=TRUE)){
        x[which(nchar(x)==0)] <- NA
      }
      return(x)
    })
  )
  return(data)
}




assocref <- fixNA(assocref)
citation <- fixNA(citation)
hosts    <- fixNA(hosts)
negative <- fixNA(negative)
nemaref  <- fixNA(nemaref)
nematode <- fixNA(nematode)
new_asso <- fixNA(new_asso)
newnema  <- fixNA(newnema)
noassref <- fixNA(noassref)
nvpassoc <- fixNA(nvpassoc)
pathogen <- fixNA(pathogen)
viraref  <- fixNA(viraref)
viruses  <- fixNA(viruses)

















## write to csv 

write.csv(assocref, file='../csv/assocref.csv', row.names=FALSE)
write.csv(citation, file='../csv/citation.csv', row.names=FALSE)
write.csv(hosts, file='../csv/hosts.csv', row.names=FALSE)
write.csv(negative, file='../csv/negative.csv', row.names=FALSE)
write.csv(nemaref, file='../csv/nemaref.csv', row.names=FALSE)
write.csv(nematode, file='../csv/nematode.csv', row.names=FALSE)
write.csv(new_asso, file='../csv/new_asso.csv', row.names=FALSE)
write.csv(newnema, file='../csv/newnema.csv', row.names=FALSE)
write.csv(noassref, file='../csv/noassref.csv', row.names=FALSE)
write.csv(nvpassoc, file='../csv/nvpassoc.csv', row.names=FALSE)
write.csv(pathogen, file='../csv/pathogen.csv', row.names=FALSE)
write.csv(viraref, file='../csv/viraref.csv', row.names=FALSE)
write.csv(viruses, file='../csv/viruses.csv', row.names=FALSE)




## put processed data into data folder

usethis::use_data(assocref, overwrite = TRUE)
usethis::use_data(citation, overwrite = TRUE)
usethis::use_data(hosts, overwrite = TRUE)
usethis::use_data(negative, overwrite = TRUE)
usethis::use_data(nemaref, overwrite = TRUE)
usethis::use_data(nematode, overwrite = TRUE)
usethis::use_data(new_asso, overwrite = TRUE)
usethis::use_data(newnema, overwrite = TRUE)
usethis::use_data(noassref, overwrite = TRUE)
usethis::use_data(nvpassoc, overwrite = TRUE)
usethis::use_data(pathogen, overwrite = TRUE)
usethis::use_data(viraref, overwrite = TRUE)
usethis::use_data(viruses, overwrite = TRUE)













## code to re-run the taxonomic queries (too computationally intensive to run everytime

#hostNames <- unique(c(hosts$HostSpecies, negative$HostSpecies, nematode$HostSpecies, 
#  noassref$HostSpecies, nvpassoc$HostSpecies, viruses$HostSpecies))
#hostTaxonomy <- getNCBI(hostNames, host=TRUE)
#write.csv(hostTaxonomy, file='csv/hostTaxonomy.csv')
#save(hostTaxonomy, file='data/hostTaxonomy.rda')


#pathNames <- unique(c(pathogen$PathogenSpecies, negative$PathogenSpecies, nematode$PathogenSpecies, 
#  noassref$PathogenSpecies, nvpassoc$PathogenSpecies, viruses$PathogenSpecies))
#pathTaxonomy <- getNCBI(as.character(pathNames), host=FALSE)
#write.csv(pathTaxonomy, file='csv/pathTaxonomy.csv')
#save(pathTaxonomy, file='data/pathTaxonomy.rda')


