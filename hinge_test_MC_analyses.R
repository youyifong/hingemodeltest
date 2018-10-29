library(kyotil)

if(!file.exists("tables")) dir.create("tables")

# calculate size for Table 1
tmp<-NULL
for(j in c('B','DB','FDB')){
  for(i in c(50,100,250,500)){
    Dir <- dir("res_chngpt_table1/method="%.%j%.%"/n="%.%i%.%"/")
    res <- lapply(Dir, function(x) get.sim.res("res_chngpt_table1/method="%.%j%.%"/n="%.%i%.%"/"%.%x))
    size <- data.frame(lapply(res, function(x) mean(x<0.05)))
    names(size) <- Dir
    tmp=rbind(tmp,size)
  }
}

# format data to create table
tab=cbind(c('$n=50$','$n=100$','$n=250$','$n=500$'),formatDouble(as.matrix(tmp[1:4,c(2,1,3)]),3),formatDouble(as.matrix(tmp[4+1:4,c(2,1,3)]),3),formatDouble(as.matrix(tmp[2*4+1:4,c(2,1,3)]),3))

# create Table 1
mytex(tab, file="tables/table1_test", sanitize.text.function = function(x) x, include.colnames = F, include.rownames=F, include.dup.rownames=F, include.dup.colnames=F, align=c("c","l","c","c","c|","c","c","c|","c","c","c"), col.headers = "\\hline \\multicolumn{1}{l}{} & \\multicolumn{3}{c|}{L-B} & \\multicolumn{3}{c|}{L-DB} &\\multicolumn{3}{c}{L-FDB} \\\\  \n \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{$e=-0.25$} & \\multicolumn{1}{c}{$e=0$} & \\multicolumn{1}{c|}{$e=0.25$} & \\multicolumn{1}{c}{$e=-0.25$} & \\multicolumn{1}{c}{$e=0$} & \\multicolumn{1}{c|}{$e=0.25$} & \\multicolumn{1}{c}{$e=-0.25$} & \\multicolumn{1}{c}{$e=0$} & \\multicolumn{1}{c}{$e=0.25$} \\\\ \\hline\n", comment = FALSE, hline = 4)

# calculate size for Table 2
tmp<-NULL
for(j in c('B','FDB')){
  for(i in c(50,100,250,500)){
    Dir <- dir("res_chngpt_table2/method="%.%j%.%"/n="%.%i%.%"/")
    res <- lapply(Dir, function(x) get.sim.res("res_chngpt_table2/method="%.%j%.%"/n="%.%i%.%"/"%.%x))
    size <- data.frame(lapply(res, function(x) mean(x<0.05)))
    names(size) <- Dir
    tmp=rbind(tmp,size)
  }
}

# format data to create table
tab=cbind(c('$n=50$','$n=100$','$n=250$','$n=500$'),formatDouble(as.matrix(tmp[1:4,]),3),formatDouble(as.matrix(tmp[4+1:4,]),3))

# create Table 2
mytex(tab, file="tables/table2_test", sanitize.text.function = function(x) x, include.colnames = F, include.rownames=F, include.dup.rownames=F, include.dup.colnames=T, align=c("c","l","c","c","c","c|","c","c","c","c"), col.headers = "\\hline \\multicolumn{1}{c}{} & \\multicolumn{4}{c|}{TL-B} & \\multicolumn{4}{c}{TL-FDB}\\\\  \n \\multicolumn{1}{c}{$(e_{min},e_{max})$} & \\multicolumn{1}{c}{$(0.1,0.9)$} & \\multicolumn{1}{c}{$(0.2,0.8)$} & \\multicolumn{1}{c}{$(0.3,0.7)$} & \\multicolumn{1}{c|}{$(0.4,0.6)$} & \\multicolumn{1}{c}{$(0.1,0.9)$} & \\multicolumn{1}{c}{$(0.2,0.8)$} & \\multicolumn{1}{c}{$(0.3,0.7)$} & \\multicolumn{1}{c}{$(0.4,0.6)$} \\\\ \\hline \n", comment = FALSE)

# calculate size for Table 3
tmp<-NULL
for(j in c('B','FDB')){
  for(i in c(50,100,250,500)){
    Dir <- dir("res_chngpt_table3/method="%.%j%.%"/n="%.%i%.%"/")
    res <- lapply(Dir, function(x) get.sim.res("res_chngpt_table3/method="%.%j%.%"/n="%.%i%.%"/"%.%x))
    size <- data.frame(lapply(res, function(x) mean(x<0.05)))
    names(size) <- Dir
    tmp=rbind(tmp,size)
  }
}

# format data to create table
tab=cbind(c('$n=50$','$n=100$','$n=250$','$n=500$'),formatDouble(as.matrix(tmp[1:4,c(2,1,3)]),2),formatDouble(as.matrix(tmp[4+1:4,c(2,1,3)]),2))

# create Table 3
mytex(tab, file="tables/table3_test", sanitize.text.function = function(x) x, include.colnames = F, include.rownames=F, include.dup.rownames=F, include.dup.colnames=F, align=c("c","l","c","c","c|","c","c","c"), col.headers = "\\hline \\multicolumn{1}{l}{} & \\multicolumn{3}{c|}{TL-B} &\\multicolumn{3}{c}{TL-FDB} \\\\  \n \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{$e_0=-0.25$} & \\multicolumn{1}{c}{$e_0=0$} & \\multicolumn{1}{c|}{$e_0=0.25$} & \\multicolumn{1}{c}{$e_0=-0.25$} & \\multicolumn{1}{c}{$e_0=0$} & \\multicolumn{1}{c}{$e_0=0.25$} \\\\ \\hline\n", comment = FALSE, hline = 4)

# calculate size for Table 4
tmp<-NULL
for(j in c('B','FDB')){
  for(i in c(50,100,250,500,1000,2000)){
    Dir <- dir("res_chngpt_table4/method="%.%j%.%"/n="%.%i%.%"/")
    res <- lapply(Dir, function(x) get.sim.res("res_chngpt_table4/method="%.%j%.%"/n="%.%i%.%"/"%.%x))
    size <- data.frame(lapply(res, function(x) mean(x<0.05)))
    names(size) <- Dir
    tmp=rbind(tmp,size)
  }
}

# format data to create table
tab=cbind(c('$n=50$','$n=100$','$n=250$','$n=500$','$n=1000$','$n=2000$'),formatDouble(as.matrix(tmp[1:6,c(2,1,3)]),3),formatDouble(as.matrix(tmp[6+1:6,c(2,1,3)]),3))

# create Table 4
mytex(tab, file="tables/table4_test", sanitize.text.function = function(x) x, include.colnames = F, include.rownames=F, include.dup.rownames=F, include.dup.colnames=F, align=c("c","l","c","c","c|","c","c","c"), col.headers = "\\hline \\multicolumn{1}{l}{} & \\multicolumn{3}{c|}{l-B} &\\multicolumn{3}{c}{l-FDB} \\\\  \n \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{$e=-0.25$} & \\multicolumn{1}{c}{$e=0$} & \\multicolumn{1}{c|}{$e=0.25$} & \\multicolumn{1}{c}{$e=-0.25$} & \\multicolumn{1}{c}{$e=0$} & \\multicolumn{1}{c}{$e=0.25$} \\\\ \\hline\n", comment = FALSE, hline = 6)

# calculate size for Table 5
tmp<-NULL
for(j in c('B','FDB')){
  for(i in c(250,500,1000,2000)){
    Dir <- dir("res_chngpt_table5/method="%.%j%.%"/n="%.%i%.%"/")
    res <- lapply(Dir, function(x) get.sim.res("res_chngpt_table5/method="%.%j%.%"/n="%.%i%.%"/"%.%x))
    size <- data.frame(lapply(res, function(x) mean(x<0.05)))
    names(size) <- Dir
    tmp=rbind(tmp,size)
  }
}

# format data to create table
tab=cbind(c('$n=250$','$n=500$','$n=1000$','$n=2000$'),formatDouble(as.matrix(tmp[1:4,c(4,2,1,3)]),2),formatDouble(as.matrix(tmp[4+1:4,c(4,2,1,3)]),2))

# create Table 5
mytex(tab, file="tables/table5_test", sanitize.text.function = function(x) x, include.colnames = F, include.rownames=F, include.dup.rownames=F, include.dup.colnames=F, align=c("c","l","c","c","c","c|","c","c","c","c"), col.headers = "\\hline \\multicolumn{1}{l}{} & \\multicolumn{4}{c|}{Tl-B} &\\multicolumn{4}{c}{Tl-FDB} \\\\  \n \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{size} & \\multicolumn{1}{c}{$e_0=-0.25$} & \\multicolumn{1}{c}{$e_0=0$} & \\multicolumn{1}{c|}{$e_0=0.25$} & \\multicolumn{1}{c}{size} & \\multicolumn{1}{c}{$e_0=-0.25$} & \\multicolumn{1}{c}{$e_0=0$} & \\multicolumn{1}{c}{$e_0=0.25$} \\\\ \\hline\n", comment = FALSE, hline = 4)

# calculate size for Table A.1
tmp<-NULL
for(j in c('FDB')){
  for(i in c(50,100,250,500)){
    Dir <- dir("res_chngpt_tableA1/method="%.%j%.%"/n="%.%i%.%"/")
    res <- lapply(Dir, function(x) get.sim.res("res_chngpt_tableA1/method="%.%j%.%"/n="%.%i%.%"/"%.%x))
    size <- data.frame(lapply(res, function(x) mean(x<0.05)))
    names(size) <- Dir
    tmp=rbind(tmp,size)
  }
}

# format data to create table
tab=cbind(c('$n=50$','$n=100$','$n=250$','$n=500$'),formatDouble(as.matrix(tmp[1:4,c(4,2,1,3)]),2))

# create Table A.1
mytex(tab, file="tables/tableA1_test", sanitize.text.function = function(x) x, include.colnames = F, include.rownames=F, include.dup.rownames=F, include.dup.colnames=T, align=c("c","l","c","c","c","c"), col.headers = "\\hline \\multicolumn{1}{c}{size} & \\multicolumn{1}{c}{} & \\multicolumn{3}{c}{power} \\\\  \n \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{$e_0=-0.25$} & \\multicolumn{1}{c}{$e_0=0$} & \\multicolumn{1}{c}{$e_0=0.25$}\\\\ \\hline \n ", comment = FALSE)

# calculate size for Table A.2
tmp<-NULL
for(j in c('FDB')){
  for(i in c(250,500,1000,2000)){
    Dir <- dir("res_chngpt_tableA2/method="%.%j%.%"/n="%.%i%.%"/")
    res <- lapply(Dir, function(x) get.sim.res("res_chngpt_tableA2/method="%.%j%.%"/n="%.%i%.%"/"%.%x))
    size <- data.frame(lapply(res, function(x) mean(x<0.05)))
    names(size) <- Dir
    tmp=rbind(tmp,size)
  }
}

# format data to create table
tab=cbind(c('$n=250$','$n=500$','$n=1000$','$n=2000$'),formatDouble(as.matrix(tmp[1:4,c(4,2,1,3)]),2))

# create Table A.2
mytex(tab, file="tables/tableA2_test", sanitize.text.function = function(x) x, include.colnames = F, include.rownames=F, include.dup.rownames=F, include.dup.colnames=T, align=c("c","l","c","c","c","c"), col.headers = "\\hline \\multicolumn{1}{c}{size} & \\multicolumn{1}{c}{} & \\multicolumn{3}{c}{power} \\\\  \n \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{} & \\multicolumn{1}{c}{$e_0=-0.25$} & \\multicolumn{1}{c}{$e_0=0$} & \\multicolumn{1}{c}{$e_0=0.25$}\\\\ \\hline \n ", comment = FALSE)
