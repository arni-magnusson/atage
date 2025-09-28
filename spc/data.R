# Prepare data, write CSV data tables

# Before: alb/f_annual.csv, alb/natage.csv,
#         bet/f_annual.csv, bet/natage.csv,
#         yft/f_annual.csv, yft/natage.csv (boot/data)
# After:  alb_f.csv, alb_n.csv,
#         bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (data)

library(TAF)

mkdir("data")

# Copy and rename tables
cp("boot/data/alb/f_annual.csv", "data/alb_f.csv")
cp("boot/data/alb/natage.csv",   "data/alb_n.csv")
cp("boot/data/bet/f_annual.csv", "data/bet_f.csv")
cp("boot/data/bet/natage.csv",   "data/bet_n.csv")
cp("boot/data/yft/f_annual.csv", "data/yft_f.csv")
cp("boot/data/yft/natage.csv",   "data/yft_n.csv")
