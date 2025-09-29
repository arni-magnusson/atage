# Prepare data, write CSV data tables

# Before: alb/f_annual.csv, alb/natage.csv,
#         bet/f_annual.csv, bet/natage.csv,
#         skj/f_annual.csv, skj/natage.csv,
#         swo/f_area.csv, swo/natage.csv,
#         yft/f_annual.csv, yft/natage.csv (boot/data)
# After:  alb_f.csv, alb_n.csv,
#         bet_f.csv, bet_n.csv,
#         skj_f.csv, skj_n.csv,
#         swo_f.csv, swo_n.csv,
#         yft_f.csv, yft_n.csv (data)

library(TAF)

mkdir("data")

# Copy and rename MFCL tables
cp("boot/data/alb/f_annual.csv", "data/alb_f.csv")
cp("boot/data/alb/natage.csv",   "data/alb_n.csv")
cp("boot/data/bet/f_annual.csv", "data/bet_f.csv")
cp("boot/data/bet/natage.csv",   "data/bet_n.csv")
cp("boot/data/skj/f_annual.csv", "data/skj_f.csv")
cp("boot/data/skj/natage.csv",   "data/skj_n.csv")
cp("boot/data/yft/f_annual.csv", "data/yft_f.csv")
cp("boot/data/yft/natage.csv",   "data/yft_n.csv")

# Read SS3 tables
swo.f <- read.taf("boot/data/swo/f_area.csv")
swo.n <- read.taf("boot/data/swo/natage.csv")

# Format SS3 tables
names(swo.f) <- c("area", "sex", "year", "age", "f")
names(swo.n) <- c("area", "sex", "year", "age", "n")
swo.f <- swo.f[order(swo.f$area, swo.f$sex, swo.f$age, swo.f$year),]
swo.n <- swo.n[order(swo.n$area, swo.n$sex, swo.n$age, swo.n$year),]

# Write SS3 tables
write.taf(swo.f, dir="data")
write.taf(swo.n, dir="data")
