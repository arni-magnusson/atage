# Produce plots and tables for report

# Before: f.csv, n.csv (output)
# After:  f.csv, n.csv (report)

library(TAF)

mkdir("report")

# Read tables
f <- read.taf("output/f.csv")
n <- read.taf("output/n.csv")

# Format tables
f$f <- round(f$f, 2)
n$n <- round(n$n)
f <- format(long2taf(f))  # retain trailing zeros
n <- long2taf(n)

# Write tables
write.taf(f, dir="report")
write.taf(n, dir="report")
