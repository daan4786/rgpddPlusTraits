#' @name life_history
#' @title Life history data for populations in the GPDD
#' @description This is data on life history traits for mammal, bird, and fish species in the global population dyanmics database (GPDD).
#' These trait data are an average for each species, and are intended for across taxa comparative analyses. Data come from published
#' compilations. See life_history_sources for references for trait values of each species. 
#' 
#' These data can be linked to the time series data through the TaxonID number. See http://www3.imperial.ac.uk/cpb/databases/gpdd for more  
#' information on the GPDD metadata organization.
#'
#' @return Mass_kg: Average adult body mass in kilograms. When females and males differ in mass, only the female size is included.
#' @return Temp: Average body temperature. For fish, the body temperature is assumed to be equal to preferred temperature. When species specific temperatures of mammals and birds are unavailable, the average temperature of all mammals or birds is given.
#' @return Class_or_species: Indicates wheter the body temperature estimate from the taxonomic level of Class, or Species, or, for fish, a preferred temperature.
#' @return MSMR_W_g: Average metabolic rate per unit body mass (i.e. whole organism metabolic rate divided by adult body mass), in units of Watts per gram.
#' @return Average_Lifespan_years: This is calculated as the inverse of the average natural mortality rate, and is an estimate of the average lifespan of the species in nature, in units of years.
#' @return Lifespan: This is more nearly the maximum lifespan in the wild, units of years.
#' @return age_first_reproduction_years: The average age of first reproduction of females. Units of years.
#' @return PrimaryDiet: Rough classification based on diet studies. No objective methods were used to classify species. Only included for mammals and birds.
#' @return TrophicLevel: Quantitative classification based on diet studies, collected from FishBase. Only included for Fish.
#'
#'
#' @name life_history
#' @docType data
#' @author David M Anderson \email{david.merrill.anderson@gmail.com}
NULL
