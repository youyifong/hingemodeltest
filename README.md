# hingemodeltest

This project contains the script and R code for the Monte Carlo studies and real data analysis in He, Huang, Fouda, Permar (2018). The chngpt R package version 2018.7-25 or above (https://cran.r-project.org/web/packages/chngpt) works with these files.

The file named superscript is run to perform Monte Carlo studies in a slurm distributed computing environment. superscript calls the files named runscript, which runs xxx.R with proper arguments. The Monte Carlo results are saved in files organized into directories. After Monte Carlo is done, open an R console and run xxx.R to summary simulation results.


References:

He, Huang, Fouda, Permar (2018) A non-nested hypothesis testing problem for threshold regression models. Under review.
