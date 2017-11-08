# phila-election-results-transpose
## R script to transpose raw Philadelphia election results csv

Election results by voting division (commonly referred to as precincts) are the smallest aggregation of voting unit in Philadelphia. Unfortunately, the results aren't formatted properly for spatial analysis. This R script transposes the data into a unique row for each voting division, and fields for each office/candidate with the number of votes they received. It also creates a unique ID field for each division that matches the [voting division shapefile](https://www.opendataphilly.org/dataset/political-ward-divisions) found on OpenDataPhilly.

### Pre-processing and Requirements
Philadelphia's raw election results can be found here: http://www.phillyelectionresults.com/ExportFiles.html

I converted the text file into a csv so I could easily make use of the read.csv command in R. The script makes use of the reshape2 library in R.
