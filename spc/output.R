# Extract results of interest, write CSV output tables

# Before: bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (model)
# After:  bet_f.csv, bet_n.csv,
#         yft_f.csv, yft_n.csv (output)

library(TAF)

mkdir("output")

# Copy tables
cp("model/*.csv", "output")
