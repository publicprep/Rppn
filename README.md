# Rppn
A R package to share data and reporting workflows at Public Prep.  [Inspired](https://medium.com/airbnb-engineering/using-r-packages-and-education-to-scale-data-science-at-airbnb-906faa58e12d#.pawy0ho6z) by the airbnb data science team.

This repository will house:
- functions to read data 
- themes for charts
- templates for reporting
- utility functions that help with data analysis in our environment

# credentials keys
All of the functions to read in data use environment variables stored in your `.Renviron` file, per [Hadley's](https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html) documentation (read the Appendix).  THis allows for functions to connect to our data warehouses without worrying about storing credentials in version control.

Read that link above, then talk to Andrew about getting your `.Renviron` file set up!

