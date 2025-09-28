# Produce plots and tables for report

# Before: yft_f.csv, yft_n.csv (output)
# After:  yft_f.csv, yft_n.csv (report)

library(TAF)

mkdir("report")

# Read tables
yft.f <- read.taf("output/yft_f.csv")
yft.n <- read.taf("output/yft_n.csv")

# Format tables
yft.f$f <- round(yft.f$f, 2)
yft.n$n <- round(yft.n$n)
yft.f <- format(long2taf(yft.f))  # retain trailing zeros
yft.n <- long2taf(yft.n)

# Write tables
write.taf(yft.f, dir="report")
write.taf(yft.n, dir="report")
