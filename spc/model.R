# Run analysis, write model results

# Before: yft_f.csv, yft_n.csv (data)
# After:  yft_f.csv, yft_n.csv (model)

library(TAF)

mkdir("model")

# Read tables
yft.f <- read.taf("data/yft_f.csv")
yft.n <- read.taf("data/yft_n.csv")

# Aggregate F
yft.f$age <- ceiling(yft.f$age / 4)
yft.f <- yft.f[yft.f$area == "all",]
yft.f <- aggregate(f~year+age, yft.f, mean)  # avg within each age

# Aggregate N
yft.n$age <- ceiling(yft.n$age / 4)
yft.n <- aggregate(n~year+age+season, yft.n, sum)  # sum areas and within age
yft.n <- aggregate(n~year+age, yft.n, mean)  # avg across seasons
yft.n$n <- yft.n$n / 1e6

# Write tables
write.taf(yft.f, dir="model")
write.taf(yft.n, dir="model")
