# Produce plots and tables for report

# Before: alb_f.csv, alb_n.csv, bet_f.csv, bet_n.csv, ocs_f.csv, ocs_n.csv,
#         skj_f.csv, skj_n.csv, yft_f.csv, yft_n.csv (output)
# After:  alb_f.csv, alb_n.csv, bet_f.csv, bet_n.csv, ocs_f.csv, ocs_n.csv,
#         skj_f.csv, skj_n.csv, yft_f.csv, yft_n.csv (report)

library(TAF)

mkdir("report")

# Read tables
alb.f <- read.taf("output/alb_f.csv")
alb.n <- read.taf("output/alb_n.csv")
bet.f <- read.taf("output/bet_f.csv")
bet.n <- read.taf("output/bet_n.csv")
ocs.f <- read.taf("output/ocs_f.csv")
ocs.n <- read.taf("output/ocs_n.csv")
skj.f <- read.taf("output/skj_f.csv")
skj.n <- read.taf("output/skj_n.csv")
yft.f <- read.taf("output/yft_f.csv")
yft.n <- read.taf("output/yft_n.csv")

# Format ALB
alb.f$f <- round(alb.f$f, 2)
alb.n$n <- round(alb.n$n)
alb.f <- format(long2taf(alb.f))  # retain trailing zeros
alb.n <- long2taf(alb.n)

# Format BET
bet.f$f <- round(bet.f$f, 2)
bet.n$n <- round(bet.n$n)
bet.f <- format(long2taf(bet.f))  # retain trailing zeros
bet.n <- long2taf(bet.n)

# Format OCS
ocs.f$f <- round(ocs.f$f, 2)
ocs.n$n <- round(ocs.n$n)
ocs.f <- format(long2taf(ocs.f))  # retain trailing zeros
ocs.n <- long2taf(ocs.n)

# Format SKJ
skj.f$f <- round(skj.f$f, 2)
skj.n$n <- round(skj.n$n)
skj.f <- format(long2taf(skj.f))  # retain trailing zeros
skj.n <- long2taf(skj.n)

# Format YFT
yft.f$f <- round(yft.f$f, 2)
yft.n$n <- round(yft.n$n)
yft.f <- format(long2taf(yft.f))  # retain trailing zeros
yft.n <- long2taf(yft.n)

# Write tables
write.taf(alb.f, dir="report")
write.taf(alb.n, dir="report")
write.taf(bet.f, dir="report")
write.taf(bet.n, dir="report")
write.taf(ocs.f, dir="report")
write.taf(ocs.n, dir="report")
write.taf(skj.f, dir="report")
write.taf(skj.n, dir="report")
write.taf(yft.f, dir="report")
write.taf(yft.n, dir="report")
