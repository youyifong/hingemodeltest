library(chngpt)
library(splines)


#################################################################################
# summary

summary(dat.mtct$NAb_SF162LS)

quantile(dat.mtct$NAb_SF162LS, c(0.1,0.9))



#################################################################################
# testing

# the tests take a while to run 
test=hinge.test(y ~ birth, "NAb_SF162LS", family="binomial", dat.mtct, method='FDB', boot.B=1e4) 
test  # 0.0371


# assume we have a good guess of e
test=hinge.test(y ~ birth, "NAb_SF162LS", family="binomial", dat.mtct, method='FDB', boot.B=1e4, thres=7.37) 
test # 0.0084



#################################################################################
# estimation

# get CI
fit.1=chngptm(y ~ birth, ~NAb_SF162LS, family="binomial", dat.mtct, 
    type="hinge", 
    est.method="smoothapprox",
    var.type="robust",
    aux.fit=glm(y ~ birth+ns(NAb_SF162LS,3), family=binomial, dat.mtct))
summary(fit.1)

#Change point model threshold.type:  hinge 
#
#Coefficients:
#                             est     p.value     (lower     upper)
#(Intercept)           -0.3528931 0.341429662 -1.0822373  0.3764512
#birthVaginal           0.2149217 0.523159883 -0.4472826  0.8771261
#(NAb_SF162LS-chngpt)+ -0.3986328 0.001332547 -0.6404161 -0.1568496
#
#Threshold:
#     est   (lower   upper) 
#7.373374 5.472271 8.186464 
