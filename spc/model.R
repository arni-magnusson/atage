# Run analysis, write model results

# Before: bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (data)
# After:  bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (model)

library(TAF)

mkdir("model")

# Read tables
bet.f <- read.taf("data/bet_f.csv")
bet.n <- read.taf("data/bet_n.csv")
yft.f <- read.taf("data/yft_f.csv")
yft.n <- read.taf("data/yft_n.csv")

# Aggregate BET
bet.f$age <- ceiling(bet.f$age / 4)
bet.f <- bet.f[bet.f$area == "all",]
bet.f <- aggregate(f~year+age, bet.f, mean)  # avg within each age
bet.n$age <- ceiling(bet.n$age / 4)
bet.n <- aggregate(n~year+age+season, bet.n, sum)  # sum areas and within age
bet.n <- aggregate(n~year+age, bet.n, mean)  # avg across seasons
bet.n$n <- bet.n$n / 1e6

# Aggregate YFT
yft.f$age <- ceiling(yft.f$age / 4)
yft.f <- yft.f[yft.f$area == "all",]
yft.f <- aggregate(f~year+age, yft.f, mean)  # avg within each age
yft.n$age <- ceiling(yft.n$age / 4)
yft.n <- aggregate(n~year+age+season, yft.n, sum)  # sum areas and within age
yft.n <- aggregate(n~year+age, yft.n, mean)  # avg across seasons
yft.n$n <- yft.n$n / 1e6

# Write tables
write.taf(bet.f, dir="model")
write.taf(bet.n, dir="model")
write.taf(yft.f, dir="model")
write.taf(yft.n, dir="model")
