#' A function to integrate GPDD time series data with temperature data.
#'
#' This function calls the location data table from rgpdd, and joins it with the temperature data using the LocationID index. 
#' In addition, this function can be used to join to the GPDD main data table, which contains indexes for all other data tables.
#' @param location Do you want to include information on location of the population from the gpdd_location data table? Default is FALSE.
#' @param main Do you want to include information on time series from the gpdd_main data table? Default is TRUE.
#' @examples 
#' data <- gpdd_location_temperature() # only include location meta data
#' head(data)
#' data_main <- gpdd_location_temperature(location=TRUE, main=TRUE) #include both location meta data and main table.
#' head(data_main)

gpdd_location_temperature <- function(location=FALSE,main=TRUE){
	
	if(location == TRUE){
		
		if(main == FALSE){
		df <- dplyr::left_join(rgpdd::gpdd_location, rgpddPlusTraits::temperature, by = "LocationID")
		} else{
		df <- dplyr::left_join(rgpddPlusTraits::temperature, rgpdd::gpdd_main, by = "LocationID")
		df <- dplyr::left_join(rgpdd::gpdd_location, df, by = "LocationID")
		}
		
	} else{
		
		if(main == FALSE){
		df <- 0
		} else{
		df <- dplyr::left_join(rgpddPlusTraits::temperature, rgpdd::gpdd_main, by = "LocationID")
		}
		
	}
		
	return(df)
}