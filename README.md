# hingemodeltest

This project contains the script and R code for the Monte Carlo studies and real data analysis in He, Huang, Fouda, Permar (2018). 

The superscript file is run to perform Monte Carlo studies in a slurm distributed computing environment. It calls the runscript file through the configuration files with extension .conf. The runscript file then runs hinge_test_MC.R with proper arguments. The Monte Carlo results are saved in files organized into subdirectories. When the simulations are done, hinge_test_MC_analyses.R can be sourced to create tables that summarize simulation results.

The mtct_hinge_test.R file replicates the data analysis example.

References:

He, Huang, Fouda, Permar (2018) A non-nested hypothesis testing problem for threshold regression models. Under review.
