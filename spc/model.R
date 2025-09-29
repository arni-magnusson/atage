# Run analysis, write model results

# Before: alb_f.csv, alb_n.csv,
#         bet_f.csv, bet_n.csv,
#         skj_f.csv, skj_n.csv,
#         swo_f.csv, swo_n.csv,
#         yft_f.csv, yft_n.csv (data)
# After:  alb_f.csv, alb_n.csv,
#         bet_f.csv, bet_n.csv,
#         skj_f.csv, skj_n.csv,
#         swo_f.csv, swo_n.csv,
#         yft_f.csv, yft_n.csv (model)

library(TAF)

mkdir("model")

# Read tables
alb.f <- read.taf("data/alb_f.csv")
alb.n <- read.taf("data/alb_n.csv")
bet.f <- read.taf("data/bet_f.csv")
bet.n <- read.taf("data/bet_n.csv")
skj.f <- read.taf("data/skj_f.csv")
skj.n <- read.taf("data/skj_n.csv")
swo.f <- read.taf("data/swo_f.csv")
swo.n <- read.taf("data/swo_n.csv")
yft.f <- read.taf("data/yft_f.csv")
yft.n <- read.taf("data/yft_n.csv")

# Aggregate ALB
alb.f <- alb.f[alb.f$area == "all",]
alb.f <- alb.f[order(alb.f$age, alb.f$year), c("year", "age", "f")]
alb.n <- aggregate(n~year+age, alb.n, sum)  # sum areas
alb.n$n <- alb.n$n / 1e6

# Aggregate BET
bet.f$age <- ceiling(bet.f$age / 4)
bet.f <- bet.f[bet.f$area == "all",]
bet.f <- aggregate(f~year+age, bet.f, mean)  # avg within each age
bet.n$age <- ceiling(bet.n$age / 4)
bet.n <- aggregate(n~year+age+season, bet.n, sum)  # sum areas and within age
bet.n <- aggregate(n~year+age, bet.n, mean)  # avg across seasons
bet.n$n <- bet.n$n / 1e6

# Aggregate SKJ
skj.f$age <- ceiling(skj.f$age / 4)
skj.f <- skj.f[skj.f$area == "all",]
skj.f <- aggregate(f~year+age, skj.f, mean)  # avg within each age
skj.n$age <- ceiling(skj.n$age / 4)
skj.n <- aggregate(n~year+age+season, skj.n, sum)  # sum areas and within age
skj.n <- aggregate(n~year+age, skj.n, mean)  # avg across seasons
skj.n$n <- skj.n$n / 1e6

# Aggregate SWO
swo.n$w <- with(swo.n, ave(n, year, age, FUN=proportions))  # weights for avg F
swo.f$fxw <- swo.f$f * swo.n$w  # apply weights
swo.n <- aggregate(n~year+age, swo.n, sum)
swo.f <- aggregate(fxw~year+age, swo.f, sum)
names(swo.f)[names(swo.f) == "fxw"] <- "f"

# Aggregate YFT
yft.f$age <- ceiling(yft.f$age / 4)
yft.f <- yft.f[yft.f$area == "all",]
yft.f <- aggregate(f~year+age, yft.f, mean)  # avg within each age
yft.n$age <- ceiling(yft.n$age / 4)
yft.n <- aggregate(n~year+age+season, yft.n, sum)  # sum areas and within age
yft.n <- aggregate(n~year+age, yft.n, mean)  # avg across seasons
yft.n$n <- yft.n$n / 1e6

# Write tables
write.taf(alb.f, dir="model")
write.taf(alb.n, dir="model")
write.taf(bet.f, dir="model")
write.taf(bet.n, dir="model")
write.taf(skj.f, dir="model")
write.taf(skj.n, dir="model")
write.taf(swo.f, dir="model")
write.taf(swo.n, dir="model")
write.taf(yft.f, dir="model")
write.taf(yft.n, dir="model")
