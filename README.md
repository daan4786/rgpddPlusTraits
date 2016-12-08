# rgpddPlusTraits

The purpose of this package is to integrate species-specific life history data for mammal, bird, and fish species and location-specific data on average monthly temperature with the Global Population Dynamics Database. Global Population Dynamics Database time series data and metadata are accessed through the package 'rgpdd.' Functions were created in order to easily integrate time series data with life history and temperature data.

These life history data were assembled from various published sources, however this data compilation is not itself published. The developers of the Global Population Dynamics Database and the R package 'rgpdd' are not responsible for the accuracy of this data.

For more information on the Gloabl Population Dynamics Database, see http://www3.imperial.ac.uk/cpb/databases/gpdd.

For more information on the package 'rgpdd,' see https://github.com/ropensci/rgpdd. 


## Quickstart

### Install and load package:

```
devtools::install_github("rgpddPlusTraits")
library(rgpddPlusTraits)

library(dplyr)
library(ggplot2)
```

### Integrate life history data with gpdd main table using function available in rgpddPlusTraits.
```
data <- gpdd_taxon_life_history(taxon=TRUE, main=TRUE, sources=FALSE)
```
### An example plot of time series length vs. body mass.
```
ggplot(dplyr::filter(data, TaxonomicClass == "Aves" | TaxonomicClass == "Mammalia" | TaxonomicClass == "Osteichthyes")) + 
geom_point(aes(x = Mass_kg, y = DatasetLength * (1 / as.numeric(as.character(SamplingFrequency))), color = TaxonomicClass)) + 
geom_smooth(aes(x = Mass_kg, y = DatasetLength * (1 / as.numeric(as.character(SamplingFrequency)))), method = "lm", color = "black", se = F) + scale_y_log10() + scale_x_log10() + ylab("Dataset length (yr)") + xlab("Body mass (kg)")
```



