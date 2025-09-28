# Prepare data, write CSV data tables

# Before: bet/f_annual.csv, bet/natage.csv,
#         yft/f_annual.csv, yft/natage.csv (boot/data)
# After:  bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (data)

library(TAF)

mkdir("data")

# Copy and rename tables
cp("boot/data/bet/f_annual.csv", "data/bet_f.csv")
cp("boot/data/bet/natage.csv",   "data/bet_n.csv")
cp("boot/data/yft/f_annual.csv", "data/yft_f.csv")
cp("boot/data/yft/natage.csv",   "data/yft_n.csv")
