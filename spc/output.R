# Extract results of interest, write CSV output tables

# Before: f.csv, n.csv (model)
# After:  f.csv, n.csv (output)

library(TAF)

mkdir("output")

# Copy tables
cp("model/*.csv", "output")
