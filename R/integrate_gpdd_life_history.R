#' A function to join GPDD time series data with trait data.
#'
#' This function calls the taxonomic data table from rgpdd, and joins it with the life history data using the TaxonID index. 
#' In addition, this function can be used to join to the GPDD main data table, which contains indexes for all other data tables.
#' @param taxon Do you want to include taxonomic information from the gpdd_taxon data table? Default is FALSE.
#' @param main Do you want to include information on time series from the gpdd_main data table? Default is TRUE.
#' @param sources Do you want to include information on data sources for the life history data? Default is FALSE.
#' @examples data <- gpdd_taxon_life_history()
#' head(data)
#' data_taxon_sources <- gpdd_taxon_life_history(taxon=TRUE, main=FALSE, sources=TRUE)
#' head(data_taxon_sources)
#' @import dplyr
#' @import rgpdd
#' @export
gpdd_taxon_life_history <- function(taxon=FALSE, main=TRUE, sources=FALSE){
	
	if(taxon == TRUE){
		
		if(main == FALSE & sources == FALSE){
		df <- dplyr::left_join(rgpdd::gpdd_taxon, rgpddPlusTraits::life_history, by = "TaxonID")
		} else{
		
			if(main == TRUE & sources == TRUE){
				df <- dplyr::left_join(rgpdd::gpdd_taxon, rgpddPlusTraits::life_history, by = "TaxonID")
				df <- dplyr::left_join(df, rgpdd::gpdd_main, by = "TaxonID")
				df <- dplyr::left_join(df, rgpddPlusTraits::life_history_sources, by = "TaxonID")
			} else{	
				if(main == TRUE & sources == FALSE){
				df <- dplyr::left_join(rgpdd::gpdd_taxon, rgpddPlusTraits::life_history, by = "TaxonID")
				df <- dplyr::left_join(df, rgpdd::gpdd_main, by = "TaxonID")
				} else{
				df <- dplyr::left_join(rgpdd::gpdd_taxon, rgpddPlusTraits::life_history, by = "TaxonID")
				df <- dplyr::left_join(df, rgpddPlusTraits::life_history_sources, by = "TaxonID")
				}
			}			
		} 
				
	} else{
		
		if(main == FALSE & sources == FALSE){
		
		df <- 0
		
		} else{
			
			if(main == TRUE & sources == TRUE){
			df <- dplyr::left_join(rgpddPlusTraits::life_history, rgpdd::gpdd_main, by = "TaxonID")
			df <- dplyr::left_join(df, rgpddPlusTraits::life_history_sources, by = "TaxonID")
			} else{
			
				if(main == TRUE & sources == FALSE){
				df <- dplyr::left_join(rgpddPlusTraits::life_history, rgpdd::gpdd_main, by = "TaxonID")
				} else{
				df <- dplyr::left_join(rgpddPlusTraits::life_history, rgpddPlusTraits::life_history_sources, by = "TaxonID")
				}
			
			}
			
		} 
			
	}	
		
	return(df)
}