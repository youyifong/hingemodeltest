# hingemodeltest

This project contains the script and R code for the Monte Carlo studies and real data analysis in He, Huang, Fouda, Permar (2018). The hypothese testing methods themselves are implemented in the R package chngpt (https://cran.r-project.org/web/packages/chngpt) version 2018.10-17 or later.

To perform Monte Carlo studies, run the superscript file in a slurm distributed computing environment. It calls the runscript file through the configuration files with extension .conf. The runscript file then runs hinge_test_MC.R with proper arguments. The Monte Carlo results are saved in files organized into subdirectories. 

To analyze Monte Carlo results, source hinge_test_MC_analyses.R, which creates summary tables.

The mtct_hinge_test.R file replicates the data analysis example.


References:

He, Huang, Fouda, Permar (2018) A non-nested hypothesis testing problem for threshold regression models. Under review.
