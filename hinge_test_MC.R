library(kyotil)
library(chngpt)

# process arguments 
Args <- commandArgs(trailingOnly=TRUE) 
if (length(Args)==0) {
  
  Args=c(batch.size="10",batch.number="2",npar='2', n = "50",threshold.type='NA',e='NA',X.ditr='norm',intercept.X='1',Beta.z='0.5', Beta.x = '0.5', thres='0',family='gaussian',lb.quantile = '0.1',method='DB',boot.B = '10', B2 = '5',foldername = "res_chngpt_test")
  
}

i=0;
i=i+1; batch.size=as.numeric(Args[i])
i=i+1; batch=as.numeric(Args[i])
i=i+1; npar = as.numeric(Args[i])
i=i+1; n = as.numeric(Args[i])
i=i+1; threshold.type = as.character(Args[i])
i=i+1; e = as.numeric(Args[i])
i=i+1; X.ditr = as.character(Args[i])
i=i+1; intercept.X = as.numeric(Args[i])
i=i+1; Beta.z = as.numeric(Args[i])
i=i+1; Beta.x = as.numeric(Args[i])
i=i+1; thres = as.numeric(Args[i])
i=i+1; family = as.character(Args[i])
i=i+1; lb.quantile = ifelse(Args[i]=='NA',as.character(Args[i]),as.numeric(Args[i]))
i=i+1; method = as.character(Args[i])
i=i+1; boot.B = as.numeric(Args[i])
i=i+1; B2=ifelse(Args[i]=='NA',as.character(Args[i]),as.numeric(Args[i]))
i=i+1; foldername = as.character(Args[i])

seeds=1:batch.size+batch.size*(batch-1)
names(seeds)=seeds
if(npar==2){
  formula=as.formula('Y~z')
} else if(npar==10){
  formula=as.formula('Y~X1+X2+X3+X4+X5+X6+X7+X8+X9')
} 

myprint(batch.size,batch,npar,n,threshold.type,e,X.ditr,intercept.X,Beta.z, Beta.x, thres,family,formula,lb.quantile,method,boot.B, B2,foldername)

# paramss=as.numeric(strsplit(params.str,",")[[1]])

verbose=T
res.len=NA

begin=Sys.time()

res=sapply(seeds, simplify="array", function (seed) {

  dat=sim.hinge(family = family,threshold.type=threshold.type,thres=e,X.ditr = X.ditr,mu.X = rep(0,npar),coef.X = c(intercept.X,rep(Beta.z,npar-1),Beta.x),cov.X = diag(npar),eps.sd = 1,seed = seed,n=n)
  test=hinge.test(formula = formula, "x",thres = thres,lb.quantile = lb.quantile, ub.quantile = 1-lb.quantile,family=family, data=dat,method=method,boot.B=boot.B,B2=B2)
  

  res <- test$p.value
  
  eval(eval(substitute(expression( res.len <<- length(res) ))))    
  
  res
  
})
# names(dimnames(res))=c("stat","seed")


# save results
foldername=foldername%.%"/"; if(!file.exists(foldername)) dir.create(foldername)
foldername=foldername%.%"method="%.%method%.%"/"; if(!file.exists(foldername)) dir.create(foldername)
foldername=foldername%.%"n="%.%n%.%"/"; if(!file.exists(foldername)) dir.create(foldername)
if(!is.na(thres)){
  foldername=foldername%.%"thres="%.%thres%.%"/"; if(!file.exists(foldername)) dir.create(foldername)
} else if(is.na(thres)){
  if(!is.na(e)){
    foldername=foldername%.%"e="%.%e%.%"/"; if(!file.exists(foldername)) dir.create(foldername)
  } else if(is.na(e)){
    foldername=foldername%.%"lb.quantile="%.%lb.quantile%.%"/"; if(!file.exists(foldername)) dir.create(foldername)
  }

} 

save (res, file=foldername%.%"/batch"%.%formatInt(batch, 3)%.%".Rdata")
# note time passed
done = Sys.time()
body1=format(done-begin)
print(date())
print("time used: "%.%body1)
