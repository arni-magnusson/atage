# Run analysis, write model results

# Before: f.csv, n.csv (data)
# After:  f.csv, n.csv (model)

library(TAF)

mkdir("model")

# Read tables
f <- read.taf("data/f.csv")
n <- read.taf("data/n.csv")

# Aggregate F
f$age <- ceiling(f$age / 4)
f <- f[f$area == "all",]
f <- aggregate(f~year+age, f, mean)  # avg within each age

# Aggregate N
n$age <- ceiling(n$age / 4)
n <- aggregate(n~year+age+season, n, sum)  # sum across areas and within age
n <- aggregate(n~year+age, n, mean)  # avg across seasons
n$n <- n$n / 1e6

# Write tables
write.taf(f, dir="model")
write.taf(n, dir="model")
