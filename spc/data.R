# Prepare data, write CSV data tables

# Before: f_annual.csv, natage.csv (boot/data/yft)
# After:  yft_f.csv, yft_n.csv (data)

library(TAF)

mkdir("data")

# Copy tables
cp("boot/data/yft/f_annual.csv", "data/yft_f.csv")
cp("boot/data/yft/natage.csv",   "data/yft_n.csv")
