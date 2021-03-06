# rgpddPlusTraits

The purpose of this package is to make available species-specific life history trait information for mammal, bird, and fish species in the global population dynamics database (GPDD). In addition, location-specific data on average monthly and annual temperature are included in a separate data file. These data are indexed with identification numbers for the GPDD metadata tables. This package is designed to interface with the package 'rgpdd,' which contains all data tables from the original GPDD. Functions were created in order to easily join life history and temperature data with individual time series data and metadata from the 'rgpdd'.

Life history data were assembled manually from various published sources, however this data compilation is not itself published. The developers of the Global Population Dynamics Database and the R package 'rgpdd' are not responsible for the accuracy of this data.

For more information on the Gloabl Population Dynamics Database and metadata organization, see http://www3.imperial.ac.uk/cpb/databases/gpdd.

For more information on the package 'rgpdd,' see https://github.com/ropensci/rgpdd. 


## Quickstart

### Install and load package:

```
library(devtools)
devtools::install_github("daan4786/rgpddPlusTraits")
library(rgpddPlusTraits)

# While rgpddPlusTraits has functions to integrate the trait/temperature data with the GPDD meta data tables, 
# in order to work with the actual time series data you must load the package rgpdd.
devtools::install_github("ropensci/rgpdd")
library(rgpdd)

library(dplyr)
library(ggplot2)
```

### Integrate life history data with gpdd main table using function available in rgpddPlusTraits:
```
life_history <- gpdd_taxon_life_history(taxon=TRUE, main=TRUE, sources=FALSE)
```
### An example analysis looking at the effect of body mass on average abundance of mammals, birds, and fish:
```
# Calculate average population size of each time series 
avg_abundance <- rgpdd::gpdd_data %>% group_by(MainID) %>% summarize(avg_abundance = mean(PopulationUntransformed)) 

# Join with life history data for plotting
avg_abundance_life_history <- dplyr::left_join(avg_abundance, life_history, by = "MainID")

ggplot(dplyr::filter(avg_abundance_life_history, DatasetLength > 20, (TaxonomicClass == "Mammalia" | TaxonomicClass == "Aves" | TaxonomicClass == "Osteichthyes"))) + 
geom_point(aes(x = Mass_kg, y = avg_abundance, color = TaxonomicClass)) + 
geom_smooth(aes(x = Mass_kg, y = avg_abundance), method = "lm", se = F, color = "black") +
scale_x_log10() + scale_y_log10() + ylab("Average abundance (variable spatial units)") + xlab("Body Mass (kg)")
```

![example_plot](https://cloud.githubusercontent.com/assets/18072450/21020919/6b30d8e2-bd44-11e6-9cd5-ec71e2178071.png)


