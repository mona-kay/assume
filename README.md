# assume
Developing the `assume` package in R.

# Functions available
- `normal` : a function that tests the skewness of each column in a dataframe, tibble, or matrix. The function returns an output telling the user the degree of skewness and the ideal transformation (i.e., log10, sqrt) based on degree of skewness.
- `linear` : a function that tests several permutations of correlations to determine if a relationship is linear, curvilinear, or neither.

# Functions currently in development
- `normalize` : a function to test and auto-transform columns in a dataframe, tibble, or matrix based on degree and direction of skewness
- `stationarity` : a function that tests the stationarity of a time series data set
