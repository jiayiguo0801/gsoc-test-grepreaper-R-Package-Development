# gsoc-test-grepreaper-R-Package-Development
Tests

Contributors, please do one or more of the following tests before contacting the mentors above.

Easy: Consider the diamonds data from the ggplot2 package:

library(ggplot2) library(data.table) data(diamonds)

Within R, use a call to the grep() function to identify rows of data that match the pattern 'VS'. Count the number of qualifying rows.

Medium: Within the data.table package, write a call to fread() that feeds a command-line grep statement into the cmd parameter. Use this to count the number of rows that match the pattern 'VS'.

Hard: Can the contributor write a package with Rd files, tests, and vignettes? Show examples of any work you've contributed to in building an R package.
