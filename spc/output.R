# Extract results of interest, write CSV output tables

# Before: yft_f.csv, yft_n.csv (model)
# After:  yft_f.csv, yft_n.csv (output)

library(TAF)

mkdir("output")

# Copy tables
cp("model/*.csv", "output")
