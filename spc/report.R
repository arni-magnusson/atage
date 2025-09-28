# Produce plots and tables for report

# Before: bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (output)
# After:  bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (report)

library(TAF)

mkdir("report")

# Read tables
bet.f <- read.taf("output/bet_f.csv")
bet.n <- read.taf("output/bet_n.csv")
yft.f <- read.taf("output/yft_f.csv")
yft.n <- read.taf("output/yft_n.csv")

# Format BET
bet.f$f <- round(bet.f$f, 2)
bet.n$n <- round(bet.n$n)
bet.f <- format(long2taf(bet.f))  # retain trailing zeros
bet.n <- long2taf(bet.n)

# Format YFT
yft.f$f <- round(yft.f$f, 2)
yft.n$n <- round(yft.n$n)
yft.f <- format(long2taf(yft.f))  # retain trailing zeros
yft.n <- long2taf(yft.n)

# Write tables
write.taf(bet.f, dir="report")
write.taf(bet.n, dir="report")
write.taf(yft.f, dir="report")
write.taf(yft.n, dir="report")
