# Prepare data, write CSV data tables

# Before: f_annual.csv, natage.csv (boot/data/yft)
# After:  f.csv, n.csv (data)

library(TAF)

mkdir("data")

# Read tables
f <- read.taf("boot/data/yft/f_annual.csv")
n <- read.taf("boot/data/yft/natage.csv")

# Write tables
write.taf(f, dir="data")
write.taf(n, dir="data")
