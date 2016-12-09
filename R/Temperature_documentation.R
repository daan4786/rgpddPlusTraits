#' @name temperature
#' @title Average monthly and annual temperature data for populations in the GPDD
#' @description This is data on average monthly and annual temperature for each population in the global population dynamics database (GPDD). 
#' Location metadata in the GPDD is indexed with a unique LocationID number. I have calculated current temperatures within
#' 0.1 decimal degrees latitude and longitude for each location. If data were unavailable within 0.1 decimal degrees, temperatures were
#' pulled from 0.5 decimal degrees. The column "close_class" specifies whether data comes from within 0.1 or 0.5 decimal degrees of the population.
#' All data come from WorldClim current temperature conditions, which are derived from temperature data between 1960-1990. These data are useful
#' for terrestrial populations.
#' Reference: Hijmans, R.J., S.E. Cameron, J.L. Parra, P.G. Jones and A. Jarvis, 2005. Very high resolution interpolated climate surfaces
#' for global land areas. International Journal of Climatology 25: 1965-1978.
#'
#' These data can be linked to the time series data through the LocationID number. See http://www3.imperial.ac.uk/cpb/databases/gpdd for more  
#' information on the GPDD metadata organization.
#'
#' @name temperature
#' @docType data
#' @author David M Anderson \email{david.merrill.anderson@gmail.com}
#' @references \url{http://www.worldclim.org/version1}
NULL