# Prepare data, write CSV data tables

# Before: alb/f_annual.csv, alb/natage.csv, bet/f_annual.csv, bet/natage.csv,
#         ocs/fishmort.csv, ocs/natage.csv, skj/f_annual.csv, skj/natage.csv,
#         yft/f_annual.csv, yft/natage.csv (boot/data)
# After:  alb_f.csv, alb_n.csv, bet_f.csv, bet_n.csv, ocs_f.csv, ocs_n.csv,
#         skj_f.csv, skj_n.csv, yft_f.csv, yft_n.csv (data)

library(TAF)

mkdir("data")

# Copy and rename MFCL tables
cp("boot/data/alb/f_annual.csv", "data/alb_f.csv")
cp("boot/data/alb/natage.csv",   "data/alb_n.csv")
cp("boot/data/bet/f_annual.csv", "data/bet_f.csv")
cp("boot/data/bet/natage.csv",   "data/bet_n.csv")
cp("boot/data/ocs/fishmort.csv", "data/ocs_f.csv")
cp("boot/data/ocs/natage.csv",   "data/ocs_n.csv")
cp("boot/data/skj/f_annual.csv", "data/skj_f.csv")
cp("boot/data/skj/natage.csv",   "data/skj_n.csv")
cp("boot/data/yft/f_annual.csv", "data/yft_f.csv")
cp("boot/data/yft/natage.csv",   "data/yft_n.csv")

# Read SS3 tables
ocs.f <- read.taf("boot/data/ocs/fishmort.csv")
ocs.n <- read.taf("boot/data/ocs/natage.csv")

# Format SS3 tables
names(ocs.f) <- c("sex", "year", "age", "f")
names(ocs.n) <- c("sex", "year", "age", "n")
# tables must be sorted for weighting algorithm
ocs.f <- ocs.f[order(ocs.f$sex, ocs.f$age, ocs.f$year),]
ocs.n <- ocs.n[order(ocs.n$sex, ocs.n$age, ocs.n$year),]

# Write SS3 tables
write.taf(ocs.f, dir="data")
write.taf(ocs.n, dir="data")
